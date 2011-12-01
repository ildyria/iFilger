--[[
	Filger
	Copyright (c) 2009, Nils Ruesch
]]

local I, C, L = unpack(Tukui) -- Import: I - functions, constants, variables; C - config; L - locales

local Filger_Spells = C.Filger_Spells;

local class = select(2, UnitClass("player"));
local classcolor = RAID_CLASS_COLORS[class];
local active, bars = {}, {};

local time, Update;
local function OnUpdate(self, elapsed)
	time = self.filter == "CD" and self.expirationTime+self.duration-GetTime() or self.expirationTime-GetTime();
	if (self:GetParent().Mode == "BAR") then
		self.statusbar:SetValue(time);
		if time <= 60 then
			self.time:SetFormattedText("%.1f",(time));
		else
			self.time:SetFormattedText("%d:%.2d",(time/60),(time%60));
		end
	end
	if (time < 0 and self.filter == "CD") then
		local id = self:GetParent().Id;
		for index, value in ipairs(active[id]) do
			local spn = GetSpellInfo(value.data.spellID or value.data.slotID)
			if (self.spellName == spn) then
				tremove(active[id], index);
				break;
			end
		end
		self:SetScript("OnUpdate", nil);
		Update(self:GetParent());
	end
end


------------------------------------------------------------
-- Function to parse Buff name & ID
------------------------------------------------------------

local function FilgerUnitBuff(unitID, inSpellID, spn, absID)
  for i = 1, 40, 1 do
    local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID = UnitBuff(unitID, i)
    if ( not name ) then break end
    if ( inSpellID == spellID ) then
      return name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID
    end
    if ( name == spn and not(absID)) then
      return name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID
    end
  end
  return nil
end



------------------------------------------------------------
-- Function to parse Debuff name & ID
------------------------------------------------------------

local function FilgerUnitDebuff(unitID, inSpellID, spn, absID)
  for i = 1, 40, 1 do
    local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID = UnitDebuff(unitID, i)
    if ( not name ) then break end
    if ( inSpellID == spellID ) then
      return name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID
    end
    if ( name == spn and not(absID)) then
      return name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID
    end
  end
  return nil
end



------------------------------------------------------------
-- Function Update
------------------------------------------------------------

function Update(self)
	local id = self.Id;
	if (not bars[id]) then
		bars[id] = {};
	end
	for index, value in ipairs(bars[id]) do
		value:Hide();
	end
	local bar;
	for index, value in ipairs(active[id]) do
		bar = bars[id][index];
		if (not bar) then
			bar = CreateFrame("Frame", "FilgerAnchor"..id.."Frame"..index, self);
			bar:SetWidth(value.data.size);
			bar:SetHeight(value.data.size);
			bar:SetScale(1);
			bar:SetTemplate("Hydra")
			bar:SetAlpha(self.Alpha or 1);

			-- HORIZONTAL is created as RIGHT, position will be updated later
			if (index == 1) then
				bar:SetPoint(unpack(self.setPoint));
			else
				if (self.Direction == "UP") then
					bar:SetPoint("BOTTOM", bars[id][index-1], "TOP", 0, self.Interval);
				elseif (self.Direction == "RIGHT" or self.Direction == "HORIZONTAL") then
					bar:SetPoint("LEFT", bars[id][index-1], "RIGHT", self.Mode == "ICON" and self.Interval or self.BarWidth+self.Interval, 0);
				elseif (self.Direction == "LEFT") then
					bar:SetPoint("RIGHT", bars[id][index-1], "LEFT", self.Mode == "ICON" and -self.Interval or -(self.BarWidth+self.Interval), 0);
				else
					bar:SetPoint("TOP", bars[id][index-1], "BOTTOM", 0, -self.Interval);
				end
			end

			if (bar.icon) then
				bar.icon = _G[bar.icon:GetName()]
			else
				bar.icon = bar:CreateTexture("$parentIcon", "ARTWORK");
				bar.icon:SetPoint("TOPLEFT", I.Scale(2), I.Scale(-2))
				bar.icon:SetPoint("BOTTOMRIGHT", I.Scale(-2), I.Scale(2))
				bar.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9);
			end
			
			if (self.Mode == "ICON") then
				bar.cooldown = CreateFrame("Cooldown", "$parentCD", bar, "CooldownFrameTemplate");
				bar.cooldown:SetAllPoints(bar.icon);
				bar.cooldown:SetReverse();
				
				if (bar.count) then
					bar.count = _G[bar.count:GetName()]
				else
					bar.count = bar:CreateFontString("$parentCount", "OVERLAY");
					bar.count:SetFont(C.media.pixelfont, 16, "MONOCHROMEOUTLINE");
					bar.count:Point("BOTTOMRIGHT", 1, 0);
					bar.count:SetJustifyH("CENTER");
				end
			else
				if (bar.statusbar) then
					bar.statusbar = _G[bar.statusbar:GetName()]
				else
					bar.statusbar = CreateFrame("StatusBar", "$parentStatusBar", bar);
					bar.statusbar:SetWidth(I.Scale(self.BarWidth - 2));
					bar.statusbar:SetHeight(I.Scale(value.data.size - 10));
					bar.statusbar:SetStatusBarTexture(C.media.normTex);
					bar.statusbar:SetStatusBarColor(classcolor.r, classcolor.g, classcolor.b, 1);
					if ( self.IconSide == "LEFT" ) then
						bar.statusbar:SetPoint("BOTTOMLEFT", bar, "BOTTOMRIGHT", 6, 2);
					elseif ( self.IconSide == "RIGHT" ) then
						bar.statusbar:SetPoint("BOTTOMRIGHT", bar, "BOTTOMLEFT", -6, 2);
					end
				end
				bar.statusbar:SetMinMaxValues(0, 1);
				bar.statusbar:SetValue(0);
				
				if (bar.bg)then
					bar.bg = _G[bar.bg:GetName()]
				else
					bar.bg = CreateFrame("Frame","$parentBG", bar.statusbar)
					bar.bg:SetPoint("TOPLEFT", I.Scale(-2), I.Scale(2))
					bar.bg:SetPoint("BOTTOMRIGHT", I.Scale(2), I.Scale(-2))
					bar.bg:SetFrameStrata("BACKGROUND")
					bar.bg:SetTemplate("Hydra")
				end
				
				if (bar.background)then
					bar.background = _G[bar.background:GetName()]
				else
					bar.background = bar.statusbar:CreateTexture(nil, "BACKGROUND");
					bar.background:SetAllPoints();
					bar.background:SetTexture(C.media.normTex);
					bar.background:SetVertexColor(0, 0, 0, 0.5);
				end
				
				if (bar.time)then
					bar.time = _G[bar.time:GetName()]
				else			
					bar.time = bar.statusbar:CreateFontString("$parentTime", "ARTWORK");
					bar.time:SetFont(C.media.pixelfont, 14, "MONOCHROMEOUTLINE");
					bar.time:SetPoint("RIGHT", bar.statusbar, I.Scale(0), I.Scale(0));
				end
				
				if (bar.count) then
					bar.count = _G[bar.count:GetName()]
				else
					bar.count = bar:CreateFontString("$parentCount", "ARTWORK");
					bar.count:SetFont(C["media"].pixelfont, 16, "MONOCHROMEOUTLINE");
					bar.count:SetPoint("BOTTOMRIGHT", I.Scale(-2), I.Scale(2));
					bar.count:SetJustifyH("CENTER");
				end
				
				if (bar.spellname)then
					bar.spellname = _G[bar.spellname:GetName()]
				else
					bar.spellname = bar.statusbar:CreateFontString("$parentSpellName", "ARTWORK");
					bar.spellname:SetFont(C.media.pixelfont, 14, "MONOCHROMEOUTLINE");
					bar.spellname:SetPoint("LEFT", bar.statusbar, I.Scale(2), I.Scale(0));
					bar.spellname:SetPoint("RIGHT", bar.time, "LEFT");
					bar.spellname:SetJustifyH("LEFT");
				end
			end
			tinsert(bars[id], bar);
		end
		
		-- Update position of first 'bar' if direction is HORIZONTAL
		if ( self.Direction == "HORIZONTAL" and index == 1 ) then
			local totalWidth = (value.data.size + self.Interval) * ( #active[id] - 1 )
			-- Get base position
			local point, relativeFrame, offsetX, offsetY = unpack(self.setPoint)
			-- Update x-offset: remove half the total width and center adding half median width
			offsetX = offsetX - ( totalWidth  / 2 )
			-- Set position
			bar:SetPoint( point, relativeFrame, point, offsetX, offsetY )
		end

		bar.spellName = GetSpellInfo( value.data.spellID or value.data.slotID );
		
		bar.icon:SetTexture(value.icon);
		bar.count:SetText(value.count > 1 and value.count or "");
		if (self.Mode == "BAR") then
			bar.spellname:SetText(value.data.displayName or GetSpellInfo( value.data.spellID ));
		end
		if (value.duration > 0) then
			if (self.Mode == "ICON") then
				CooldownFrame_SetTimer(bar.cooldown, value.data.filter == "CD" and value.expirationTime or value.expirationTime-value.duration, value.duration, 1);
				if (value.data.filter == "CD") then
					bar.expirationTime = value.expirationTime;
					bar.duration = value.duration;
					bar.filter = value.data.filter;
					bar:SetScript("OnUpdate", OnUpdate);
				end
			else
				bar.statusbar:SetMinMaxValues(0, value.duration);
				bar.expirationTime = value.expirationTime;
				bar.duration = value.duration;
				bar.filter = value.data.filter;
				bar:SetScript("OnUpdate", OnUpdate);
			end
		else
			if (self.Mode == "ICON") then
				bar.cooldown:Hide();
			else
				bar.statusbar:SetMinMaxValues(0, 1);
				bar.statusbar:SetValue(1);
				bar.time:SetText("");
				bar:SetScript("OnUpdate", nil);
			end
		end
		
		bar:Show();
	end
end



------------------------------------------------------------
-- Function OnEvent
------------------------------------------------------------

local function OnEvent(self, event, ...)
	local unit = ...;
	if ( ( unit == "target" or unit == "player" or unit == "pet" or unit == "focus" ) or event == "PLAYER_TARGET_CHANGED" or event == "PLAYER_ENTERING_WORLD" or event == "SPELL_UPDATE_COOLDOWN" ) then
		local data, name, rank, icon, count, debuffType, duration, expirationTime, caster, isStealable, start, enabled, slotLink, spn, spid;
		local id = self.Id;
		for i=1, #Filger_Spells[class][id], 1 do
			data = Filger_Spells[class][id][i];
			if (data.filter == "BUFF") then
				spn = GetSpellInfo( data.spellID )
				name, rank, icon, count, debuffType, duration, expirationTime, caster, isStealable, _, spid = FilgerUnitBuff(data.unitId, data.spellID, spn, data.absID);
			elseif (data.filter == "DEBUFF") then
				spn = GetSpellInfo( data.spellID )
				name, rank, icon, count, debuffType, duration, expirationTime, caster, isStealable, _, spid = FilgerUnitDebuff(data.unitId, data.spellID, spn, data.absID);
			else
				if (data.spellID) then
					spn = GetSpellInfo(data.spellID)
					start, duration, enabled = GetSpellCooldown(spn);
					name, _, icon = GetSpellInfo(data.spellID);
				else
					slotLink = GetInventoryItemLink("player", data.slotID);
					if ( slotLink ) then
						name, _, _, _, _, _, _, _, _, icon = GetItemInfo(slotLink);
						if (not data.displayName) then
							data.displayName = name;
						end
						start, duration, enabled = GetInventoryItemCooldown("player", data.slotID);
					end
				end
				spid = 0;
				count = 0;
				caster = "all";
			end
			if (not active[id]) then
				active[id] = {};
			end
			for index, value in ipairs(active[id]) do
				if (data.spellID == value.data.spellID) then
					tremove(active[id], index);
					break;
				end
			end
			if (( name and ( data.caster ~= 1 and ( caster == data.caster or data.caster == "all" ))) or ( ( enabled or 0 ) > 0 and ( duration or 0 ) > 1.5 ) ) then
				table.insert(active[id], { data = data, icon = icon, count = count, duration = duration, expirationTime = expirationTime or start });
			end
		end
		Update(self);
	end
end



------------------------------------------------------------
-- spell list configuration
------------------------------------------------------------

local iFilgerSpells = CreateFrame("frame")

function I.UpdateSpellList(zone)

	if (not Filger_Spells[class]) then
		Filger_Spells[class] = {}
	end
	
	local loaded = "";

	if (Filger_Spells["ALL"]) then
		for i = 1, #Filger_Spells["ALL"], 1 do
			table.insert(Filger_Spells[class], Filger_Spells["ALL"][i])
		end
	loaded = loaded .. " ALL"
	end

	if (Filger_Spells["PVE"] and C["Filger"].PVE and (zone == "pve" or zone == "config")) then
		for i = 1, #Filger_Spells["PVE"], 1 do
			table.insert(Filger_Spells[class], Filger_Spells["PVE"][i])
		end
	loaded = loaded .. " PVE"
	end

	if (Filger_Spells["TANKS"] and C["Filger"].TANKS and (zone == "pve" or zone == "config")) then
		for i = 1, #Filger_Spells["TANKS"], 1 do
			table.insert(Filger_Spells[class], Filger_Spells["TANKS"][i])
		end
	loaded = loaded .. " TANKS"
	end

	if (Filger_Spells["PVP"] and C["Filger"].PVP and (zone == "pvp" or zone == "config")) then
		for i = 1, #Filger_Spells["PVP"], 1 do
			table.insert(Filger_Spells[class], Filger_Spells["PVP"][i])
		end
	loaded = loaded .. " PVP"
	end

	if (Filger_Spells["HUNTER/DRUID/ROGUE"] and (class == "HUNTER" or class == "DRUID" or class == "ROGUE")) then
		for i = 1, #Filger_Spells["HUNTER/DRUID/ROGUE"], 1 do
			table.insert(Filger_Spells[class], Filger_Spells["HUNTER/DRUID/ROGUE"][i])
		end
	loaded = loaded .. " HDR"
	end

--	I.Print("MODULES LOADED :"..loaded)
end

function I.UpdatesFramesList ()
	if (Filger_Spells and Filger_Spells[class]) then
		for index in pairs(Filger_Spells) do
			if (index ~= class) then
				Filger_Spells[index] = nil;
			end
		end
		
		local data, frame;
		for i = 1, #Filger_Spells[class], 1 do
			data = Filger_Spells[class][i];
			
			frame = CreateFrame("Frame", "FilgerAnchor"..i, UIParent);
			frame.Id = i;
			frame.Name = data.Name;
			frame.Direction = data.Direction or "DOWN";
			frame.IconSide = data.IconSide or "LEFT";
			frame.Interval = data.Interval or 3;
			frame.Mode = data.Mode or "ICON";
			frame.Alpha = data.Alpha or 1;
			if(frame.Mode ~= "ICON" and frame.Direction ~= "DOWN" and frame.Direction ~= "UP") then -- check if bar + right or left => ugly !
				frame.Direction = "UP";
			end
			frame.BarWidth = data.BarWidth or 200;
			frame.setPoint = data.setPoint or "CENTER";
			frame:SetWidth(Filger_Spells[class][i][1] and Filger_Spells[class][i][1].size or 100);
			frame:SetHeight(Filger_Spells[class][i][1] and Filger_Spells[class][i][1].size or 20);
			frame:SetPoint(unpack(data.setPoint));
			for j = 1, #Filger_Spells[class][i], 1 do
				data = Filger_Spells[class][i][j];
				if (data.filter == "CD") then
					frame:RegisterEvent("SPELL_UPDATE_COOLDOWN");
					break;
				end
			end
			frame:RegisterEvent("UNIT_AURA");
			frame:RegisterEvent("PLAYER_TARGET_CHANGED");
			frame:RegisterEvent("PLAYER_ENTERING_WORLD");
			frame:SetScript("OnEvent", OnEvent);
		end
	end
end

function checkzone()
	I.UpdateSpellList("config")
--[[	local inInstance, instanceType = IsInInstance()
	if inInstance and (instanceType == "raid" or instanceType == "party") then
		I.UpdateSpellList("pve")
	else
		I.UpdateSpellList("pvp")
	end]]
	I.UpdatesFramesList()
end

checkzone()

------------------------------------------------------------
-- configuration mode
------------------------------------------------------------

local function exec(self, enable)
	if enable then
		self:Show()
	else
		self:Hide()
	end
end

local enable = true
local origa1, origf, origa2, origx, origy

local function moving()
	-- don't allow moving while in combat
	if InCombatLockdown() then print(ERR_NOT_IN_COMBAT) return end

--	I.UpdateSpellList("config")
--	I.UpdatesFramesList()
	
	local data, frame;
	for i = 1, #Filger_Spells[class], 1 do
		data = Filger_Spells[class][i];
		
		frame = CreateFrame("Frame", "FilgerAnchor"..i, UIParent);
		frame.Id = i;
		frame.Name = data.Name;
		frame.Direction = data.Direction or "DOWN";
		frame.IconSide = data.IconSide or "LEFT";
		frame.Interval = data.Interval or 3;
		frame.Mode = data.Mode or "ICON";
		frame.Alpha = data.Alpha or 1;
		frame.BarWidth = data.BarWidth or 200;
		frame.setPoint = data.setPoint or "CENTER";
		frame:SetWidth(Filger_Spells[class][i][1] and Filger_Spells[class][i][1].size or 100);
		frame:SetHeight(Filger_Spells[class][i][1] and Filger_Spells[class][i][1].size or 20);
		frame:SetPoint(unpack(data.setPoint));

		if (enable) then
			for j = 1, #Filger_Spells[class][i], 1 do
				data = Filger_Spells[class][i][j];
				if (not active[i]) then
					active[i] = {};
				end
				if (data.spellID) then
					_, _, spellIcon = GetSpellInfo(data.spellID)
				else
					slotLink = GetInventoryItemLink("player", data.slotID);
					if (slotLink) then
						name, _, _, _, _, _, _, _, _, spellIcon = GetItemInfo(slotLink);
					end
				end
				table.insert(active[i], { data = data, icon = spellIcon, count = 9, duration = 0, expirationTime = 0 });
				if (j > 5) then 
					break;
				end
			end
			Update(frame);
		else
			for index, value in ipairs(active[i]) do
				active[i] = {};
			end
			Update(frame);
		end
	end

	
	for i = 1, getn(I.MoverFrames) do
		if I.MoverFrames[i] then		
			if enable then			
				I.MoverFrames[i]:EnableMouse(true)
				I.MoverFrames[i]:RegisterForDrag("LeftButton", "RightButton")
				I.MoverFrames[i]:SetScript("OnDragStart", function(self) 
					origa1, origf, origa2, origx, origy = I.MoverFrames[i]:GetPoint() 
					self.moving = true 
					self:SetUserPlaced(true) 
					self:StartMoving() 
				end)			
				I.MoverFrames[i]:SetScript("OnDragStop", function(self) 
					self.moving = false 
					self:StopMovingOrSizing() 
				end)			
				exec(I.MoverFrames[i], enable)			
				if I.MoverFrames[i].text then 
					I.MoverFrames[i].text:Show() 
				end
			else			
				I.MoverFrames[i]:EnableMouse(false)
				if I.MoverFrames[i].moving == true then
					I.MoverFrames[i]:StopMovingOrSizing()
					I.MoverFrames[i]:ClearAllPoints()
					I.MoverFrames[i]:SetPoint(origa1, origf, origa2, origx, origy)
				end
				exec(I.MoverFrames[i], enable)
				if I.MoverFrames[i].text then I.MoverFrames[i].text:Hide() end
				I.MoverFrames[i].moving = false
			end
		end
	end
	
	if enable then enable = false else enable = true end
end
SLASH_MOVINGIFILGER1 = "/mifilger"
SLASH_MOVINGIFILGER2 = "/moveifilger"
SlashCmdList["MOVINGIFILGER"] = moving

local protection = CreateFrame("Frame")
protection:RegisterEvent("PLAYER_REGEN_DISABLED")
protection:SetScript("OnEvent", function(self, event)
	if enable then return end
	print(ERR_NOT_IN_COMBAT)
	enable = false
	moving()
end)

local function positionsetup()
	-- reset movable stuff into original position
	for i = 1, getn(I.MoverFrames) do
		if I.MoverFrames[i] then I.MoverFrames[i]:SetUserPlaced(false) end
	end
	ReloadUI()
end

SLASH_RESETIFILGER1 = "/rifilger"
SLASH_RESETIFILGER2 = "/resetifilger"
SlashCmdList.RESETIFILGER = positionsetup