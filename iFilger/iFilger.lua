--[[
	Filger
	Copyright (c) 2009, Nils Ruesch
]]
local I, C, L = unpack(select(2, ...)) -- Import: I - functions, constants, variables; C - config; L - locales

local Filger_Spells;
if iFilgerBuffConfig then 
	Filger_Spells = iFilgerBuffConfig["Filger_Spells"]
	C.Filger_Spells = nil
	C.Filger_Panels = nil
else
	Filger_Spells = C.Filger_Spells
end

local class = select(2, UnitClass("player"));
local classcolor = RAID_CLASS_COLORS[class];
local active, bars = {}, {};


local time, Update;


local function OnUpdate(self, elapsed)
	time = ( self.filter == "CD" or self.filter == "ICD" ) and ( self.expirationTime + self.duration - GetTime() ) or ( self.expirationTime - GetTime() );
	if (self:GetParent().Mode == "BAR") then
		self.statusbar:SetValue(time);
		if time <= 60 then
			self.time:SetFormattedText("%.1f",(time));
		else
			self.time:SetFormattedText("%d:%.2d",(time/60),(time%60));
		end
	end
	if ( time < 0 and ( self.filter == "CD"  or self.filter == "ICD" ) )then
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
-- Tooltip functions
------------------------------------------------------------

local function TooltipOnEnter(self)
	if (self.spellID > 20) then -- coz slot ID... need to work on that soon : creating LUA error when mouseover a trinket tooltip
		local str = "spell:%s"
		local BadTotems = {
		[8076] = 8075,
		[8972] = 8071,
		[5677] = 5675,
		}
		GameTooltip:ClearLines()
		GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT", 0, 7)
		if BadTotems[self.spell] then
			GameTooltip:SetHyperlink(format(str, BadTotems[self.spellID]))
		else
			GameTooltip:SetHyperlink(format(str, self.spellID))
		end
--		GameTooltip:AddLine(GetSpellInfo(self.spellID), 1, 1, 1, 1, 1, 1)
--		GameTooltip:AddLine("ID : "..self.spellID, .6, .6, .6, .6, .6, .6)
		GameTooltip:Show()
	end
end

local function TooltipOnLeave(self)
        GameTooltip:Hide()
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
			
			if (C.general.tooltip) then
				bar:EnableMouse(true)
				bar:SetScript("OnEnter", TooltipOnEnter)
				bar:SetScript("OnLeave", TooltipOnLeave)
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
		bar.spellID = value.spid --data.spellID or value.data.slotID

		bar.icon:SetTexture(value.icon);
		bar.count:SetText(value.count > 1 and value.count or "");
		if (self.Mode == "BAR") then
			bar.spellname:SetText(value.data.displayName or GetSpellInfo( value.data.spellID ));
		end

		if (value.duration > 0) then
			if (self.Mode == "ICON") then
				CooldownFrame_SetTimer(bar.cooldown, ( value.data.filter == "CD" or value.data.filter == "ICD" ) and value.expirationTime or value.expirationTime - value.duration, value.duration, 1);
				if (value.data.filter == "CD" or value.data.filter == "ICD" ) then
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
		local data, name, icon, count, duration, expirationTime, caster, start, enabled, slotLink, spn, spid;
		local id = self.Id;
		for i=1, #Filger_Spells[class][id], 1 do
			name, duration, expirationTime, caster, start, enabled = nil, nil, nil, nil, nil, nil; -- cleaning vars...
			data = Filger_Spells[class][id][i];
			if (data.filter == "BUFF") then
				spn = GetSpellInfo( data.spellID )
				name, _, icon, count, _, duration, expirationTime, caster, _, _, spid = FilgerUnitBuff(data.unitId, data.spellID, spn, data.absID);
			elseif (data.filter == "IBUFF") then
				spn, _, icon = GetSpellInfo( data.spellID )
				name, _, _, count, _, duration, expirationTime, caster, _, _, spid = FilgerUnitBuff(data.unitId, data.spellID, spn, data.absID);
				if (not name) then
					name = spn
					duration = 0
					count = 0
					expirationTime = 0
					caster = "all"
					spid = data.spellID
				else
					name = nil
				end
			elseif (data.filter == "DEBUFF") then
				spn = GetSpellInfo( data.spellID )
				name, _, icon, count, _, duration, expirationTime, caster, _, _, spid = FilgerUnitDebuff(data.unitId, data.spellID, spn, data.absID);
			elseif (data.filter == "IDEBUFF" and InCombatLockdown()) then
				spn, _, icon = GetSpellInfo( data.spellID )
				name, _, _, count, _, duration, expirationTime, caster, _, _, spid = FilgerUnitDebuff(data.unitId, data.spellID, spn, data.absID);
				if (not name) then
					name = spn
					duration = 0
					count = 0
					expirationTime = 0
					caster = "player"
					spid = data.spellID
				elseif(caster ~= "player" and data.caster ~= "all") then
					name = spn
					duration = 0
					count = 0
					expirationTime = 0
					caster = "player"
					spid = data.spellID
				else
					name = nil
					duration = 0
					expirationTime = 0
				end
			elseif (data.filter == "CD") then
				if (data.spellID) then
					spn = GetSpellInfo(data.spellID)
					start, duration, enabled = GetSpellCooldown(spn);
					name, _, icon = GetSpellInfo(data.spellID);
					spid = data.spellID;
				else
					slotLink = GetInventoryItemLink("player", data.slotID);
					if ( slotLink ) then
						name, _, _, _, _, _, _, _, _, icon = GetItemInfo(slotLink);
						if (not data.displayName) then
							data.displayName = name;
						end
						start, duration, enabled = GetInventoryItemCooldown("player", data.slotID);
					end
					spid = data.slotID;
				end
				count = 0;
				caster = "all";
			elseif (data.filter == "ACD" and InCombatLockdown()) then
				spn = GetSpellInfo(data.spellID);
				start, duration, enabled = GetSpellCooldown(spn);
				name, _, icon = GetSpellInfo(data.spellID);
				spid = data.spellID;
				local usable, _ = IsUsableSpell(data.spellID);
				if(not enabled) then
					name = nil;
				elseif(enabled == 0 or (start > 0 and duration > 0)) then
					name = nil;
				end
				expirationTime = 0;
				duration = 0;
				count = 0;
				caster = "all";
			elseif ( data.filter == "ICD" ) then
				enabled = 0;
				if ( data.trigger == "BUFF" ) then
					spn = GetSpellInfo( data.spellID );
					name, _, icon, _, _, _, _, _, _, _, spid = FilgerUnitBuff("player", data.spellID, spn, data.absID);
				elseif (data.trigger == "DEBUFF") then
					spn = GetSpellInfo( data.spellID )
					name, _, icon, _, _, _, _, _, _, _, spid = FilgerUnitDebuff("player", data.spellID, spn, data.absID);
				end
				if ( data.slotID ) then
					slotLink = GetInventoryItemLink("player", data.slotID)
					name, _, _, _, _, _, _, _, _, icon = GetItemInfo(slotLink)
					spn = name
					spid = data.slotID
				end
				start = GetTime()
				duration = data.duration
				caster = "all"
				count = 0
				if ( name ) then
					enabled = 1
				end
			end
			
			if (not active[id]) then
				active[id] = {};
			end

			-- remove existing and insert if needed
			local toInsert = true -- by default, insert in active
			if ( data.filter == "ICD" ) then
				-- Don't insert if an ICD already exists
				for index, value in ipairs(active[id]) do
					if ( data.spellID == value.data.spellID and value.data.filter == "ICD" ) then
						toInsert = false
						break
					end
				end
			else
				-- Remove existing non-ICD
				for index, value in ipairs(active[id]) do
					if (data.spellID == value.data.spellID and value.data.filter ~= "ICD" ) then
						tremove(active[id], index)
						--print("#active["..id.."]"..(#active[id]))
					end
				end
			end

			if ( toInsert ) then
				if (( name and ( data.caster ~= 1 and ( caster == data.caster or data.caster == "all" ))) or ( ( enabled or 0 ) > 0 and ( duration or 0 ) > 1.5 ) ) then
					table.insert(active[id], { data = data, icon = icon, count = count, duration = duration, expirationTime = expirationTime or start, spid = spid });
				end
			end
		end
		Update(self);
	end
end



------------------------------------------------------------
-- spell list configuration
------------------------------------------------------------

function I.UpdateSpellList(zone)

	if (not Filger_Spells[class]) then
		Filger_Spells[class] = {}
	end
	
	for index, value in ipairs(Filger_Spells[class]) do
		if value.Enable == false then
			I.Print("class : " .. value.Name .. " disabled")
			tremove(Filger_Spells[class], index);
		end
	end

	local loaded = "";
	local loading = false;

	if (Filger_Spells["ALL"]) then
		for i = 1, #Filger_Spells["ALL"], 1 do
			-- merge similar spell-list (compare using Name and merge flag set) otherwise add another spell-list
			if Filger_Spells["ALL"][i].Enable then
				local merge = false
				local spellListAll = Filger_Spells["ALL"][i]
				local enable = spellListAll
				local spellListClass = nil
				for j = 1, #Filger_Spells[class], 1 do
					spellListClass = Filger_Spells[class][j]
					local mergeAll = spellListAll.Merge or false
					local mergeClass = spellListClass.Merge or false
					if ( spellListClass.Name == spellListAll.Name and ( mergeAll or mergeClass ) ) then
						merge = true
						break
					end
				end
				if ( not merge or spellListClass == nil ) then
					-- add another spell-list
					table.insert(Filger_Spells[class], Filger_Spells["ALL"][i])
				else
					-- merge spell-list but class-specific position, direction, ...
					--I.Print("MERGING SPELLS FROM "..spellListAll.Name)
					for j = 1, #spellListAll, 1 do
						table.insert( spellListClass, spellListAll[j] )
						loading = true
					end
				end
			end
		end
		if (loading) then
			loaded = loaded .. " ALL"
			loading = false
		end
	end

	if (Filger_Spells["PVE"] and (zone == "pve" or zone == "config")) then
		for i = 1, #Filger_Spells["PVE"], 1 do
			if (Filger_Spells["PVE"][i].Enable) then
				table.insert(Filger_Spells[class], Filger_Spells["PVE"][i])
				loading = true
			end
		end
		if (loading) then
			loaded = loaded .. " PVE"
			loading = false
		end
	end

	if (Filger_Spells["TANKS"] and (zone == "pve" or zone == "config")) then
		for i = 1, #Filger_Spells["TANKS"], 1 do
			if (Filger_Spells["TANKS"][i].Enable) then
				table.insert(Filger_Spells[class], Filger_Spells["TANKS"][i])
				loading = true
			end
		end
		if (loading) then
			loaded = loaded .. " TANKS"
			loading = false
		end
	end

	if (Filger_Spells["PVP"] and (zone == "pvp" or zone == "config")) then
		for i = 1, #Filger_Spells["PVP"], 1 do
			if (Filger_Spells["PVP"][i].Enable) then
				table.insert(Filger_Spells[class], Filger_Spells["PVP"][i])
				loading = true
			end
		end
		if (loading) then
			loaded = loaded .. " PVP"
			loading = false
		end
	end

	if (Filger_Spells["HUNTER/DRUID/ROGUE"] and (class == "HUNTER" or class == "DRUID" or class == "ROGUE")) then
		for i = 1, #Filger_Spells["HUNTER/DRUID/ROGUE"], 1 do
			if (Filger_Spells["HUNTER/DRUID/ROGUE"][i].Enable) then
				table.insert(Filger_Spells[class], Filger_Spells["HUNTER/DRUID/ROGUE"][i])
				loading = true
			end
		end
		if (loading) then
			loaded = loaded .. " PVP"
			loading = false
		end
	end

	I.Print("modules loaded :"..loaded)
end



------------------------------------------------------------
-- Cleanning spell list. Credits to SinaC
------------------------------------------------------------

function I.CleanSpellList ()
	
	-- clean other sections wich are not used
	for index in pairs(Filger_Spells) do
		if (index ~= class) then
			Filger_Spells[index] = nil
		end
	end

	-- remove invalid spell and empty tables
	local idx, data, frame = {}

	for i = 1, #Filger_Spells[class], 1 do
		local jdx, spn = {}
		data = Filger_Spells[class][i]

		for j = 1, #data, 1 do
			if (data[j].spellID) then
				spn = GetSpellInfo(data[j].spellID)
			else
				local slotLink = GetInventoryItemLink("player", data[j].slotID);
				if (slotLink) then
					spn = GetItemInfo(slotLink)
				end
			end

			if (not spn and not data[j].slotID) then -- Warning only for spell, not for trinket
				I.Print("WARNING - BAD spell/slot ID -> ".. (data[j].spellID or data[j].slotID or "UNKNOWN") .." !")
				table.insert(jdx, j)
			end
		end
		for _, v in ipairs(jdx) do
			table.remove(data, v)
		end

		if (#data == 0) then
			I.Print("WARNING - EMPTY section -> "..data.Name.." !")
			table.insert(idx, i)
		end
	end
	for _, v in ipairs(idx) do
		table.remove(Filger_Spells[class], v)
	end
end



------------------------------------------------------------
-- Create frame spell list
------------------------------------------------------------

function I.UpdatesFramesList ()
	if (Filger_Spells and Filger_Spells[class]) then
		
		for index in pairs(Filger_Spells) do
			if (index ~= class) then
				Filger_Spells[index] = nil;
			end
		end
		
		C.Filger_Panels = nil;

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
				if (data.filter == "CD" or data.filter == "ACD") then
					frame:RegisterEvent("SPELL_UPDATE_COOLDOWN");
					break;
				end
			end
			for j = 1, #Filger_Spells[class][i], 1 do
				data = Filger_Spells[class][i][j];
				if (data.unitId == "focus") then
					frame:RegisterEvent("PLAYER_FOCUS_CHANGED");
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



------------------------------------------------------------
-- checkzone for cleverzone check
------------------------------------------------------------

local function checkzone()

	if C["general"].cleverzone then
		-- yeah my default config is not really like default iFilger.
		local inInstance, instanceType = IsInInstance()
		if inInstance and (instanceType == "raid" or instanceType == "party") then
			I.UpdateSpellList("pve")
		else
			I.UpdateSpellList("pvp")
		end
	else
		I.UpdateSpellList("config")
	end
	I.CleanSpellList()
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
	
	local data, frame, name, spellIcon, slotLink;
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
				table.insert(active[i], { data = data, icon = spellIcon, count = 9, duration = 0, expirationTime = 0, spid = data.spellID or data.slotID });
				if (j > 3) then 
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