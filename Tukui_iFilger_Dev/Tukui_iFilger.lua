--[[
	Filger
	Copyright (c) 2009, Nils Ruesch
]]
local I, C, L = unpack(Tukui) -- Import: I - functions, constants, variables; C - config; L - locales

local _, _, _, isiFilgerenabled = GetAddOnInfo("iFilger")
if isiFilgerenabled == 1 then
	return
end

local Filger_Spells;
if iFilgerBuffConfig then 
	Filger_Spells = iFilgerBuffConfig["Filger_Spells"]
end

local class = select(2, UnitClass("player"));
local Filger = {}
Filger["frame_list"] = {}
local time, Update;

------------------------------------------------------------
-- Function to parse Buff name & ID
------------------------------------------------------------

function Filger:UnitBuff(unitID, inSpellID, spn, absID)
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

function Filger:UnitDebuff(unitID, inSpellID, spn, absID)
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

function Filger:TooltipOnEnter()
	if self.spellID > 20 then -- coz slot ID... need to work on that soon : creating LUA error when mouseover a trinket tooltip
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
		GameTooltip:Show()
	end
end

function Filger:TooltipOnLeave()
        GameTooltip:Hide()
end



------------------------------------------------------------
-- Function Update
------------------------------------------------------------



function Filger:UpdateCD()
	local time = self.value.start + self.value.duration - GetTime()
	if time < 0 then
		local frame = self:GetParent()
		frame.actives[self.activeIndex] = nil
		self:SetScript("OnUpdate", nil)
		Filger.DisplayActives(frame)
	end
end

function Filger:DisplayActives()
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
			aura = CreateFrame("Frame", "FilgerAnchor"..id.."Frame"..index, self)
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
				aura.count:SetFont(C["media"].uffont, 14, "OUTLINE")
				aura.count:Point("BOTTOMRIGHT", 1, -1)
				aura.count:SetJustifyH("CENTER")
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
	-- Update texture, count, cd, size, opacity, spid
	local totalWidth = 0
	index = 1
	for activeIndex, value in pairs(self.actives) do
		local aura = self.auras[index]
		aura.icon:SetTexture(value.icon)
		if value.count and value.count > 1 then
			aura.count:SetText(value.count)
			aura.count:Show()
		else
			aura.count:Hide()
		end
		if value.duration and value.duration > 0 then
			CooldownFrame_SetTimer(aura.cooldown, value.start, value.duration, 1)
			if value.data.filter == "CD" or value.data.filter == "ICD" then
				aura.value = value
				aura.activeIndex = activeIndex
				aura:SetScript("OnUpdate", Filger.UpdateCD)
			else
				aura:SetScript("OnUpdate", nil)
			end
			aura.cooldown:Show()
		else
			aura:SetScript("OnUpdate", nil)
			aura.cooldown:Hide()
		end
		
		aura.spellID = value.spid
		if C.Filger.tooltip then
			aura:EnableMouse(true)
			aura:SetScript("OnEnter", Filger.TooltipOnEnter)
			aura:SetScript("OnLeave", Filger.TooltipOnLeave)
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

function Filger:OnEvent(event, unit)
	if event == "SPELL_UPDATE_COOLDOWN" or event == "SPELL_UPDATE_USABLE" or event == "ACTIVE_TALENT_GROUP_CHANGED" or event == "PLAYER_TARGET_CHANGED" or event == "PLAYER_FOCUS_CHANGED" or event == "PLAYER_ENTERING_WORLD" or event == "UNIT_AURA" and (unit == "target" or unit == "player" or unit == "pet" or unit == "focus") then
		local ptt = GetPrimaryTalentTree()
		local needUpdate = false
		local id = self.Id
		if Filger["spells"][id] then
			for i = 1, #Filger["spells"][id], 1 do
				local data = Filger["spells"][id][i]
					local found = false
					local name, icon, count, duration, start, spid
					spid = 0
					if data.filter == "BUFF" and (not data.spec or data.spec == ptt) then
						local caster, spn, expirationTime
						spn, _, icon = GetSpellInfo(data.spellID)
						name, _, _, count, _, duration, expirationTime, caster, _, _, spid = Filger:UnitBuff(data.unitId, data.spellID, spn, data.absID)
						if name and (data.caster == "all" or data.caster == caster) then
							start = expirationTime - duration
							found = true
						end
					elseif data.filter == "DEBUFF" and (not data.spec or data.spec == ptt) then
						local caster, spn, expirationTime
						spn, _, icon = GetSpellInfo(data.spellID)
						name, _, _, count, _, duration, expirationTime, caster, _, _, spid = Filger:UnitDebuff(data.unitId, data.spellID, spn, data.absID)
						if name and (data.caster == "all" or data.caster == caster) then
							start = expirationTime - duration
							found = true
						end
					elseif data.filter == "IBUFF" and (not data.incombat or InCombatLockdown()) and (not data.spec or data.spec == ptt) then
						local spn
						spn, _, icon = GetSpellInfo(data.spellID)
						name = Filger:UnitBuff(data.unitId, data.spellID, spn, data.absID)
						if not name then
							found = true
							name = spn
							spid = data.spellID
						end
					elseif data.filter == "IDEBUFF" and (not data.incombat or InCombatLockdown()) and (not data.spec or data.spec == ptt) then
						local spn
						spn, _, icon = GetSpellInfo(data.spellID)
						name = Filger:UnitDebuff(data.unitId, data.spellID, spn, data.absID)
						if not name then
							found = true
							name = spn
							spid = data.spellID
						end
					elseif data.filter == "CD" and (not data.spec or data.spec == ptt) then
						if data.spellID then
							name, _, icon = GetSpellInfo(data.spellID)
							start, duration = GetSpellCooldown(name)
							spid = data.spellID
						elseif data.slotID then
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
						start, duration, enabled = GetSpellCooldown(name)
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
					elseif data.filter == "ICD" and (not data.spec or data.spec == ptt) then
						if data.trigger == "BUFF" then
							local spn
							spn, _, icon = GetSpellInfo(data.spellID)
							name, _, _, _, _, _, _, _, _, _, spid = Filger:UnitBuff("player", data.spellID, spn, data.absID)
						elseif data.trigger == "DEBUFF" then
							local spn
							spn, _, icon = GetSpellInfo(data.spellID)
							name, _, _, _, _, _, _, _, _, _, spid = Filger:UnitDebuff("player", data.spellID, spn, data.absID)
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
							if data.filter ~= "ICD" and data.filter ~= "ACD" and (self.actives[i].count ~= count or self.actives[i].start ~= start or self.actives[i].duration ~= duration or self.actives[i].spid ~= spid) then
								self.actives[i].count = count
								self.actives[i].start = start
								self.actives[i].duration = duration
								self.actives[i].spid = spid
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
			Filger.DisplayActives(self)
		end
	end
end


------------------------------------------------------------
-- spell list configuration
------------------------------------------------------------

function Filger:UpdateSpellList(zone)
	if (not Filger["spells"]) then
		Filger["spells"] = {}
	end

	local loaded = "";
	local loading = false;

	for index in pairs(Filger["spells"]) do
		Filger["spells"][index] = nil
	end
	
	if (Filger_Spells[class]) then
		for i = 1, #Filger_Spells[class], 1 do
			if (Filger_Spells[class][i].Enable) then
				table.insert(Filger["spells"], Filger_Spells[class][i])
				loading = true
			end
		end
		if (loading) then
			loaded = loaded .. " " .. class
			loading = false
		end
	end

	if (Filger_Spells["ALL"]) then
		for i = 1, #Filger_Spells["ALL"], 1 do
			-- merge similar spell-list (compare using Name and merge flag set) otherwise add another spell-list
			if Filger_Spells["ALL"][i].Enable then
				local merge = false
				local spellListAll = Filger_Spells["ALL"][i]
				local enable = spellListAll
				local spellListClass = nil
				for j = 1, #Filger["spells"], 1 do
					spellListClass = Filger["spells"][j]
					local mergeAll = spellListAll.Merge or false
					local mergeClass = spellListClass.Merge or false
					if ( spellListClass.Name == spellListAll.Name and ( mergeAll or mergeClass ) ) then
						merge = true
						break
					end
				end
				if ( not merge or spellListClass == nil ) then
					-- add another spell-list
					table.insert(Filger["spells"], Filger_Spells["ALL"][i])
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
				table.insert(Filger["spells"], Filger_Spells["PVE"][i])
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
				table.insert(Filger["spells"], Filger_Spells["TANKS"][i])
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
				table.insert(Filger["spells"], Filger_Spells["PVP"][i])
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
				table.insert(Filger["spells"], Filger_Spells["HUNTER/DRUID/ROGUE"][i])
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

function Filger:CleanSpellList ()

	-- remove invalid spell and empty tables
	local idx, data, frame = {}

	for i = 1, #Filger["spells"], 1 do
		local jdx, spn = {}
		data = Filger["spells"][i]

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
		table.remove(Filger["spells"], v)
	end
end



------------------------------------------------------------
-- Create frame spell list
------------------------------------------------------------

function Filger:UpdatesFramesList ()

	if (Filger["spells"]) then
		-- create frame for each spell-list
		for i = 1, #Filger["spells"], 1 do
			local data = Filger["spells"][i]
			local frame = CreateFrame("Frame", "FilgerFrame"..i.."_"..data.Name, UIParent)
--			I.Print("FRAME CREATED:"..data.Name)
			frame.Id = i
			frame.Name = data.Name
			frame.Direction = data.Direction or "UP"
			frame.IconSide = data.IconSide or "LEFT"
			frame.Interval = data.Interval or 3
			frame.Mode = data.Mode or "ICON"
			frame.Size = data.Size or 20
			frame.Alpha = data.Alpha or 1.0
			frame.setPoint = data.setPoint or "CENTER"
			frame:Width(data.Size or 20)
			frame:Height(data.Size or 20)
			frame:Point(unpack(data.setPoint))
			frame:SetAlpha(data.Alpha or 1.0)
			
			local CDFound = false
			local focusFound = false
			local targetFound = false
			for j = 1, #Filger["spells"][i], 1 do
				local data = Filger["spells"][i][j]
				if data.filter == "CD" or data.filter == "ACD" then
					CDFound = true
				elseif data.unitID == "target" then
					targetFound = true
				elseif data.unitID == "focus" then
					focusFound = true
				end
			end
			if CDFound then frame:RegisterEvent("SPELL_UPDATE_COOLDOWN") end
			if CDFound then frame:RegisterEvent("SPELL_UPDATE_USABLE") end
			if targetFound then frame:RegisterEvent("PLAYER_TARGET_CHANGED") end
			if focusFound then frame:RegisterEvent("PLAYER_FOCUS_CHANGED") end
			frame:RegisterEvent("UNIT_AURA")
			frame:RegisterEvent("PLAYER_ENTERING_WORLD")
			frame:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
			frame:SetScript("OnEvent", Filger.OnEvent)
			Filger["frame_list"][i] = frame
		end
	end
end



------------------------------------------------------------
-- checkzone for clever zone check
------------------------------------------------------------

function Filger:checkzone()
	if C["Filger"].cleverzone then
		-- yeah my default config is not really like default iFilger.
		local inInstance, instanceType = IsInInstance()
		if inInstance and (instanceType == "raid" or instanceType == "party") then
			Filger:UpdateSpellList("pve")
		else
			Filger:UpdateSpellList("pvp")
		end
	else
		Filger:UpdateSpellList("config")
	end
	Filger:CleanSpellList()
	Filger:UpdatesFramesList()
end

Filger:checkzone()

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
	
	for i = 1, #Filger["spells"], 1 do
		local data = Filger["spells"][i]
		frame = Filger["frame_list"][i]
		frame.actives = {}
		Filger.DisplayActives(frame)
		if enable then			
			for j = 1, math.min(4,#Filger["spells"][i]), 1 do
				local data = Filger["spells"][i][j]
				local name, icon
				if data.spellID then
					name, _, icon = GetSpellInfo(data.spellID)
				elseif data.slotID then
					local slotLink = GetInventoryItemLink("player", data.slotID)
					if slotLink then
						name, _, _, _, _, _, _, _, _, icon = GetItemInfo(slotLink)
					end
				end
				frame.actives[j] = {data = data, name = name, icon = icon, count = 9, start = 0, duration = 0, spid = data.spellID}
			end
		end
		Filger.DisplayActives(frame)
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


-------------------------------------------------------
-- DEBUG
-------------------------------------------------------

local DatatextColor = I.RGBToHex(unpack(C.media.datatextcolor1))
local kiloByteString = "%d "..DatatextColor.."kb".."|r"
local megaByteString = "%.2f "..DatatextColor.."mb".."|r"



---------------------------------
-- formatMemory : b => kb or mb
---------------------------------

local function formatMem(memory)
	local mult = 10^1
	if memory > 999 then
		local mem = ((memory/1024) * mult) / mult
		return string.format(megaByteString, mem)
	else
		local mem = (memory * mult) / mult
		return string.format(kiloByteString, mem)
	end
end


local iFilgerDebug = CreateFrame("Frame", "iFilger_Debug", UIParent)
iFilgerDebug:RegisterEvent("UNIT_AURA");
iFilgerDebug:RegisterEvent("PLAYER_TARGET_CHANGED");
iFilgerDebug:RegisterEvent("PLAYER_ENTERING_WORLD");