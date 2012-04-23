--[[
	Filger
	Copyright (c) 2009, Nils Ruesch
]]


local I, C, L = unpack(select(2, ...)) -- Import: I - functions, constants, variables; C - config; L - locales

local iFilger_Spells, iFilger_Config;
if iFilgerConfig then 
	iFilger_Spells = iFilgerConfig["Filger_Spells"]
	iFilger_Config = iFilgerConfig["Filger_Config"]
end

local class = select(2, UnitClass("player"))
local iFilger = {}
local classcolor = RAID_CLASS_COLORS[class]
iFilger["frame_list"] = {}
local time, Update;

------------------------------------------------------------
-- Function to parse Buff name & ID
------------------------------------------------------------

function iFilger:UnitBuff(unitID, inSpellID, spn, absID)
	if absID then
		for i = 1, 40, 1 do
			local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID = UnitBuff(unitID, i)
			if not name then break end
			if inSpellID == spellID then
				return name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID
			end
		end
	else
		return UnitBuff(unitID, spn)
	end
	return nil
end



------------------------------------------------------------
-- Function to parse Debuff name & ID
------------------------------------------------------------

function iFilger:UnitDebuff(unitID, inSpellID, spn, absID)
	if absID then
		for i = 1, 40, 1 do
			local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID = UnitDebuff(unitID, i)
			if not name then break end
			if inSpellID == spellID then
				return name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID
			end
		end
	else
		return UnitDebuff(unitID, spn)
	end
	return nil
end



------------------------------------------------------------
-- Tooltip functions
------------------------------------------------------------

local _, _, _, isElvUIenabled = GetAddOnInfo("ElvUI")
local _, _, _, isTukuienabled = GetAddOnInfo("Tukui")
local TooltipAnchor;
if isElvUIenabled and iFilger_Config.TooltipMover then
	TooltipAnchor = "TooltipMover"
elseif isTukuienabled and iFilger_Config.TooltipMover then
	TooltipAnchor = "TukuiTooltipAnchor"
else
	iFilger_Config.TooltipMover = false
end

isElvUIenabled = nil
isTukuienabled = nil

function iFilger:TooltipOnEnter()
	if self.spellID > 20 then -- coz slot ID... need to work on that soon : creating LUA error when mouseover a trinket tooltip
		local str = "spell:%s"
		local BadTotems = {
		[8076] = 8075,
		[8972] = 8071,
		[5677] = 5675,
		}
		GameTooltip:ClearLines()
		if iFilger_Config.TooltipMover then
			GameTooltip:SetOwner(_G[TooltipAnchor], "ANCHOR_TOPRIGHT", 0, 7)
		else
			GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT", 0, 7)
		end
		if BadTotems[self.spell] then
			GameTooltip:SetHyperlink(format(str, BadTotems[self.spellID]))
		else
			GameTooltip:SetHyperlink(format(str, self.spellID))
		end
		GameTooltip:Show()
	end
end

function iFilger:TooltipOnLeave()
        GameTooltip:Hide()
end



------------------------------------------------------------
-- Flash functions
------------------------------------------------------------

local StartFlash = function(self, duration)
	if not self.anim then
		self.anim = self:CreateAnimationGroup("Flash")
		
		self.anim.fadein = self.anim:CreateAnimation("ALPHA", "FadeIn")
		self.anim.fadein:SetChange(1)
		self.anim.fadein:SetOrder(2)

		self.anim.fadeout = self.anim:CreateAnimation("ALPHA", "FadeOut")
		self.anim.fadeout:SetChange(-1)
		self.anim.fadeout:SetOrder(1)
	end

	self.anim.fadein:SetDuration(duration)
	self.anim.fadeout:SetDuration(duration)
	self.anim:Play()
end

local StopFlash = function(self)
	if self.anim then
		self.anim:Finish()
	end
end

function iFilger:Flash()
	local time = self.value.start + self.value.duration - GetTime()

	if time < 0 then
		StopFlash(self)
	end
	
	if time < iFilger_Config.FlashThreshold then
		StartFlash(self, iFilger_Config.FlashDuration)
	end
end



------------------------------------------------------------
-- Function Update
------------------------------------------------------------



function iFilger:UpdateCDwithFlash()
	local time = self.value.start + self.value.duration - GetTime()

	if (self:GetParent().Mode == "BAR") then
		self.statusbar:SetValue(time);
		if time <= 60 then
			self.time:SetFormattedText("%.1f",(time));
		else
			self.time:SetFormattedText("%d:%.2d",(time/60),(time%60));
		end
	end

	if time < 0 then
		local frame = self:GetParent()
		frame.actives[self.activeIndex] = nil
		self:SetScript("OnUpdate", nil)
		iFilger.DisplayActives(frame)
	end
	
	iFilger.Flash(self)
end



function iFilger:UpdateCDwithoutFlash()
	local time = self.value.start + self.value.duration - GetTime()

	if (self:GetParent().Mode == "BAR") then
		self.statusbar:SetValue(time);
		if time <= 60 then
			self.time:SetFormattedText("%.1f",(time));
		else
			self.time:SetFormattedText("%d:%.2d",(time/60),(time%60));
		end
	end

	if time < 0 then
		local frame = self:GetParent()
		frame.actives[self.activeIndex] = nil
		self:SetScript("OnUpdate", nil)
		iFilger.DisplayActives(frame)
	end
end

-- yeah, ugly, i know... but nevermind ! xD



------------------------------------------------------------
-- Function Display
------------------------------------------------------------

function iFilger:DisplayActives()
	if not self.actives then return end
	if not self.auras then self.auras = {} end
	local id = self.Id
	local index
	local previous = nil
	index = 1
	for _, _ in pairs(self.actives) do
		local aura = self.auras[index]
		if not aura then
			-- create aura
			aura = CreateFrame("Frame", "iFilgerAnchor"..id.."Frame"..index, self)
			aura:Width(16) -- default value
			aura:Height(16) -- default value
			aura:SetScale(1)
			aura:SetTemplate("Default")
			-- anchor
			if index == 1 then
				aura:Point(unpack(self.setPoint))
			else
				if self.Direction == "UP" then
					aura:Point("BOTTOM", previous, "TOP", 0, self.Interval)
				elseif self.Direction == "RIGHT" or self.Direction == "HORIZONTAL" then
					aura:Point("LEFT", previous, "RIGHT", self.Interval, 0)
				elseif self.Direction == "LEFT" then
					aura:Point("RIGHT", previous, "LEFT", -self.Interval, 0)
				else
					aura:Point("TOP", previous, "BOTTOM", 0, -self.Interval)
				end
			end

			-- icon
			if aura.icon then
				aura.icon = _G[aura.icon:GetName()]
			else
				aura.icon = aura:CreateTexture("$parentIcon", "ARTWORK")
				aura.icon:Point("TOPLEFT", 2, -2)
				aura.icon:Point("BOTTOMRIGHT", -2, 2)
				aura.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
			end

			if (self.Mode == "ICON") then

				-- cooldown
				if aura.cooldown then
					aura.cooldown = _G[aura.cooldown:GetName()]
				else
					aura.cooldown = CreateFrame("Cooldown", "$parentCD", aura, "CooldownFrameTemplate")
					aura.cooldown:SetAllPoints(aura.icon)
					aura.cooldown:SetReverse()
				end

				-- count
				if aura.count then
					aura.count = _G[aura.count:GetName()]
				else
					aura.count = aura:CreateFontString("$parentCount", "OVERLAY")
					aura.count:SetFont(C["media"].pixelfont, 20, "OUTLINE")
					aura.count:Point("BOTTOMRIGHT", -1, 1)
					aura.count:SetJustifyH("CENTER")
				end
			else
				if (aura.statusbar) then
					aura.statusbar = _G[aura.statusbar:GetName()]
				else
					aura.statusbar = CreateFrame("StatusBar", "$parentStatusBar", aura);
					aura.statusbar:SetWidth(I.Scale(self.BarWidth - 2));
					aura.statusbar:SetHeight(I.Scale(5));
					aura.statusbar:SetStatusBarTexture(C.media.normTex);
					aura.statusbar:SetStatusBarColor(classcolor.r, classcolor.g, classcolor.b, 1);
					if ( self.IconSide == "LEFT" ) then
						aura.statusbar:SetPoint("BOTTOMLEFT", aura, "BOTTOMRIGHT", 6, 2);
					elseif ( self.IconSide == "RIGHT" ) then
						aura.statusbar:SetPoint("BOTTOMRIGHT", aura, "BOTTOMLEFT", -6, 2);
					end
				end
				aura.statusbar:SetMinMaxValues(0, 1);
				aura.statusbar:SetValue(0);
				
				if (aura.bg)then
					aura.bg = _G[aura.bg:GetName()]
				else
					aura.bg = CreateFrame("Frame","$parentBG", aura.statusbar)
					aura.bg:SetPoint("TOPLEFT", I.Scale(-2), I.Scale(2))
					aura.bg:SetPoint("BOTTOMRIGHT", I.Scale(2), I.Scale(-2))
					aura.bg:SetFrameStrata("BACKGROUND")
					aura.bg:SetTemplate("Hydra")
				end
				
				if (aura.background)then
					aura.background = _G[aura.background:GetName()]
				else
					aura.background = aura.statusbar:CreateTexture(nil, "BACKGROUND");
					aura.background:SetAllPoints();
					aura.background:SetTexture(C.media.normTex);
					aura.background:SetVertexColor(0, 0, 0, 0.5);
				end
				
				if (aura.time)then
					aura.time = _G[aura.time:GetName()]
				else			
					aura.time = aura.statusbar:CreateFontString("$parentTime", "ARTWORK");
					aura.time:SetFont(C.media.pixelfont, 14, "MONOCHROMEOUTLINE");
					aura.time:SetPoint("BOTTOMRIGHT", aura.statusbar, I.Scale(6), I.Scale(8));
					aura.time:SetJustifyH("RIGHT");
				end
				
				if (aura.count) then
					aura.count = _G[aura.count:GetName()]
				else
					aura.count = aura:CreateFontString("$parentCount", "ARTWORK");
					aura.count:SetFont(C["media"].pixelfont, 16, "MONOCHROMEOUTLINE");
					aura.count:SetPoint("BOTTOMRIGHT", I.Scale(-2), I.Scale(2));
					aura.count:SetJustifyH("CENTER");
				end
				
				if (aura.spellname)then
					aura.spellname = _G[aura.spellname:GetName()]
				else
					aura.spellname = aura.statusbar:CreateFontString("$parentSpellName", "ARTWORK");
					aura.spellname:SetFont(C.media.pixelfont, 14, "MONOCHROMEOUTLINE");
					aura.spellname:SetPoint("BOTTOMLEFT", aura.statusbar, I.Scale(-2), I.Scale(8));
					aura.spellname:SetPoint("RIGHT", aura.time, "LEFT");
					aura.spellname:SetJustifyH("LEFT");
				end
			end
			
			-- spellID
			aura.spellID = 0
			-- insert aura
			self.auras[index] = aura
		end
		-- save previous
		previous = aura
		-- next
		index = index + 1
	end

	-- Sort actives
	if not self.sortedIndex then self.sortedIndex = {} end

	-- Clear sorted (it would be easier to recreate self.sortedIndex or use a local array but this would not be GC-friendly)
	for n in pairs(self.sortedIndex) do
		self.sortedIndex[n] = 999 -- dummy high value
	end

	local activeCount = 1
	for n in pairs(self.actives) do
		self.sortedIndex[activeCount] = n
		activeCount = activeCount + 1
	end
	table.sort(self.sortedIndex)


	-- Update texture, count, cd, size, opacity, spid
	local totalWidth = 0
	index = 1

	--	for activeIndex, value in pairs(self.actives) do
	for n in pairs(self.sortedIndex) do
		if n >= activeCount then
			break -- sortedIndex may be greater than actives
		end
		local activeIndex = self.sortedIndex[n]
		local value = self.actives[activeIndex] -- Get sorted active
		local aura = self.auras[index]

		aura.spellName = GetSpellInfo( value.spid );
		if (self.Mode == "BAR") then
			aura.spellname:SetText(aura.spellName);
		end

		aura.icon:SetTexture(value.icon)
		if value.count and value.count > 1 then
			aura.count:SetText(value.count)
			aura.count:Show()
		else
			aura.count:Hide()
		end
		
		if value.duration and value.duration > 0 then
			if (self.Mode == "ICON") then
				CooldownFrame_SetTimer(aura.cooldown, value.start, value.duration, 1)
				if value.data.filter == "CD" or value.data.filter == "ICD" then
					aura.value = value
					aura.activeIndex = activeIndex
					if iFilger_Config.FlashIcon then
						aura:SetScript("OnUpdate", iFilger.UpdateCDwithFlash)
					else
						aura:SetScript("OnUpdate", iFilger.UpdateCDwithoutFlash)
					end
				else
					aura.value = value
					if iFilger_Config.FlashIcon then
						aura:SetScript("OnUpdate", iFilger.Flash)
					else
						aura:SetScript("OnUpdate", nil)
					end
				end
				aura.cooldown:Show()
			else
				aura.statusbar:SetMinMaxValues(0, value.duration);
				aura.value = value
				aura.activeIndex = activeIndex
				if iFilger_Config.FlashBar then
					aura:SetScript("OnUpdate", iFilger.UpdateCDwithFlash)
				else
					aura:SetScript("OnUpdate", iFilger.UpdateCDwithoutFlash)
				end
			end
		else
			if (self.Mode == "ICON") then
				aura.cooldown:Hide();
			else
				aura.statusbar:SetMinMaxValues(0, 1);
				aura.statusbar:SetValue(1);
				aura.time:SetText("");
			end
			aura:SetScript("OnUpdate", nil)
		end

		aura.spellID = value.spid
		
		if iFilger_Config.tooltip then
			aura:EnableMouse(true)
			aura:SetScript("OnEnter", iFilger.TooltipOnEnter)
			aura:SetScript("OnLeave", iFilger.TooltipOnLeave)
		end
		aura:Width(self.Size)
		aura:Height(self.Size)
		aura:SetAlpha(self.Alpha or 1.0)
		totalWidth = totalWidth + self.Size + self.Interval
		-- show
		aura:Show()
		-- next
		index = index + 1
	end
	-- Update horizontal anchoring
	if index > 1 and self.Direction == "HORIZONTAL" then
		-- Compute total width
		totalWidth = totalWidth - self.Size - self.Interval -- remove last interval
		-- Get base position
--		local point, relativeFrame, relativePoint, offsetX, offsetY = unpack(self.setPoint)
		local relativePoint, relativeFrame, offsetX, offsetY = unpack(self.setPoint)
		-- Update x-offset: remove half the total width
		offsetX = offsetX - totalWidth / 2
		-- Set position
		local aura = self.auras[1]
		aura:Point(relativePoint, relativeFrame, offsetX, offsetY)
	end
	-- Hide remaining
	for i = index, #self.auras, 1 do
		local aura = self.auras[i]
		aura:Hide()
	end
end



------------------------------------------------------------
-- Function OnEvent
------------------------------------------------------------

function iFilger:OnEvent(event, unit)
	if event == "SPELL_UPDATE_COOLDOWN" or event == "SPELL_UPDATE_USABLE" or event == "ACTIVE_TALENT_GROUP_CHANGED" or event == "PLAYER_TARGET_CHANGED" or event == "PLAYER_FOCUS_CHANGED" or event == "PLAYER_ENTERING_WORLD" or event == "UNIT_AURA" and (unit == "target" or unit == "player" or unit == "pet" or unit == "focus") then
		local ptt = GetPrimaryTalentTree()
		local needUpdate = false
		local id = self.Id
		if iFilger["spells"][id] then
			for i = 1, #iFilger["spells"][id], 1 do
				local data = iFilger["spells"][id][i]
					local found = false
					local name, icon, count, duration, start, spid
					spid = 0
					if data.filter == "BUFF" and (not data.spec or data.spec == ptt) then
						local caster, spn, expirationTime
						spn, _, _ = GetSpellInfo(data.spellID)
						name, _, icon, count, _, duration, expirationTime, caster, _, _, spid = iFilger:UnitBuff(data.unitId, data.spellID, spn, data.absID)
						if name and (data.caster == "all" or data.caster == caster) then
							start = expirationTime - duration
							found = true
						end
					elseif data.filter == "DEBUFF" and (not data.spec or data.spec == ptt) then
						local caster, spn, expirationTime
						spn, _, _ = GetSpellInfo(data.spellID)
						name, _, icon, count, _, duration, expirationTime, caster, _, _, spid = iFilger:UnitDebuff(data.unitId, data.spellID, spn, data.absID)
						if name and (data.caster == "all" or data.caster == caster) then
							start = expirationTime - duration
							found = true
						end
					elseif data.filter == "IBUFF" and (not data.incombat or InCombatLockdown()) and (not data.spec or data.spec == ptt) then
						local spn
						spn, _, icon = GetSpellInfo(data.spellID)
						name = iFilger:UnitBuff(data.unitId, data.spellID, spn, data.absID)
						if not name then
							found = true
							name = spn
							spid = data.spellID
						end
					elseif data.filter == "IDEBUFF" and (not data.incombat or InCombatLockdown()) and (not data.spec or data.spec == ptt) then
						local spn
						spn, _, icon = GetSpellInfo(data.spellID)
						name = iFilger:UnitDebuff(data.unitId, data.spellID, spn, data.absID)
						if not name then
							found = true
							name = spn
							spid = data.spellID
						end
					elseif data.filter == "CD" and (not data.spec or data.spec == ptt) then
						if data.spellID then
							name, _, icon = GetSpellInfo(data.spellID)
							if data.absID then
								start, duration = GetSpellCooldown(data.spellID)
							else
								start, duration = GetSpellCooldown(name)
							end
							spid = data.spellID
						elseif data.slotID then
							spid = data.slotID
							local slotLink = GetInventoryItemLink("player", data.slotID)
							if slotLink then
								name, _, _, _, _, _, _, _, _, icon = GetItemInfo(slotLink)
								start, duration = GetInventoryItemCooldown("player", data.slotID)
							end
						end
						if name and (duration or 0) > 1.5 then
							found = true
						end
					elseif data.filter == "ACD" and (not data.incombat or InCombatLockdown()) and (not data.spec or data.spec == ptt) then
						name, _, icon = GetSpellInfo(data.spellID)
						spid = data.spellID;
						if data.absID then
							start, duration, enabled = GetSpellCooldown(data.spellID)
						else
							start, duration, enabled = GetSpellCooldown(name)
						end
						found = true
						if(not enabled) then
							name = nil
							found = false
						elseif(enabled == 0 or (start > 0 and duration > 1.5)) then
							name = nil
							found = false
						end
						if name and (duration or 0) > 1.5 then
							found = false
						end
						duration = 0
					elseif data.filter == "ICD" and (not data.spec or data.spec == ptt) then
						if data.trigger == "BUFF" then
							local spn
							spn, _, icon = GetSpellInfo(data.spellID)
							name, _, _, _, _, _, _, _, _, _, spid = iFilger:UnitBuff("player", data.spellID, spn, data.absID)
						elseif data.trigger == "DEBUFF" then
							local spn
							spn, _, icon = GetSpellInfo(data.spellID)
							name, _, _, _, _, _, _, _, _, _, spid = iFilger:UnitDebuff("player", data.spellID, spn, data.absID)
						end
						if name then
							if data.slotID then
								local slotLink = GetInventoryItemLink("player", data.slotID)
								_, _, _, _, _, _, _, _, _, icon = GetItemInfo(slotLink)
							end
							duration = data.duration
							start = GetTime()
							found = true
						end
					end
					if found then
						if not self.actives then self.actives = {} end
						if not self.actives[i] then
							self.actives[i] = {data = data, name = name, icon = icon, count = count, start = start, duration = duration, spid = spid}
							needUpdate = true
						else
							if data.filter ~= "ICD" and data.filter ~= "ACD" and (self.actives[i].count ~= count or self.actives[i].start ~= start or self.actives[i].duration ~= duration) then
								self.actives[i].count = count
								self.actives[i].start = start
								self.actives[i].duration = duration
								needUpdate = true
							end
						end
					else
						if data.filter ~= "ICD" and self.actives and self.actives[i] then
							self.actives[i] = nil -- remove BUFF/DEBUFF/ACD (only when BUFF/DEBUFF modified, CD are removed in UpdateCD)
							needUpdate = true
						end
				end
			end
		end
		
		if needUpdate and self.actives then
			iFilger.DisplayActives(self)
		end
	end
end


------------------------------------------------------------
-- spell list configuration
------------------------------------------------------------

function iFilger:UpdateSpellList(zone)
	if (not iFilger["spells"]) then
		iFilger["spells"] = {}
	end

	local loaded = "";
	local loading = false;

	for index in pairs(iFilger["spells"]) do
		iFilger["spells"][index] = nil
	end
	
	if (iFilger_Spells[class]) then
		for i = 1, #iFilger_Spells[class], 1 do
			if (iFilger_Spells[class][i].Enable) then
				table.insert(iFilger["spells"], iFilger_Spells[class][i])
				loading = true
			end
		end
		if (loading) then
			loaded = loaded .. " " .. class
			loading = false
		end
	end

	if (iFilger_Spells["ALL"]) then
		for i = 1, #iFilger_Spells["ALL"], 1 do
			-- merge similar spell-list (compare using Name and merge flag set) otherwise add another spell-list
			if iFilger_Spells["ALL"][i].Enable then
				loading = true
				local merge = false
				local spellListAll = iFilger_Spells["ALL"][i]
				local enable = spellListAll
				local spellListClass = nil
				for j = 1, #iFilger["spells"], 1 do
					spellListClass = iFilger["spells"][j]
					local mergeAll = spellListAll.Merge or false
					local mergeClass = spellListClass.Merge or false
					if ( spellListClass.Name == spellListAll.Name and ( mergeAll or mergeClass ) ) then
						merge = true
						break
					end
				end
				if ( not merge or spellListClass == nil ) then
					-- add another spell-list
					table.insert(iFilger["spells"], iFilger_Spells["ALL"][i])
				else
					-- merge spell-list but class-specific position, direction, ...
					--I.Print("MERGING SPELLS FROM "..spellListAll.Name)
					for j = 1, #spellListAll, 1 do
						table.insert( spellListClass, spellListAll[j] )
					end
				end
			end
		end
		if (loading) then
			loaded = loaded .. " ALL"
			loading = false
		end
	end

	if (iFilger_Spells["PVE"] and (zone == "pve" or zone == "config")) then
		for i = 1, #iFilger_Spells["PVE"], 1 do
			if (iFilger_Spells["PVE"][i].Enable) then
				table.insert(iFilger["spells"], iFilger_Spells["PVE"][i])
				loading = true
			end
		end
		if (loading) then
			loaded = loaded .. " PVE"
			loading = false
		end
	end

	if (iFilger_Spells["TANKS"] and (zone == "pve" or zone == "config")) then
		for i = 1, #iFilger_Spells["TANKS"], 1 do
			if (iFilger_Spells["TANKS"][i].Enable) then
				table.insert(iFilger["spells"], iFilger_Spells["TANKS"][i])
				loading = true
			end
		end
		if (loading) then
			loaded = loaded .. " TANKS"
			loading = false
		end
	end

	if (iFilger_Spells["PVP"] and (zone == "pvp" or zone == "config")) then
		for i = 1, #iFilger_Spells["PVP"], 1 do
			if (iFilger_Spells["PVP"][i].Enable) then
				table.insert(iFilger["spells"], iFilger_Spells["PVP"][i])
				loading = true
			end
		end
		if (loading) then
			loaded = loaded .. " PVP"
			loading = false
		end
	end

	if (iFilger_Spells["HUNTER/DRUID/ROGUE"] and (class == "HUNTER" or class == "DRUID" or class == "ROGUE")) then
		for i = 1, #iFilger_Spells["HUNTER/DRUID/ROGUE"], 1 do
			if (iFilger_Spells["HUNTER/DRUID/ROGUE"][i].Enable) then
				table.insert(iFilger["spells"], iFilger_Spells["HUNTER/DRUID/ROGUE"][i])
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

function iFilger:CleanSpellList ()

	-- remove invalid spell and empty tables
	local idx, data, frame = {}

	for i = 1, #iFilger["spells"], 1 do
		local jdx, spn = {}
		data = iFilger["spells"][i]

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
		table.remove(iFilger["spells"], v)
	end
end



------------------------------------------------------------
-- Create frame spell list
------------------------------------------------------------

function iFilger:UpdatesFramesList ()

	if (iFilger["spells"]) then
		-- create frame for each spell-list
		for i = 1, #iFilger["spells"], 1 do
			local data = iFilger["spells"][i]
			local frame = CreateFrame("Frame", "iFilgerFrame"..i.."_"..data.Name, UIParent)
--			I.Print("FRAME CREATED:"..data.Name)
			frame.Id = i
			frame.Name = data.Name
			frame.Direction = data.Direction or "UP"
			frame.IconSide = data.IconSide or "LEFT"
			frame.Interval = data.Interval or 3
			frame.Mode = data.Mode or "ICON"
			frame.Size = data.Size or 20
			frame.Alpha = data.Alpha or 1.0
			frame.BarWidth = data.BarWidth or 200
			frame.setPoint = data.setPoint or "CENTER"
			frame:Width(data.Size or 20)
			frame:Height(data.Size or 20)
			frame:Point(unpack(data.setPoint))
			frame:SetAlpha(data.Alpha or 1.0)
			
			if(data.Mode ~= "ICON" and frame.Direction ~= "DOWN" and frame.Direction ~= "UP") then -- check if bar + right or left => ugly !
				frame.Direction = "UP";
			end
			
			frame:RegisterEvent("SPELL_UPDATE_COOLDOWN")
			frame:RegisterEvent("SPELL_UPDATE_USABLE")
			frame:RegisterEvent("PLAYER_FOCUS_CHANGED")
			frame:RegisterEvent("PLAYER_TARGET_CHANGED")
			frame:RegisterEvent("UNIT_AURA")
			frame:RegisterEvent("PLAYER_ENTERING_WORLD")
			frame:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
			frame:SetScript("OnEvent", iFilger.OnEvent)
			iFilger["frame_list"][i] = frame
		end
	end
end



------------------------------------------------------------
-- checkzone for clever zone check
------------------------------------------------------------

function iFilger:checkzone()
	if iFilger_Config.cleverzone then
		local inInstance, instanceType = IsInInstance()
		if inInstance and (instanceType == "raid" or instanceType == "party") then
			iFilger:UpdateSpellList("pve")
		else
			iFilger:UpdateSpellList("pvp")
		end
	else
		iFilger:UpdateSpellList("config")
	end
	iFilger:CleanSpellList()
	iFilger:UpdatesFramesList()
end

iFilger:checkzone()

-- local iFilgerZone = CreateFrame("Frame", "iFilger_Zone", UIParent)
-- iFilgerZone:RegisterEvent("PLAYER_ENTERING_WORLD")
-- iFilgerZone:RegisterEvent("ZONE_CHANGED_NEW_AREA")
-- iFilgerZone:RegisterEvent("ZONE_CHANGED")
-- iFilgerZone:SetScript("OnEvent", Filger.checkzone)


-- SLASH_SWITCHIFILGER1 = "/sifilger"
-- SLASH_SWITCHIFILGER2 = "/switchifilger"
-- SlashCmdList.SWITCHIFILGER = function() 
	-- if current_zone == "pve" then
		-- current_zone = "pvp"
		-- Filger:UpdateSpellList("pvp")
	-- else
		-- current_zone = "pve"
		-- Filger:UpdateSpellList("pve")
	-- end
-- end

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
	
	for i = 1, #iFilger["spells"], 1 do
		local data = iFilger["spells"][i]
		frame = iFilger["frame_list"][i]
		frame.actives = {}
		iFilger.DisplayActives(frame)
		if enable then			
			for j = 1, math.min(4,#iFilger["spells"][i]), 1 do
				local data = iFilger["spells"][i][j]
				local name, icon
				if data.spellID then
					name, _, icon = GetSpellInfo(data.spellID)
				elseif data.slotID then
					local slotLink = GetInventoryItemLink("player", data.slotID)
					if slotLink then
						name, _, _, _, _, _, _, _, _, icon = GetItemInfo(slotLink)
					end
				end
				frame.actives[j] = {data = data, name = name, icon = icon, count = 9, start = 0, duration = 0, spid = data.spellID or data.slotID}
			end
		end
		iFilger.DisplayActives(frame)
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