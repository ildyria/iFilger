local C, F, L = unpack(select(2, ...))

---------------------------------------------------------------------------------------------------------------------------------------
--		BEGIN SCRIPT
---------------------------------------------------------------------------------------------------------------------------------------

local myClass = select(2, UnitClass("player"));

local tabs = {  											-- List of headers and number of tabs inside each ones
	[1] = {
		name = myClass,										--	"MAGE","DEATHKNIGHT","PRIEST";"WARLOCK","DRUID","HUNTER","ROGUE","PALADIN","SHAMAN","WARRIOR","HUNTER/DRUID/ROGUE",
		tablist = {},										-- list of tabs => to know which ones to open and close
	},
	[2] = {
		name = "ALL",
		tablist = {},
	},
	[3] = {
		name = "PVP",
		tablist = {},
	},
	[4] = {
		name = "PVE",
		tablist = {},
	},
	[5] = {
		name = "TANKS",
		tablist = {},
	},
	[6] = {
		name = "HUNTER/DRUID/ROGUE",
		tablist = {},
	},
}

if myClass ~= "HUNTER" and myClass ~= "DRUID" and myClass ~= "ROGUE" then	-- remove the part we don't want.
	tabs[6] = nil
end

local header = {}											-- List of headers (frames)
local tab = {}												-- List of tab (frames)
local options = {}											-- List of options (frames)
local optionstxt = {}										-- List of optionstxt (frames)
local spelloptions = {}										-- List of spell options (frames)
local spelloptionstxt = {}									-- List of spell optionstxt (frames)

local Goptions = {}											-- List of global options (frames)
local Goptionstxt = {}										-- List of global optionstxt (frames)

local iFilger_Spells, iFilger_Config;						-- list of spells and config we want to modify

if iFilgerConfig then 
	iFilger_Spells = iFilgerConfig["Filger_Spells"]
	iFilger_Config = iFilgerConfig["Filger_Config"]
end

local help = {

	-- SIMPLE CONFIG
	["Name"] = {
		L["H_Name"], --"The name of the sub-section, what else ?",
	},
	["Enable"] = {
		L["H_Enable"], --"Enable or not the sub-section.",
	},
	["Size"] = {
		L["H_Size1"], --"Size of the Icons",
		L["H_Size2"], --"Must be a positive number",
	},
	["Direction"] = {
		L["H_Direction1"], --"Direction of expending :",
		L["H_Direction2"], --"|cffffffffUP|r, |cffffffffDOWN|r, |cffffffffLEFT|r, |cffffffffRIGHT|r or |cffffffffHORIZONTAL|r"
	},
	["IconSide"] = {
		L["H_IconSide1"], --"Position of the Icon in bar config mode :",
		L["H_IconSide2"], --"|cffffffffLEFT|r or |cffffffffRIGHT|r"
	},
	["Interval"] = {
		L["H_Interval"], --"Interval between Icons/Bars",
	},
	["Mode"] = {
		L["H_Mode1"], --"Display mode : ",
		L["H_Mode2"], --"|cffffffffICON|r or |cffffffffBAR|r"
	},
	["Alpha"] = {
		L["H_Alpha1"], --"Transparency :",
		L["H_Alpha2"], --"Float between 0 (invisible) and 1 (mat)",
	},
	["BarWidth"] = {
		L["H_BarWidth"], --"Width of the Bar (Bar Mode required)",
	},
	["Merge"] = {
		L["H_Merge"], --"Enable Merging.",
	},
	["Mergewith"] = {
		L["H_Mergewith"], --"Name of the list to merge with if Merge is enabled.",
	},
	
	
	-- GLOBAL CONFIG
	["autoupdate"] = {
		L["H_autoupdate"], -- "Automaticaly update the config."
	},
	["cleverzone"] = {
		L["H_cleverzone1"], --"Clever Zone:"
		L["H_cleverzone2"], --"Load only PvP in PvP zones and PvE in PvE zones"
		L["H_cleverzone3"], --"(Required to reload the first time you enter a PvE zone)"
	},
	["tooltip"] = {
		L["H_tooltip"], --"Tooltip on icons"
	},
	["TooltipMover"] = {
		L["H_TooltipMover"], --"Tooltip on TooltipMover for ElvUI and Tukui users."
	},
	["FlashIcon"] = {
		L["H_FlashIcon"], --"Flash when time left is below the threshold in icon mode."
	},
	["FlashBar"] = {
		L["H_FlashBar"], --"Flash when time left is below the threshold in bar mode."
	},
	["FlashThreshold"] = {
		L["H_FlashThreshold1"], --"Threshold when icons start flashing."
		L["H_FlashThreshold2"], --"Must be greater than 1."
	},
	["FlashDuration"] = {
		L["H_FlashDuration1"], -- "Duration of each flash."
		L["H_FlashDuration2"], -- "Must be a positive number, smaller => quicker."
	},
	
	
	-- SPELL CONFIG
	["spellID"] = {
		L["H_spellID"], --"Spell ID or slot ID : 13 or 14 for trinkets"
	},
	["filter"] = {
		L["H_filter1"], -- "List of available Filters : "
		L["H_filter2"], -- "|cffffffffBUFF|r - filtering buffs."
		L["H_filter3"], -- "|cffffffffDEBUFF|r - filtering debuffs."
		L["H_filter4"], -- "|cffffffffIBUFF|r - track a missing buff."
		L["H_filter5"], -- "|cffffffffIDEBUFF|r - track a missing debuff."
		L["H_filter6"], -- "|cffffffffCD|r - track cooldown."
		L["H_filter7"], -- "|cffffffffACD|r - track if a cooldown is available or not, require caster set to \"all\""
		L["H_filter8"], -- "|cffffffffICD|r - track Internal Cooldown, require trigger and duration"
	},
	["unitId"] = {
		L["H_unitId1"], -- "List of available unitId :"
		L["H_unitId2"], -- "|cffffffffplayer|r"
		L["H_unitId3"], -- "|cfffffffftarget|r"
		L["H_unitId4"], -- "|cfffffffffocus|r"
		L["H_unitId5"], -- "|cffffffffpet|r"
		L["H_unitId6"], -- "|cfffffffftargettarget|r"
		L["H_unitId7"], -- "|cffffffffparty1|r ..."
		L["H_unitId8"], -- "|cffffffffarena1|r ..."
	},
	["caster"] = {
		L["H_caster"], --"|cffffffffplayer|r or |cffffffffall|r - only cast by you or everyone"
	},
	["absID"] = {
		L["H_absID"], --"Only show if the ID is exactly the same"
	},
	["incombat"] = {
		L["H_incombat"], --"Only show while in combat"
	},
	["known"] = {
		L["H_known1"], -- "Only show if the SpellID is known by the player."
		L["H_known2"], -- "|cffff0000/!\\ YOU HAVE TO BE SURE OF THE SPELLID|r"
	},
	["spec"] = {
		L["H_spec"], --"Only show while in that spec : (|cffffffff1|r |cffffffff2|r |cffffffff3|r or |cffffffff4|r)"
	},
	["trigger"] = {
		L["H_trigger1"], -- "Trigger for ICD :"
		L["H_trigger2"], -- "|cffffffffBUFF|r - ICD start when the buffs show up."
		L["H_trigger3"], -- "|cffffffffDEBUFF|r - ICD start when the debuff show up."
		L["H_trigger4"], -- "|cffff0000/!\ NOTE THAT IT START WHEN THE"
		L["H_trigger5"], -- "TRIGGER SHOWS, NOT WHENT IT DISAPEAR.|r"
	},
	["duration"] = {
		L["H_duration"], --"Duration for ICD in second"
	},
	["timeleft"] = {
		L["H_timeleft"], --"Duration for ICD in second"
	},
	["icon"] = {
		L["H_icon1"], -- "Sorry, but the icon config is for"
		L["H_icon2"], -- "|cffff0000ADVANCED USERS|r and";
		L["H_icon3"], -- "have to be done by LUA."
	},
}



---------------------------------------------------------------------------------------------------------------------------------------
--		HELP TOOLTIP
---------------------------------------------------------------------------------------------------------------------------------------

local helptooltip = function (self,option)
		GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT", 0, 7)
		for i = 1, #help[option], 1 do
			GameTooltip:AddLine(help[option][i], .6, .6, .6)
		end
		GameTooltip:Show()
end


StaticPopupDialogs["RESET_IFILGER"] = {
	text = L["RESETMSG"],
	OnAccept = function() 
		iFilgerConfigUISV = nil
		iFilgerConfigUISVPC = nil
		ReloadUI() 
	end,
	OnCancel = function() ToggleFrame(iFilgerconfigPanel) end,
	button1 = ACCEPT,
	button2 = CANCEL,
	timeout = 0,
	whileDead = 1,
	preferredIndex = 3,
}



---------------------------------------------------------------------------------------------------------------------------------------
--		CREATE CONFIG PANEL
---------------------------------------------------------------------------------------------------------------------------------------

local iFilgerconfigPanel = CreateFrame("Frame", "iFilgerConfig", UIParent)
F.CreatePanel(iFilgerconfigPanel, 300, 400, "CENTER", UIParent, "CENTER", -300, 100)
F.SetBorder(iFilgerconfigPanel)
iFilgerconfigPanel:ThickBorder()
iFilgerconfigPanel:EnableMouse(true)
iFilgerconfigPanel:SetMovable(true)
iFilgerconfigPanel:RegisterForDrag("LeftButton")
iFilgerconfigPanel:SetScript("OnDragStart", function(self) self:SetUserPlaced(true) self:StartMoving() end)
iFilgerconfigPanel:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
iFilgerconfigPanel:Hide()

local configTitle = CreateFrame("Frame", "iFilgerConfigTitle", iFilgerconfigPanel)
F.CreatePanel(configTitle, 1, 24, "TOPLEFT", UIParent, "TOPLEFT", 0, 0)
configTitle:ThickBorder()
configTitle:SetPoint("TOPLEFT", F.Scale(4), F.Scale(-4))
configTitle:SetPoint("TOPRIGHT", F.Scale(-31), F.Scale(-4))
configTitle:SetFrameStrata("MEDIUM")

configTitle.text = configTitle:CreateFontString(nil, "OVERLAY")
configTitle.text:SetFont(C.font, 14)
configTitle.text:SetText(L["iFilger"])
configTitle.text:SetPoint("CENTER")

local configClose = CreateFrame("Frame", "iFilgerConfigClose", iFilgerconfigPanel)
F.CreatePanel(configClose, 24, 24, "TOPRIGHT", iFilgerconfigPanel, "TOPRIGHT", -4, -4)
configClose:SetFrameStrata("MEDIUM")
configClose:EnableMouse(true)
configClose:ThickBorder()
configClose:SetScript("OnEnter", function(self) self.text:SetTextColor(unpack(C["General"].Red)) end)
configClose:SetScript("OnLeave", function(self) self.text:SetTextColor(unpack(C["General"].White)) end)
configClose:SetScript("OnMouseDown", function() iFilgerconfigPanel:Hide() end)

configClose.text = configClose:CreateFontString(nil, "OVERLAY")
configClose.text:SetFont(C.font, 14)
configClose.text:SetText("X")
configClose.text:SetPoint("CENTER", configClose, 0, 0)


---------------------------------------------------------------------------------------------------------------------------------------
--		CREATE BOTTOM BUTTONS
---------------------------------------------------------------------------------------------------------------------------------------

local configApply = CreateFrame("Button", "iFilgerConfigApply", iFilgerconfigPanel, "SecureActionButtonTemplate")
F.CreatePanel(configApply, 147, 25, "TOPRIGHT", iFilgerconfigPanel, "BOTTOMRIGHT", 0, -5)
configApply:EnableMouse(true)
configApply:ThickBorder()
configApply:RegisterForClicks("AnyUp")
configApply:SetAttribute("type1", "macro")
configApply:SetAttribute("macrotext1", "/reload")
configApply:SetFrameStrata("MEDIUM")
configApply:SetScript("OnEnter", function(self) self.text:SetTextColor(unpack(C["General"].ClassColor)) end)
configApply:SetScript("OnLeave", function(self) self.text:SetTextColor(unpack(C["General"].White)) end)

configApply.text = configApply:CreateFontString(nil, "OVERLAY")
configApply.text:SetFont(C.font, 14)
configApply.text:SetText(L["Apply"])
configApply.text:SetPoint("CENTER", configApply, 0, -1)

local configReset = CreateFrame("Frame", "iFilgerConfigReset", iFilgerconfigPanel)
F.CreatePanel(configReset, 147, 25, "TOPLEFT", iFilgerconfigPanel, "BOTTOMLEFT", 0, -5)
configReset:SetFrameStrata("MEDIUM")
configReset:ThickBorder()
configReset:EnableMouse(true)
configReset:SetScript("OnEnter", function(self) self.text:SetTextColor(unpack(C["General"].Red)) end)
configReset:SetScript("OnLeave", function(self) self.text:SetTextColor(unpack(C["General"].White)) end)
configReset:SetScript("OnMouseDown", function(self) 
	ToggleFrame(iFilgerconfigPanel)
	StaticPopup_Show("RESET_IFILGER")
end)

configReset.text = configReset:CreateFontString(nil, "OVERLAY")
configReset.text:SetFont(C.font, 14)
configReset.text:SetText(L["Reset Config"])
configReset.text:SetPoint("CENTER", configReset, 0, -1)

local configMove = CreateFrame("Button", "iFilgerConfigMove", iFilgerconfigPanel, "SecureActionButtonTemplate")
F.CreatePanel(configMove, 147, 25, "TOP", configApply, "BOTTOM", 0, F.Scale(-5))
configMove:EnableMouse(true)
configMove:ThickBorder()
configMove:RegisterForClicks("AnyUp")
configMove:SetAttribute("type1", "macro")
configMove:SetAttribute("macrotext1", "/mifilger")
configMove:SetFrameStrata("MEDIUM")
configMove:SetScript("OnEnter", function(self) self.text:SetTextColor(unpack(C["General"].ClassColor)) end)
configMove:SetScript("OnLeave", function(self) self.text:SetTextColor(unpack(C["General"].White)) end)

configMove.text = configMove:CreateFontString(nil, "OVERLAY")
configMove.text:SetFont(C.font, 14)
configMove.text:SetText(L["Move Buffs"])
configMove.text:SetPoint("CENTER", configMove, 0, -1)

local configResetPosition = CreateFrame("Button", "iFilgerConfigMove", iFilgerconfigPanel, "SecureActionButtonTemplate")
F.CreatePanel(configResetPosition, 147, 25, "TOP", configReset, "BOTTOM", 0, F.Scale(-5))
configResetPosition:EnableMouse(true)
configResetPosition:ThickBorder()
configResetPosition:RegisterForClicks("AnyUp")
configResetPosition:SetAttribute("type1", "macro")
configResetPosition:SetAttribute("macrotext1", "/rifilger")
configResetPosition:SetFrameStrata("MEDIUM")
configResetPosition:SetScript("OnEnter", function(self) self.text:SetTextColor(unpack(C["General"].Red)) end)
configResetPosition:SetScript("OnLeave", function(self) self.text:SetTextColor(unpack(C["General"].White)) end)

configResetPosition.text = configResetPosition:CreateFontString(nil, "OVERLAY")
configResetPosition.text:SetFont(C.font, 14)
configResetPosition.text:SetText(L["Reset Buff Position"])
configResetPosition.text:SetPoint("CENTER", configResetPosition, 0, -1)



---------------------------------------------------------------------------------------------------------------------------------------
--		CREATE SPELL LIST SLIDER + OPTION FRAME
---------------------------------------------------------------------------------------------------------------------------------------

local iFilgerconfigSpellList = CreateFrame("Frame", "iFilgerconfigSpellList", iFilgerconfigPanel)
F.CreatePanel(iFilgerconfigSpellList, 175, 370, "TOPLEFT", iFilgerconfigPanel, "TOPRIGHT", 5, -30)
iFilgerconfigSpellList:ThickBorder()
iFilgerconfigSpellList:SetFrameStrata("MEDIUM")
iFilgerconfigSpellList:Show()

local iFilgerScrollArea = CreateFrame("ScrollFrame", "iFilgerScrollArea", iFilgerconfigSpellList, "UIPanelScrollFrameTemplate")
iFilgerScrollArea:Point("TOPLEFT", iFilgerconfigSpellList, "TOPLEFT", 8, -10)
iFilgerScrollArea:Point("BOTTOMRIGHT", iFilgerconfigSpellList, "BOTTOMRIGHT", -30, 8)
F.SkinScrollBar(iFilgerScrollAreaScrollBar)

local iFilgerconfigSpellListFrame = CreateFrame("Frame", "iFilgerconfigSpellListFrame", iFilgerScrollArea)
iFilgerconfigSpellListFrame:SetPoint("TOPLEFT", 0, 0)
iFilgerconfigSpellListFrame:SetWidth(165)
iFilgerconfigSpellListFrame:SetHeight(365)
iFilgerconfigSpellListFrame.list = {}

iFilgerScrollArea:SetScrollChild(iFilgerconfigSpellListFrame)

local iFilgerconfigSpell = CreateFrame("Frame", "iFilgerconfigSpell", iFilgerconfigSpellList)
F.CreatePanel(iFilgerconfigSpell, 250, 370, "TOPLEFT", iFilgerconfigSpellList, "TOPRIGHT", 5, 0)
iFilgerconfigSpell:ThickBorder()
iFilgerconfigSpell:SetFrameStrata("MEDIUM")


---------------------------------------------------------------------------------------------------------------------------------------
--		CREATE GLOBAL CONFIG OPTION
---------------------------------------------------------------------------------------------------------------------------------------

local iFilgerglobalconfigOptions = CreateFrame("Frame", "iFilgerGlobalConfigOptions", iFilgerconfigPanel)
F.CreatePanel(iFilgerglobalconfigOptions, 150, 350, "TOPLEFT", iFilgerconfigPanel, "TOPLEFT", 0, 0)
iFilgerglobalconfigOptions:SetPoint("TOPLEFT", F.Scale(4), F.Scale(-4))
iFilgerglobalconfigOptions:SetPoint("TOPRIGHT", F.Scale(-31), F.Scale(-4))
iFilgerglobalconfigOptions:SetFrameStrata("LOW")
iFilgerglobalconfigOptions:SetBackdropColor(.075, .075, .075, 0)
iFilgerglobalconfigOptions:SetBackdropBorderColor(.075, .075, .075, 0)
iFilgerglobalconfigOptions:Hide()

---------------------------------------------------------------------------------------------------------------------------------------
--		CREATE "WELCOME MESSAGE"
---------------------------------------------------------------------------------------------------------------------------------------

local iFilgerConfigMessage = CreateFrame("Frame", "iFilgerConfigMessage", iFilgerconfigPanel)
F.CreatePanel(iFilgerConfigMessage, 150, 350, "CENTER", iFilgerconfigPanel, "CENTER", 0, 0)
iFilgerConfigMessage:SetPoint("TOPLEFT", F.Scale(4), F.Scale(-4))
iFilgerConfigMessage:SetPoint("TOPRIGHT", F.Scale(-31), F.Scale(-4))
iFilgerConfigMessage:SetFrameStrata("LOW")
iFilgerConfigMessage:SetBackdropColor(.075, .075, .075, 0)
iFilgerConfigMessage:SetBackdropBorderColor(.075, .075, .075, 0)

iFilgerConfigMessage.text1 = iFilgerConfigMessage:CreateFontString(nil, "OVERLAY")
iFilgerConfigMessage.text1:SetFont(C.font, 16)
iFilgerConfigMessage.text1:SetPoint("CENTER", iFilgerConfigMessage, "CENTER", 0, 0)
iFilgerConfigMessage.text1:SetShadowColor(0,0,0)
iFilgerConfigMessage.text1:SetShadowOffset(1.25, -1.25)
iFilgerConfigMessage.text1:SetText(L["Config"])



---------------------------------------------------------------------------------------------------------------------------------------
--	LOAD SAVED VARIABLES BEFORE CREATING THE UI so we can use them
---------------------------------------------------------------------------------------------------------------------------------------

local SaveVariables = function(self, event, arg1)
	if arg1 == "iFilger_ConfigUI" then					-- this should secure loading. We don't want to begin loading saved variables when they are not yet aviable...
		local data = {}
		local indicetab = 0
		local numtab

		if iFilgerConfigVersion == nil or not(iFilgerConfigVersion[myClass]) then		-- if ConfigVersion Check not created then we erase all current settings. Sorry everybody for that.
--		if iFilgerConfigVersion == nil then		-- if ConfigVersion Check not created then we erase all current settings. Sorry everybody for that.
			iFilgerConfigUISV = nil
			iFilgerConfigUISVPC = nil
			iFilgerConfigVersion = {}			-- let's create an empty table
			iFilgerConfigVersion[myClass] = iFilger_Config["Config Version"][myClass]
			iFilgerConfigVersion["ALL"] = iFilger_Config["Config Version"]["ALL"]
			iFilgerConfigVersion["autoupdate"] = iFilger_Config["autoupdate"]
			DEFAULT_CHAT_FRAME:AddMessage("|cff1784d1[iFilger ConfigUI]|r "..L["VersionNotFound"])
		end

		local CVersion = { [myClass] = iFilger_Config["Config Version"][myClass], ["ALL"] = iFilger_Config["Config Version"]["ALL"] }
		local LVersion = { [myClass] = iFilgerConfigVersion[myClass], ["ALL"] = iFilgerConfigVersion["ALL"] }
		
		if (LVersion[myClass] < CVersion[myClass] or LVersion["ALL"] < CVersion["ALL"]) and iFilgerConfigVersion["autoupdate"] then
			-- Auto Update : we erases current vars.
			iFilgerConfigUISV = nil
			iFilgerConfigUISVPC = nil
			DEFAULT_CHAT_FRAME:AddMessage("|cff1784d1[iFilger ConfigUI]|r "..L["Updated"])
			DEFAULT_CHAT_FRAME:AddMessage("|cff1784d1[iFilger ConfigUI]|r "..L["ClassVersion"]..CVersion[myClass]..L["AllVersion"]..CVersion["ALL"])
		elseif LVersion[myClass] < CVersion[myClass] or LVersion["ALL"] < CVersion["ALL"] then
			DEFAULT_CHAT_FRAME:AddMessage("|cff1784d1[iFilger ConfigUI]|r "..L["UpdateRequired"])
			DEFAULT_CHAT_FRAME:AddMessage("|cff1784d1[iFilger ConfigUI]|r "..L["CurrentClassVersion"]..LVersion[myClass]..L["CurrentAllVersion"]..LVersion["ALL"])
			DEFAULT_CHAT_FRAME:AddMessage("|cff1784d1[iFilger ConfigUI]|r "..L["AvailableClassVersion"]..CVersion[myClass]..L["AvailableAllVersion"]..CVersion["ALL"])
			iFilgerConfigMessage.text1:SetText(L["WarningConfig"])
		end
		LVersion = nil
		CVersion = nil
		
		if iFilgerConfigUISV == nil then	-- there are no saved variables, let's load the default config ! 
			iFilgerConfigUISV = {}			-- let's create an empty table
			iFilgerConfigUISV["cleverzone"]		= iFilger_Config["cleverzone"] or false
			iFilgerConfigUISV["tooltip"]		= iFilger_Config["tooltip"] or false
			iFilgerConfigUISV["TooltipMover"]	= iFilger_Config["TooltipMover"] or false
			iFilgerConfigUISV["FlashIcon"]		= iFilger_Config["FlashIcon"] or false
			iFilgerConfigUISV["FlashBar"]		= iFilger_Config["FlashBar"] or false
			iFilgerConfigUISV["FlashThreshold"]	= iFilger_Config["FlashThreshold"] or 5
			iFilgerConfigUISV["FlashDuration"]	= iFilger_Config["FlashDuration"] or 0.5
			iFilgerConfigUISV["autoupdate"]		= iFilger_Config["autoupdate"] or iFilgerConfigVersion["autoupdate"] or false
		end

		if iFilgerConfigUISVPC == nil then	-- there are no saved variables, let's load the default config ! 
			-- update Version
			iFilgerConfigVersion[myClass] = iFilger_Config["Config Version"][myClass]
			iFilgerConfigVersion["ALL"] = iFilger_Config["Config Version"]["ALL"]

			iFilgerConfigUISVPC = {}			-- let's create an empty table
			-- local temp = {}
			-- temp["remove"] = -1
			-- temp["Cooldown"] = 0
			for j = 1, #tabs, 1 do
				numtab = #iFilger_Spells[tabs[j].name]			-- get number of tab in the header
				for i = 1, numtab, 1 do
					indicetab = indicetab + 1							-- increase tab id
					data = iFilger_Spells[tabs[j].name][i]				-- get data about the current 

					iFilgerConfigUISVPC[indicetab] = {}
					iFilgerConfigUISVPC[indicetab].Name = data.Name or "trolololo"
					iFilgerConfigUISVPC[indicetab].Enable = data.Enable or false
					iFilgerConfigUISVPC[indicetab].Direction = data.Direction or "UP"
					iFilgerConfigUISVPC[indicetab].IconSide = data.IconSide or "LEFT"
					iFilgerConfigUISVPC[indicetab].Interval = data.Interval or 3
					iFilgerConfigUISVPC[indicetab].Mode = data.Mode or "ICON"
					iFilgerConfigUISVPC[indicetab].Size = data.Size or 20
					iFilgerConfigUISVPC[indicetab].Alpha = data.Alpha or 1.0
					iFilgerConfigUISVPC[indicetab].BarWidth = data.BarWidth or 150
					iFilgerConfigUISVPC[indicetab].Merge = data.Merge or false
					iFilgerConfigUISVPC[indicetab].Mergewith = data.Mergewith or "Nothing"
					iFilgerConfigUISVPC[indicetab].setPoint = data.setPoint

					-- if data.Name == "Cooldown" then
						-- temp["Cooldown"] = indicetab
					-- end
					-- if data.Mergewith == "Cooldown" then
						-- temp["remove"] = temp["remove"] + #data
					-- end

					for k = 1, #data, 1 do
						table.insert(iFilgerConfigUISVPC[indicetab],data[k])
					end
				end
			end
			-- if temp["Cooldown"] ~= 0 then
				-- for i = (#iFilgerConfigUISVPC[temp["Cooldown"]] - temp["remove"]), #iFilgerConfigUISVPC[temp["Cooldown"]], 1 do
					-- iFilgerConfigUISVPC[temp["Cooldown"]][i] = nil -- remove useless spell ID...
				-- end
			-- end
		end
			
		-- CARE this will overwrite profiles.
		if iFilgerConfigUISV then  -- there are saved variables, let's load them !
			iFilger_Config["cleverzone"]		= iFilgerConfigUISV["cleverzone"] or false
			iFilger_Config["tooltip"]			= iFilgerConfigUISV["tooltip"] or false
			iFilger_Config["TooltipMover"]		= iFilgerConfigUISV["TooltipMover"] or false
			iFilger_Config["FlashIcon"]			= iFilgerConfigUISV["FlashIcon"] or false
			iFilger_Config["FlashBar"]			= iFilgerConfigUISV["FlashBar"] or false
			iFilger_Config["FlashThreshold"]	= iFilgerConfigUISV["FlashThreshold"] or 5
			iFilger_Config["FlashDuration"]		= iFilgerConfigUISV["FlashDuration"] or 0.5
		end

		indicetab = 0
		if iFilgerConfigUISVPC then  -- there are saved variables, let's load them !
			for j = 1, #tabs, 1 do
				numtab = #iFilger_Spells[tabs[j].name]							-- get number of tab in the header
				for i = 1, numtab, 1 do
					indicetab = indicetab + 1									-- increase tab id
					data = iFilgerConfigUISVPC[indicetab]						-- get data about the current tab
					iFilger_Spells[tabs[j].name][i] = {}						-- let's empty that shit !
					for k,_ in pairs(iFilger_Spells[tabs[j].name][i]) do
						iFilger_Spells[tabs[j].name][i][k] = nil
					end
					iFilger_Spells[tabs[j].name][i].Name = data.Name
					iFilger_Spells[tabs[j].name][i].Enable = data.Enable
					iFilger_Spells[tabs[j].name][i].Size = data.Size or 20
					iFilger_Spells[tabs[j].name][i].Direction = data.Direction or "UP"
					iFilger_Spells[tabs[j].name][i].IconSide = data.IconSide or "LEFT"
					iFilger_Spells[tabs[j].name][i].Interval = data.Interval or 3
					iFilger_Spells[tabs[j].name][i].Mode = data.Mode or "ICON"
					iFilger_Spells[tabs[j].name][i].Alpha = data.Alpha or 1.0
					iFilger_Spells[tabs[j].name][i].BarWidth = data.BarWidth or 150
					iFilger_Spells[tabs[j].name][i].Merge = data.Merge
					iFilger_Spells[tabs[j].name][i].Mergewith = data.Mergewith or "Nothing"
					iFilger_Spells[tabs[j].name][i].setPoint = data.setPoint

					for k = 1, #data, 1 do
						table.insert(iFilger_Spells[tabs[j].name][i],data[k])
					end
				end
			end
		end
	end
end

local saver = CreateFrame("FRAME")
saver:RegisterEvent("ADDON_LOADED")
saver:SetScript("OnEvent", SaveVariables)



---------------------------------------------------------------------------------------------------------------------------------------
--		FUNCTION CREATE OPTION
---------------------------------------------------------------------------------------------------------------------------------------

local create_spell_option = function(option,value,ypos)

	spelloptionstxt[option] = CreateFrame("Frame", nil, iFilgerconfigSpell)
	spelloptionstxt[option].text = spelloptionstxt[option]:CreateFontString(nil, "OVERLAY")
	spelloptionstxt[option].text:SetFont(C.font, 14)
	spelloptionstxt[option].text:SetPoint("TOPLEFT", iFilgerconfigSpell, "TOPLEFT", 20, -35 - ypos )
	spelloptionstxt[option].text:SetShadowColor(0,0,0)
	spelloptionstxt[option].text:SetShadowOffset(1.25, -1.25)
	spelloptionstxt[option].text:SetText(L[option].." : ")

	spelloptionstxt[option].help = CreateFrame("Frame", nil, iFilgerconfigSpell)
	spelloptionstxt[option].help:SetHeight(20)
	spelloptionstxt[option].help:SetWidth(20)
	spelloptionstxt[option].help:SetPoint("TOP", iFilgerconfigSpell, "TOP", 10, -35 - ypos )
	spelloptionstxt[option].help.text = spelloptionstxt[option].help:CreateFontString(nil, "OVERLAY")
	spelloptionstxt[option].help.text:SetFont(C.font, 12)
	spelloptionstxt[option].help.text:SetPoint("CENTER", spelloptionstxt[option].help, "CENTER", 0, 1 )
	spelloptionstxt[option].help.text:SetShadowColor(0,0,0)
	spelloptionstxt[option].help.text:SetShadowOffset(1.25, -1.25)
	spelloptionstxt[option].help.text:SetTextColor(1,1,0)
	spelloptionstxt[option].help.text:SetJustifyH("CENTER")
	spelloptionstxt[option].help.text:SetText("(?)")
	spelloptionstxt[option].help:SetScript("OnEnter", function(self)
		helptooltip(self,option)
	end)
	spelloptionstxt[option].help:SetScript("OnLeave", function(self) GameTooltip:Hide() end)

	spelloptions[option] = CreateFrame("Frame", nil, iFilgerconfigSpell)
	spelloptions[option].value = 0

	if option == "icon" then
	-- DO NOTHING ! HELL YEAH !
	elseif value == "boolean" then
		spelloptions[option].button = CreateFrame("CheckButton", "iFilgerConfigSpell"..option, spelloptions[option], "ChatConfigCheckButtonTemplate")
		F.SkinCheckBox(spelloptions[option].button)
		spelloptions[option].button:SetPoint("TOPLEFT", iFilgerconfigSpell, "TOPRIGHT", F.Scale(-105), F.Scale(-35 - ypos))
--		spelloptions[option].button:SetScript("OnClick", function(self) SetValue(option,(self:GetChecked() and true or false)) end)
	elseif value == "number" or value == "string" then
		spelloptions[option].editbox = CreateFrame("EditBox", "iFilgerConfigSpell"..option, spelloptions[option])
		spelloptions[option].editbox:SetAutoFocus(false)
		spelloptions[option].editbox:SetMultiLine(false)
		spelloptions[option].editbox:SetWidth(100)
		spelloptions[option].editbox:SetHeight(20)
		spelloptions[option].editbox:SetFontObject(GameFontNormal)		
		spelloptions[option].editbox:SetPoint("TOPLEFT", iFilgerconfigSpell, "TOPRIGHT", F.Scale(-105), F.Scale(-35 - ypos))
		spelloptions[option].editbox:SetTextColor(1,1,1)
		spelloptions[option].editbox:SetMaxLetters(25)
		spelloptions[option].editbox:SetTextInsets(3,0,0,0)
		spelloptions[option].editbox:SetBackdrop({
			bgFile = [=[Interface\Addons\iFilger_ConfigUI\media\textures\blank]=], 
			tiled = false,
		})
		spelloptions[option].editbox:SetBackdropColor(0,0,0,0.5)
		spelloptions[option].editbox:SetBackdropBorderColor(1,1,1,1)
		
		spelloptions[option].editbox:SetScript("OnEscapePressed", function(self) self:ClearFocus(); self:SetText(self:GetParent().value or "") end)
		spelloptions[option].editbox:SetScript("OnEnterPressed", function(self) self:ClearFocus() end)
	end
end

create_spell_option("spellID","string",25) -- spell ID
create_spell_option("filter","string",50) -- BUFF / DEBUFF / IBUFF (missing buff) / IDEBUFF (missing debuff) / CD / ACD (Available CD) / ICD (Internal Cooldown)
create_spell_option("unitId","string",75) -- player / target / focus / pet / targettarget....
create_spell_option("caster","string",100) -- player / all
create_spell_option("absID","boolean",125) -- true / false
create_spell_option("incombat","boolean",150) -- true / false
create_spell_option("known","number",175) -- true / false
create_spell_option("spec","number",200) -- 1 2 3 4
create_spell_option("trigger","string",225) -- BUFF / DEBUFF trigger for ICD
create_spell_option("duration","number",250) -- duration of ICD
create_spell_option("timeleft","number",275) -- timeleft
create_spell_option("icon","string",300) -- icon
-- /!\ ACD require caster = "all"

spelloptions["action"] = "ADD"

spelloptions["info"] = CreateFrame("Frame", nil, iFilgerconfigSpell)
spelloptions["info"]:SetWidth(25)
spelloptions["info"]:SetHeight(25)
spelloptions["info"]:SetTemplate("Default")
spelloptions["info"]:SetFrameStrata("MEDIUM")
spelloptions["info"]:Point("TOPRIGHT", iFilgerconfigSpell, "TOPRIGHT", F.Scale(-5), F.Scale(-5))
-- icon
spelloptions["info"].icon = spelloptions["info"]:CreateTexture("$parentIcon", "ARTWORK")
spelloptions["info"].icon:Point("TOPLEFT", F.Scale(2), F.Scale(-2))
spelloptions["info"].icon:Point("BOTTOMRIGHT", F.Scale(-2), F.Scale(2))
spelloptions["info"].icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
-- text
spelloptions["info"].text = spelloptions["info"]:CreateFontString(nil, "OVERLAY")
spelloptions["info"].text:SetFont(C.font, 16)
spelloptions["info"].text:SetPoint("BOTTOMRIGHT", spelloptions["info"], "BOTTOMLEFT", F.Scale(-5), 0)
spelloptions["info"].text:SetShadowColor(0,0,0)
spelloptions["info"].text:SetShadowOffset(1.25, -1.25)
spelloptions["info"].text:SetText("SPELL NAME")
spelloptions["info"].spellID = 1

spelloptions["info"]:EnableMouse(true)
spelloptions["info"]:SetScript("OnEnter", function(self)
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
end)
spelloptions["info"]:SetScript("OnLeave", function(self) GameTooltip:Hide() end)


---------------------------------------------------------------------------------------------------------------------------------------
--		FUNCTION LoadSpell
---------------------------------------------------------------------------------------------------------------------------------------

local function LoadSpell(indicetab,i)
	
	local data
	if i ~= "ADD" then
		data = iFilgerConfigUISVPC[indicetab][i]
		spelloptions["action"] = i
	else
		data = { spellID = 132210, unitId = "target", caster = "player", filter = "DEBUFF" }
		spelloptions["action"] = "ADD"
	end
	
	spelloptions["spellID"].editbox:SetText(data.spellID or data.slotID)	-- set spellID or slotID
	spelloptions["filter"].editbox:SetText(data.filter)						-- set filter
	spelloptions["unitId"].editbox:SetText(data.unitId or "")				-- set unitId
	spelloptions["caster"].editbox:SetText(data.caster or "")				-- set caster
	spelloptions["spec"].editbox:SetText(data.spec or "")					-- set spec
	spelloptions["trigger"].editbox:SetText(data.trigger or "")				-- set trigger
	spelloptions["known"].editbox:SetText(data.known or "")					-- set known
	spelloptions["duration"].editbox:SetText(data.duration or "")			-- set duration
	spelloptions["timeleft"].editbox:SetText(data.timeleft or "")			-- set timeleft
	if data.absID	then													-- set absID
		spelloptions["absID"].button:SetChecked()
	else
		spelloptions["absID"].button:SetChecked(false)
	end
	if data.incombat	then												-- set incombat
		spelloptions["incombat"].button:SetChecked()
	else
		spelloptions["incombat"].button:SetChecked(false)
	end

	if data.spellID then
		local spn,_,icon = GetSpellInfo(data.spellID)
		if data.icon then 
			spelloptions["info"].icon:SetTexture(data.icon)
		else
			spelloptions["info"].icon:SetTexture(icon)
		end
		spelloptions["info"].text:SetText(spn)
	else
		local slotLink = GetInventoryItemLink("player", data.slotID)
		if slotLink then
			_, _, _, _, _, _, _, _, _, icon = GetItemInfo(slotLink)
			spelloptions["info"].icon:SetTexture(icon)
		end
		spelloptions["info"].text:SetText("")
	end
	
	if i == "ADD" then
		spelloptions["info"].text:SetText(L["AddSpell"])
	end
	
	spelloptions["info"].spellID = data.spellID or data.slotID
	
	spelloptions["spellID"].value = data.spellID or data.slotID		-- set spellID or slotID
	spelloptions["filter"].value = data.filter						-- set filter
	spelloptions["unitId"].value = data.unitId						-- set unitId
	spelloptions["caster"].value = data.caster						-- set caster
	spelloptions["spec"].value = data.spec							-- set spec
	spelloptions["known"].value = data.known						-- set known
	spelloptions["trigger"].value = data.trigger					-- set trigger
	spelloptions["duration"].value = data.duration					-- set duration
	spelloptions["timeleft"].value = data.timeleft					-- set timeleft
	spelloptions["icon"].value = data.icon or "default"				-- set icon
	
	iFilgerconfigSpell:Show()

end



---------------------------------------------------------------------------------------------------------------------------------------
--		FUNCTION SAVE SPELL
---------------------------------------------------------------------------------------------------------------------------------------

local function SaveSpell()

-- iFilgerConfigUISVPC[options.ID]

	local aura = {}
	aura.spellID = tonumber(spelloptions["spellID"].editbox:GetText())
	aura.filter = tostring(spelloptions["filter"].editbox:GetText())
	aura.unitId = tostring(spelloptions["unitId"].editbox:GetText())
	aura.caster = tostring(spelloptions["caster"].editbox:GetText())
	aura.spec = tonumber(spelloptions["spec"].editbox:GetText())
	aura.trigger = tostring(spelloptions["trigger"].editbox:GetText())
	aura.duration = tonumber(spelloptions["duration"].editbox:GetText())
	aura.known = tonumber(spelloptions["known"].editbox:GetText())
	aura.timeleft = tonumber(spelloptions["timeleft"].editbox:GetText())
	aura.absID = spelloptions["absID"].button:GetChecked() and true or false
	aura.incombat = spelloptions["incombat"].button:GetChecked() and true or false
	aura.icon = spelloptions["icon"].value

	-- check values...
	if type(aura.spellID) ~= "number" then
		aura.spellID = 1
	elseif aura.spellID < 20 then
		aura.slotID = aura.spellID
		aura.spellID = nil
	end

	if	aura.caster ~= "player" and
		aura.caster ~= "all" 
	then
		aura.caster = "all"
	end
	
	if	aura.filter ~= "BUFF" and
		aura.filter ~= "DEBUFF" and
		aura.filter ~= "IBUFF" and
		aura.filter ~= "IDEBUFF" and
		aura.filter ~= "CD" and
		aura.filter ~= "ACD" and
		aura.filter ~= "ICD" 
	then
		aura.filter = "BUFF"
	elseif aura.filter == "CD" then
		aura.caster = nil
		aura.unitId = nil
		aura.absID = nil
		aura.timeleft = nil
	elseif aura.filter == "ACD" then
		aura.caster = "all"
		aura.unitId = nil
		aura.absID = nil
		aura.timeleft = nil
	elseif aura.filter == "ICD" then
		aura.caster = nil
		aura.unitId = nil
		aura.timeleft = nil
	end
	
	if aura.filter ~= "IDEBUFF" and aura.filter ~= "IBUFF" then
		aura.known = nil
	end

	if type(aura.spec) ~= "number" or aura.spec < 1 or aura.spec > 4 then
		aura.spec = nil
	end
	
	if type(aura.known) ~= "number" then
		aura.known = nil
	end

	if type(aura.timeleft) ~= "number" or aura.timeleft < 1 then
		aura.timeleft = nil
	end

	if aura.filter ~= "ICD" then
		aura.trigger = nil
		aura.duration = nil
	elseif aura.trigger ~= "BUFF" and aura.trigger ~= "DEBUFF" then
		aura.trigger = "BUFF" 
	end

	if aura.filter == "ICD" and (type(aura.duration) ~= "number" or aura.duration < 1 ) then
		aura.duration = 1
	end

	if aura.icon == "default" then
		aura.icon = nil 
	end

	if aura.absID ~= true then
		aura.absID = nil
	end

	if aura.incombat ~= true then
		aura.incombat = nil
	end

	if spelloptions["action"] == "ADD" then
		table.insert(iFilgerConfigUISVPC[options.ID],aura)
		LoadSpell(options.ID,#iFilgerConfigUISVPC[options.ID])
	else
		iFilgerConfigUISVPC[options.ID][spelloptions["action"]] = aura
		LoadSpell(options.ID,spelloptions["action"])
	end
end


---------------------------------------------------------------------------------------------------------------------------------------
--		ADD BUTTONS
---------------------------------------------------------------------------------------------------------------------------------------

spelloptions["Apply"] = CreateFrame("Frame", nil, iFilgerconfigSpell)
F.CreatePanel(spelloptions["Apply"], 110, 25, "TOPLEFT", iFilgerconfigSpell, "BOTTOM", F.Scale(5), F.Scale(-5))
spelloptions["Apply"]:EnableMouse(true)
spelloptions["Apply"]:SetFrameStrata("MEDIUM")

spelloptions["Apply"]:SetBackdropBorderColor(unpack(C["General"].BorderColorHeader))
spelloptions["Apply"]:ThickBorder()

spelloptions["Apply"].text = spelloptions["Apply"]:CreateFontString(nil, "OVERLAY")
spelloptions["Apply"].text:SetFont(C.font, 12)
spelloptions["Apply"].text:SetPoint("CENTER", spelloptions["Apply"], "CENTER", 0, F.Scale(-1))
spelloptions["Apply"].text:SetShadowColor(0,0,0)
spelloptions["Apply"].text:SetShadowOffset(1.25, -1.25)
spelloptions["Apply"].text:SetText(L["Apply"])

spelloptions["Apply"]:SetScript("OnEnter", function(self) self.text:SetTextColor(unpack(C["General"].ClassColor)) end)
spelloptions["Apply"]:SetScript("OnLeave", function(self) self.text:SetTextColor(unpack(C["General"].White)) end)
spelloptions["Apply"]:SetScript("OnMouseDown", function() SaveSpell() end)

spelloptions["Cancel"] = CreateFrame("Frame", nil, iFilgerconfigSpell)
F.CreatePanel(spelloptions["Cancel"], 110, 25, "TOPRIGHT", iFilgerconfigSpell, "BOTTOM", F.Scale(-5), F.Scale(-5))
spelloptions["Cancel"]:EnableMouse(true)
spelloptions["Cancel"]:SetFrameStrata("MEDIUM")

spelloptions["Cancel"]:SetBackdropBorderColor(unpack(C["General"].BorderColorHeader))
spelloptions["Cancel"]:ThickBorder()

spelloptions["Cancel"].text = spelloptions["Cancel"]:CreateFontString(nil, "OVERLAY")
spelloptions["Cancel"].text:SetFont(C.font, 12)
spelloptions["Cancel"].text:SetPoint("CENTER", spelloptions["Cancel"], "CENTER", 0, F.Scale(-1))
spelloptions["Cancel"].text:SetShadowColor(0,0,0)
spelloptions["Cancel"].text:SetShadowOffset(1.25, -1.25)
spelloptions["Cancel"].text:SetText(L["Cancel"])

spelloptions["Cancel"]:SetScript("OnEnter", function(self) self.text:SetTextColor(unpack(C["General"].ClassColor)) end)
spelloptions["Cancel"]:SetScript("OnLeave", function(self) self.text:SetTextColor(unpack(C["General"].White)) end)
spelloptions["Cancel"]:SetScript("OnMouseDown", function() iFilgerconfigSpell:Hide() end)




---------------------------------------------------------------------------------------------------------------------------------------
--		FUNCTION Show Spell List
---------------------------------------------------------------------------------------------------------------------------------------

local function ShowSpellList()
	local list = iFilgerConfigUISVPC[options.ID]
	local Framelist = iFilgerconfigSpellListFrame.list
	local data = {}
	local index = 0
	for i = 1, #list, 1 do
		index = index + 1
		data = list[i]
		
		if not Framelist[i] then
		
			Framelist[i] = CreateFrame("Frame", "iFilgerconfigSpellListFrame"..i, iFilgerconfigSpellListFrame)
			Framelist[i]:SetWidth(25)
			Framelist[i]:SetHeight(25)
			Framelist[i]:SetTemplate("Default")
			Framelist[i]:SetFrameStrata("MEDIUM")
			-- anchor
			if i == 1 then
				Framelist[i]:Point("TOPLEFT", iFilgerconfigSpellListFrame, "TOPLEFT", 2, -3)
			else
				Framelist[i]:Point("TOP", previous, "BOTTOM", 0, -5)
			end

			-- icon
			Framelist[i].icon = Framelist[i]:CreateTexture("$parentIcon", "ARTWORK")
			Framelist[i].icon:Point("TOPLEFT", 2, -2)
			Framelist[i].icon:Point("BOTTOMRIGHT", -2, 2)
			Framelist[i].icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
			
			-- spellID
			Framelist[i].spellID = 0
--			Framelist[i].ID = 0

			Framelist[i].delbutton = CreateFrame("Frame", "Delbutton"..i, Framelist[i])
			F.CreatePanel(Framelist[i].delbutton, 50, 25, "LEFT", Framelist[i], "RIGHT", 5, 0)
			Framelist[i].delbutton:EnableMouse(true)
			Framelist[i].delbutton.text = Framelist[i].delbutton:CreateFontString(nil,"OVERLAY",nil)
			Framelist[i].delbutton.text:SetFont(C.font, 12)
			Framelist[i].delbutton.text:SetText(L["Del"])
			Framelist[i].delbutton.text:SetPoint("CENTER", 0, 0)
			Framelist[i].delbutton.text:SetJustifyH("CENTER")
			Framelist[i].delbutton:SetScript("OnEnter", function(self) self.text:SetTextColor(unpack(C["General"].Red)) end)
			Framelist[i].delbutton:SetScript("OnLeave", function(self) self.text:SetTextColor(unpack(C["General"].White)) end)
			Framelist[i].delbutton:SetScript("OnMouseDown", function() table.remove(iFilgerConfigUISVPC[options.ID],i); ShowSpellList() end)
			
			Framelist[i].editbutton = CreateFrame("Frame", "Editbutton"..i, Framelist[i])
			F.CreatePanel(Framelist[i].editbutton, 50, 25, "LEFT", Framelist[i].delbutton, "RIGHT", 5, 0)
			if i == 1 then
				Framelist[i].editbutton:SetPoint("LEFT", Framelist[i].delbutton, "RIGHT", 5, 0.5)
			end
			Framelist[i].editbutton:EnableMouse(true)
			Framelist[i].editbutton.text = Framelist[i].editbutton:CreateFontString(nil,"OVERLAY",nil)
			Framelist[i].editbutton.text:SetFont(C.font, 12)
			Framelist[i].editbutton.text:SetText(L["Edit"])
			Framelist[i].editbutton.text:SetPoint("CENTER", 0, 0)
			Framelist[i].editbutton.text:SetJustifyH("CENTER")
			Framelist[i].editbutton:SetScript("OnEnter", function(self) self.text:SetTextColor(unpack(C["General"].Red)) end)
			Framelist[i].editbutton:SetScript("OnLeave", function(self) self.text:SetTextColor(unpack(C["General"].White)) end)
			Framelist[i].editbutton:SetScript("OnMouseDown", function() LoadSpell(options.ID,i) end)

			-- ToolTip
			Framelist[i]:EnableMouse(true)
			Framelist[i]:SetScript("OnEnter", function(self)
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
			end)
			Framelist[i]:SetScript("OnLeave", function(self) GameTooltip:Hide() end)

		end
		
		Framelist[i].spellID = data.spellID or data.slotID
--		Framelist[i].ID = i
		if data.icon then 
			Framelist[i].icon:SetTexture(data.icon)
		elseif data.spellID then
			local _,_,icon = GetSpellInfo(data.spellID)
			Framelist[i].icon:SetTexture(icon)
		else
			local slotLink = GetInventoryItemLink("player", data.slotID)
			if slotLink then
				_, _, _, _, _, _, _, _, _, icon = GetItemInfo(slotLink)
				Framelist[i].icon:SetTexture(icon)
			end
		end
		Framelist[i]:Show()

		-- save previous
		previous = Framelist[i]
	end
	
	iFilgerconfigSpellListFrame:SetHeight(index*25)
	
	for j = index+1, #Framelist, 1 do
		Framelist[j]:Hide()
	end

	iFilgerconfigSpellList:Show()
	iFilgerconfigSpell:Hide()
end



---------------------------------------------------------------------------------------------------------------------------------------
--	Saves Values (saved variable function)
---------------------------------------------------------------------------------------------------------------------------------------

local function SetValue(option,value)	
	--Determine if we should be copying our default settings to our player settings, this only happens if we're not using player settings by default
	local savevalue = true

	if value == "" then
		savevalue = false
	end

	-- check values...
	if option == "Size" and (type(value) ~= "number" or value < 1 ) then
		savevalue = false
	elseif option == "Direction" and value ~= "UP" and value ~= "DOWN" and value ~= "RIGHT" and value ~= "LEFT" and value ~= "HORIZONTAL" then
		savevalue = false
	elseif option == "IconSide" and value ~= "LEFT" and value ~= "RIGHT" then
		savevalue = false
	elseif option == "Interval" and type(value) ~= "number" then
		savevalue = false
	elseif option == "Mode" and value ~= "ICON" and value ~= "BAR" then
		savevalue = false
	elseif option == "Alpha" and (type(value) ~= "number" or value > 1 or value < 0) then
		savevalue = false
	elseif option == "BarWidth" and (type(value) ~= "number" or value < 1 ) then
		savevalue = false
	end

	if savevalue then
		iFilgerConfigUISVPC[options.ID][option] = value
	else
		if (type(iFilgerConfigUISVPC[options.ID][option]) ~= "boolean") then  -- set Value back
			options[option].editbox:SetText(iFilgerConfigUISVPC[options.ID][option])
		else
			if iFilgerConfigUISVPC[options.ID][option] then options[option].button:SetChecked(true) else options[option].button:SetChecked(false) end		-- set Enable
		end 
	end

end



---------------------------------------------------------------------------------------------------------------------------------------
--		CREATE OPTIONS
---------------------------------------------------------------------------------------------------------------------------------------

local iFilgerconfigOptions = CreateFrame("Frame", "iFilgerConfigOptions", iFilgerconfigPanel)
F.CreatePanel(iFilgerconfigOptions, 150, 350, "TOPLEFT", iFilgerconfigPanel, "TOPLEFT", 0, 0)
iFilgerconfigOptions:SetPoint("TOPLEFT", F.Scale(4), F.Scale(-4))
iFilgerconfigOptions:SetPoint("TOPRIGHT", F.Scale(-31), F.Scale(-4))
iFilgerconfigOptions:SetFrameStrata("LOW")
iFilgerconfigOptions:SetBackdropColor(.075, .075, .075, 0)
iFilgerconfigOptions:SetBackdropBorderColor(.075, .075, .075, 0)
iFilgerconfigOptions:Hide()



---------------------------------------------------------------------------------------------------------------------------------------
--		FUNCTION CREATE OPTION
---------------------------------------------------------------------------------------------------------------------------------------

local create_option = function(option,value,ypos)

	optionstxt[option] = CreateFrame("Frame", nil, iFilgerconfigOptions)
	optionstxt[option].text = optionstxt[option]:CreateFontString(nil, "OVERLAY")
	optionstxt[option].text:SetFont(C.font, 14)
	optionstxt[option].text:SetPoint("TOPLEFT", iFilgerconfigOptions, "TOPLEFT", 20, -35 - ypos )
	optionstxt[option].text:SetShadowColor(0,0,0)
	optionstxt[option].text:SetShadowOffset(1.25, -1.25)
	optionstxt[option].text:SetText(L[option].." : ")

	optionstxt[option].help = CreateFrame("Frame", nil, iFilgerconfigOptions)
	optionstxt[option].help:SetHeight(20)
	optionstxt[option].help:SetWidth(20)
	optionstxt[option].help:SetPoint("TOP", iFilgerconfigOptions, "TOP", 10, -35 - ypos )
	optionstxt[option].help.text = optionstxt[option].help:CreateFontString(nil, "OVERLAY")
	optionstxt[option].help.text:SetFont(C.font, 12)
	optionstxt[option].help.text:SetPoint("CENTER", optionstxt[option].help, "CENTER", 0, 1 )
	optionstxt[option].help.text:SetShadowColor(0,0,0)
	optionstxt[option].help.text:SetShadowOffset(1.25, -1.25)
	optionstxt[option].help.text:SetTextColor(1,1,0)
	optionstxt[option].help.text:SetJustifyH("CENTER")
	optionstxt[option].help.text:SetText("(?)")
	optionstxt[option].help:SetScript("OnEnter", function(self)
		helptooltip(self,option)
	end)
	optionstxt[option].help:SetScript("OnLeave", function(self) GameTooltip:Hide() end)

	options[option] = CreateFrame("Frame", nil, iFilgerconfigPanel)
	options[option].value = 0

	if option == "Name" then
		options[option].editbox = CreateFrame("EditBox", "iFilgerConfig"..option, options[option])
		options[option].editbox:SetAutoFocus(false)
		options[option].editbox:SetMultiLine(false)
		options[option].editbox:SetWidth(100)
		options[option].editbox:SetHeight(20)
		options[option].editbox:SetFontObject(GameFontNormal)		
		options[option].editbox:SetPoint("TOPLEFT", iFilgerconfigPanel, "TOPRIGHT", F.Scale(-105), F.Scale(-35 - ypos))
		options[option].editbox:SetTextColor(1,1,1)
		options[option].editbox:SetMaxLetters(25)
		options[option].editbox:SetTextInsets(3,0,0,0)
		options[option].editbox:SetBackdrop({
			bgFile = [=[Interface\Addons\iFilger_ConfigUI\media\textures\blank]=], 
			tiled = false,
		})
		options[option].editbox:SetBackdropColor(0,0,0,0.5)
		options[option].editbox:SetBackdropBorderColor(1,1,1,1)
	elseif value == "boolean" then
		options[option].button = CreateFrame("CheckButton", "iFilgerConfig"..option, options[option], "ChatConfigCheckButtonTemplate")
		F.SkinCheckBox(options[option].button)
		options[option].button:SetPoint("TOPLEFT", iFilgerconfigPanel, "TOPRIGHT", F.Scale(-105), F.Scale(-35 - ypos))
		options[option].button:SetScript("OnClick", function(self) SetValue(option,(self:GetChecked() and true or false)) end)
	elseif value == "number" or value == "string" then
		options[option].editbox = CreateFrame("EditBox", "iFilgerConfig"..option, options[option])
		options[option].editbox:SetAutoFocus(false)
		options[option].editbox:SetMultiLine(false)
		options[option].editbox:SetWidth(100)
		options[option].editbox:SetHeight(20)
		options[option].editbox:SetFontObject(GameFontNormal)		
		options[option].editbox:SetPoint("TOPLEFT", iFilgerconfigPanel, "TOPRIGHT", F.Scale(-105), F.Scale(-35 - ypos))
		options[option].editbox:SetTextColor(1,1,1)
		options[option].editbox:SetMaxLetters(25)
		options[option].editbox:SetTextInsets(3,0,0,0)
		options[option].editbox:SetBackdrop({
			bgFile = [=[Interface\Addons\iFilger_ConfigUI\media\textures\blank]=], 
			tiled = false,
		})
		options[option].editbox:SetBackdropColor(0,0,0,0.5)
		options[option].editbox:SetBackdropBorderColor(1,1,1,1)
--		options[option].editbox:SetText(option)
		
		options[option].okbutton = CreateFrame("Button", nil, options[option])
		options[option].okbutton:SetHeight(options[option].editbox:GetHeight())
		options[option].okbutton:SetWidth(options[option].editbox:GetHeight())
		options[option].okbutton:SetPoint("RIGHT", options[option].editbox, "LEFT", -2, 0)
		options[option].okbutton:SetBackdropBorderColor(1,1,1,1)
		
		options[option].oktext = options[option].okbutton:CreateFontString(nil,"OVERLAY",nil)
		options[option].oktext:SetFont(C.font,12)
		options[option].oktext:SetText("OK")
		options[option].oktext:SetPoint("CENTER", F.Scale(1), 0)
		options[option].oktext:SetJustifyH("CENTER")
		options[option].okbutton:Hide()

		if value == "number" then
			options[option].editbox:SetScript("OnEscapePressed", function(self) options[option].okbutton:Hide() self:ClearFocus() self:SetText(options[option].value) end)
			options[option].editbox:SetScript("OnChar", function(self) options[option].okbutton:Show() end)
			options[option].editbox:SetScript("OnEnterPressed", function(self) options[option].okbutton:Hide() self:ClearFocus() SetValue(option,tonumber(self:GetText())) end)
			options[option].okbutton:SetScript("OnMouseDown", function(self) options[option].editbox:ClearFocus() self:Hide() SetValue(option,tonumber(options[option].editbox:GetText())) end)
		else
			options[option].editbox:SetScript("OnEscapePressed", function(self) options[option].okbutton:Hide() self:ClearFocus() self:SetText(options[option].value) end)
			options[option].editbox:SetScript("OnChar", function(self) options[option].okbutton:Show() end)
			options[option].editbox:SetScript("OnEnterPressed", function(self) options[option].okbutton:Hide() self:ClearFocus() SetValue(option,tostring(self:GetText())) end)
			options[option].okbutton:SetScript("OnMouseDown", function(self) options[option].editbox:ClearFocus() self:Hide() SetValue(option,tostring(options[option].editbox:GetText())) end)
		end
	end
end

create_option("Name","string",25)
create_option("Enable","boolean",50)
create_option("Size","number",75)
create_option("Direction","string",100)
create_option("IconSide","string",125)
create_option("Interval","number",150)
create_option("Mode","string",175)
create_option("Alpha","number",200)
create_option("BarWidth","number",225)
create_option("Merge","boolean",250)
create_option("Mergewith","string",275)

iFilgerconfigSpellList["ADD"] = CreateFrame("Frame", nil, iFilgerconfigSpellList)
F.CreatePanel(iFilgerconfigSpellList["ADD"], 125, 25, "TOP", iFilgerconfigSpellList, "BOTTOM", 0, F.Scale(-5))
iFilgerconfigSpellList["ADD"]:EnableMouse(true)
iFilgerconfigSpellList["ADD"]:SetFrameStrata("MEDIUM")

iFilgerconfigSpellList["ADD"]:SetBackdropBorderColor(unpack(C["General"].BorderColorHeader))
iFilgerconfigSpellList["ADD"]:ThickBorder()

iFilgerconfigSpellList["ADD"].text = iFilgerconfigSpellList["ADD"]:CreateFontString(nil, "OVERLAY")
iFilgerconfigSpellList["ADD"].text:SetFont(C.font, 12)
iFilgerconfigSpellList["ADD"].text:SetPoint("CENTER", iFilgerconfigSpellList["ADD"], "CENTER", 0, F.Scale(-1))
iFilgerconfigSpellList["ADD"].text:SetShadowColor(0,0,0)
iFilgerconfigSpellList["ADD"].text:SetShadowOffset(1.25, -1.25)
iFilgerconfigSpellList["ADD"].text:SetText(L["Add"])

iFilgerconfigSpellList["ADD"]:SetScript("OnEnter", function(self) self.text:SetTextColor(unpack(C["General"].ClassColor)) end)
iFilgerconfigSpellList["ADD"]:SetScript("OnLeave", function(self) self.text:SetTextColor(unpack(C["General"].White)) end)
iFilgerconfigSpellList["ADD"]:SetScript("OnMouseDown", function() LoadSpell(options.ID,"ADD") end)

options["ID"] = 0



---------------------------------------------------------------------------------------------------------------------------------------
--		FUNCTION HIDE TAB CONTENT (TAB => OPTIONS)
---------------------------------------------------------------------------------------------------------------------------------------

 local hide_tab_content = function(indicetab)
	iFilgerconfigOptions:Hide()
	options.Name:Hide()
	options.Enable:Hide()
	options.Size:Hide()
	options.Direction:Hide()
	options.IconSide:Hide()
	options.Interval:Hide()
	options.Mode:Hide()
	options.Alpha:Hide()
	options.BarWidth:Hide()
	options.Merge:Hide()
	options.Mergewith:Hide()
	iFilgerconfigSpellList:Hide()
	iFilgerconfigSpell:Hide()
	if iFilgerconfigSpellListFrame.list[1] then
		for i = 1, #iFilgerconfigSpellListFrame.list, 1  do
			iFilgerconfigSpellListFrame.list[i]:Hide()
		end
	end
end



---------------------------------------------------------------------------------------------------------------------------------------
--		FUNCTION SHOW TAB CONTENT (TAB => OPTIONS)
---------------------------------------------------------------------------------------------------------------------------------------

local show_tab_content = function(indicetab)
	iFilgerconfigOptions:Show()
	options.Name:Show()
	options.Enable:Show()
	options.Size:Show()
	options.Direction:Show()
	options.IconSide:Show()
	options.Interval:Show()
	options.Mode:Show()
	options.Alpha:Show()
	options.BarWidth:Show()
	options.Merge:Show()
	options.Mergewith:Show()
	
	local data = iFilgerConfigUISVPC[indicetab]
	options.Name.editbox:SetText(data.Name or "blabla")				-- set Name
	if data.Enable	then											-- set Enable
		options.Enable.button:SetChecked()
	else
		options.Enable.button:SetChecked(false)
	end
	options.Size.editbox:SetText(data.Size or 20)					-- set Size
	options.Direction.editbox:SetText(data.Direction or "UP")		-- set Direction
	options.IconSide.editbox:SetText(data.IconSide or "LEFT")		-- set IconSide
	options.Interval.editbox:SetText(data.Interval or 3)			-- set Interval
	options.Mode.editbox:SetText(data.Mode or "ICON")				-- set Mode
	options.Alpha.editbox:SetText(data.Alpha or 1.0)				-- set Alpha
	options.BarWidth.editbox:SetText(data.BarWidth or 150)			-- set Barwidth
	if data.Merge	then											-- set Merge
		options.Merge.button:SetChecked() 
	else 
		options.Merge.button:SetChecked(false) 
	end
	options.Mergewith.editbox:SetText(data.Mergewith or "Nothing")	-- set Mergewith
	options.Size.value = data.Size or 20							-- set Size
	options.Direction.value = data.Direction or "UP"				-- set Direction
	options.IconSide.value = data.IconSide or "LEFT"				-- set IconSide
	options.Interval.value = data.Interval or 3						-- set Interval
	options.Mode.value = data.Mode or "ICON"						-- set Mode
	options.Alpha.value = data.Alpha or 1.0							-- set Alpha
	options.BarWidth.value = data.BarWidth or 150					-- set Barwidth
	options.Mergewith.value = data.Mergewith or "Nothing"			-- set Mergewith
	options.ID = indicetab
	ShowSpellList()
end



---------------------------------------------------------------------------------------------------------------------------------------
--		FUNCTION OPEN TAB CONTENT (TAB => OPTIONS)
---------------------------------------------------------------------------------------------------------------------------------------

local open_tab = function(indicetab,indicehead)
	for j = 1, #tabs[indicehead].tablist, 1 do
		numtab = tabs[indicehead]["tablist"][j]
		tab[numtab].status = "close"
		tab[numtab].text:SetTextColor(unpack(C["General"].BorderColorConfig))
		hide_tab_content(numtab)
	end
	tab[indicetab].text:SetTextColor(unpack(C["General"].White))
	tab[indicetab].status = "open"
	show_tab_content(indicetab)
end



---------------------------------------------------------------------------------------------------------------------------------------
--		FUNCTION HIDE TAB (used in show_tab() : HEADER => TAB)
---------------------------------------------------------------------------------------------------------------------------------------

local hide_tab = function(i)
	local numtab
	for j = 1, #tabs[i].tablist, 1 do
		numtab = tabs[i]["tablist"][j]
		tab[numtab]:Hide()
		tab[numtab].status = "close"
		tab[numtab].text:SetTextColor(unpack(C["General"].BorderColorConfig))
		hide_tab_content(numtab)
	end
end



---------------------------------------------------------------------------------------------------------------------------------------
--		FUNCTION CLOSE ALL
---------------------------------------------------------------------------------------------------------------------------------------

local close_all_tab = function()
	iFilgerConfigMessage:Hide()
	iFilgerglobalconfigOptions:Hide()

	hide_tab(1) -- hide 1st tab
	header[1].status = "close"
	header[1]:SetBackdropBorderColor(unpack(C["General"].BorderColorHeader))

	for j = 2, #tabs, 1 do -- hide all the others
		hide_tab(j)
		header[j]:ClearAllPoints()
		header[j]:SetPoint("TOP", header[j-1], "BOTTOM", 0, F.Scale(-5))
		header[j].status = "close"
		header[j]:SetBackdropBorderColor(unpack(C["General"].BorderColorHeader))
	end
end



---------------------------------------------------------------------------------------------------------------------------------------
--		FUNCTION SHOW TAB LIST OF A HEADER (HEADER => TAB)
---------------------------------------------------------------------------------------------------------------------------------------

local show_tab = function(i)
	
	close_all_tab()
	
	local numtab -- show tab of the headers
	for j = 1, #tabs[i].tablist, 1 do
		numtab = tabs[i]["tablist"][j]
		tab[numtab]:Show()
	end

	header[i]:SetBackdropBorderColor(unpack(C["General"].White))
	header[i].status = "open"

	if i < #tabs then -- move anchor of last tab
		header[i+1]:ClearAllPoints()
		header[i+1]:SetPoint("TOP", tab[numtab], "BOTTOM", 0, F.Scale(-5))
	end

	-- open 1st tab of the header
	numtab = tabs[i]["tablist"][1]
	show_tab_content(numtab)
	tab[numtab].text:SetTextColor(unpack(C["General"].White))
	tab[numtab].status = "open"
end



---------------------------------------------------------------------------------------------------------------------------------------
--		FUNCTION CREATE TAB HEADER
---------------------------------------------------------------------------------------------------------------------------------------

local create_tab_head = function(i,name)
	header[i] = CreateFrame("Frame", nil, iFilgerconfigPanel)
	if(i == 1) then
		F.CreatePanel(header[i], 125, 25, "TOPRIGHT", iFilgerconfigPanel, "TOPLEFT", F.Scale(-5), F.Scale(-70))
	else
		F.CreatePanel(header[i], 125, 25, "TOP", header[i-1], "BOTTOM", 0, F.Scale(-5))
	end
	header[i]:EnableMouse(true)
	header[i]:SetFrameStrata("LOW")

	header[i].ID = i
	header[i].status = "close"
	header[i]:SetBackdropBorderColor(unpack(C["General"].BorderColorHeader))
	header[i]:ThickBorder()
	
	header[i].text = header[i]:CreateFontString(nil, "OVERLAY")
	header[i].text:SetFont(C.font, 12)
	header[i].text:SetPoint("CENTER", header[i], "CENTER", 0, F.Scale(-1))
	header[i].text:SetShadowColor(0,0,0)
	header[i].text:SetShadowOffset(1.25, -1.25)
	header[i].text:SetText(name)
	header[i]:SetScript("OnEnter", function(self) self:SetBackdropBorderColor(unpack(C["General"].ClassColor)) end)
	header[i]:SetScript("OnLeave", function(self)
		if(self.status == "close") then
			self:SetBackdropBorderColor(unpack(C["General"].BorderColorHeader))
		else
			self:SetBackdropBorderColor(unpack(C["General"].White))
		end
	end)
	header[i]:SetScript("OnMouseDown", function() show_tab(i) end)
end



---------------------------------------------------------------------------------------------------------------------------------------
--		FUNCTION CREATE TAB
---------------------------------------------------------------------------------------------------------------------------------------

local create_tab = function(Name,indicetab,j,i)

	table.insert(tabs[j].tablist,indicetab)

	tab[indicetab] = CreateFrame("Frame", nil, iFilgerconfigPanel)
	if(i == 1) then
		F.CreatePanel(tab[indicetab], 125, 20, "TOP", header[j], "BOTTOM", 0, F.Scale(-2))			-- anchor to header if 1st
	else
		F.CreatePanel(tab[indicetab], 125, 20, "TOP", tab[indicetab-1], "BOTTOM", 0, F.Scale(-2))	-- anchor to previous tab else
	end
	tab[indicetab]:EnableMouse(true)
	tab[indicetab]:SetFrameStrata("LOW")
	tab[indicetab]:SetScript("OnMouseDown", function() open_tab(indicetab,j) end)  					-- IDK if it will work as intended..
	
	tab[indicetab].ID = indicetab
	tab[indicetab].status = "close"
	tab[indicetab]:SetBackdropBorderColor(unpack(C["General"].BorderColorTab))
	tab[indicetab]:ThickBorder()

	-- tab name
	tab[indicetab].text = tab[indicetab]:CreateFontString(nil, "OVERLAY")
	tab[indicetab].text:SetFont(C.font, 12)
	tab[indicetab].text:SetPoint("CENTER", tab[indicetab], "CENTER", 0, F.Scale(-1))
	tab[indicetab].text:SetShadowColor(0,0,0)
	tab[indicetab].text:SetShadowOffset(1.25, -1.25)
	tab[indicetab].text:SetText(Name)
	tab[indicetab].text:SetTextColor(unpack(C["General"].BorderColorConfig))
	tab[indicetab]:SetScript("OnEnter", function(self)	self.text:SetTextColor(unpack(C["General"].ClassColor)) end)
	tab[indicetab]:SetScript("OnLeave", function(self)
		if(self.status == "close") then
			self.text:SetTextColor(unpack(C["General"].BorderColorConfig))
		else
			self.text:SetTextColor(unpack(C["General"].White))
		end
	end)
end



---------------------------------------------------------------------------------------------------------------------------------------
--		CREATE GLOBAL CONFIG PANEL 
---------------------------------------------------------------------------------------------------------------------------------------

local TabRight = CreateFrame("Frame", "iFilgerConfigTabRight", iFilgerconfigPanel)
F.CreatePanel(TabRight, 125, 25, "TOPRIGHT", iFilgerconfigPanel, "TOPLEFT", F.Scale(-5), F.Scale(-30))
TabRight:EnableMouse(true)
TabRight:SetFrameStrata("LOW")
TabRight:ThickBorder()
TabRight:SetBackdropColor(.075, .075, .075, 0.7)

TabRight.status = "close"
TabRight:SetBackdropBorderColor(unpack(C["General"].BorderColorHeader))

TabRight.text = TabRight:CreateFontString(nil, "OVERLAY")
TabRight.text:SetFont(C.font, 12)
TabRight.text:SetPoint("CENTER", TabRight, "CENTER", 0, F.Scale(-1))
TabRight.text:SetShadowColor(0,0,0)
TabRight.text:SetShadowOffset(1.25, -1.25)
TabRight.text:SetText(L["Global"])
TabRight:SetScript("OnEnter", function(self) self:SetBackdropBorderColor(unpack(C["General"].ClassColor)) end)
TabRight:SetScript("OnLeave", function(self)
	if(self.status == "close") then
		self:SetBackdropBorderColor(unpack(C["General"].BorderColorHeader))
	else
		self:SetBackdropBorderColor(unpack(C["General"].White))
	end
end)
TabRight:SetScript("OnMouseDown", function()
	close_all_tab()
	iFilgerConfigMessage:Hide()
	iFilgerglobalconfigOptions:Show()
	if iFilgerConfigUISV["autoupdate"]	then Goptions.autoupdate.button:SetChecked() end
	if iFilgerConfigUISV["cleverzone"]	then Goptions.cleverzone.button:SetChecked() end
	if iFilgerConfigUISV["tooltip"]	then Goptions.tooltip.button:SetChecked() end
	if iFilgerConfigUISV["TooltipMover"]	then Goptions.TooltipMover.button:SetChecked() end
	if iFilgerConfigUISV["FlashIcon"]	then Goptions.FlashIcon.button:SetChecked() end
	if iFilgerConfigUISV["FlashBar"]	then Goptions.FlashBar.button:SetChecked() end
	Goptions.FlashThreshold.editbox:SetText(iFilgerConfigUISV["FlashThreshold"] or 5)
	Goptions.FlashDuration.editbox:SetText(iFilgerConfigUISV["FlashDuration"] or 0.5)
end)



---------------------------------------------------------------------------------------------------------------------------------------
--	Saves Global Values (saved variable function)
---------------------------------------------------------------------------------------------------------------------------------------

local function SetGlobalValue(option,value)	
	local savevalue = true

	if value == "" then
		savevalue = false
	end

	if option == "FlashThreshold" and (type(value) ~= "number" or value < 1 ) then
		savevalue = false
	elseif option == "FlashDuration" and (type(value) ~= "number" or not(value > 0)) then
		savevalue = false
	end

	if option == "autoupdate" and savevalue then
		iFilgerConfigVersion[option] = value
	end
	
	if savevalue then
		iFilgerConfigUISV[option] = value
	else
		if (type(iFilgerConfigUISV[option]) ~= "boolean") then  -- set Value back
			Goptions[option].editbox:SetText(iFilgerConfigUISV[option])
		else
			if iFilgerConfigUISV[option] then Goptions[option].button:SetChecked(true) else Goptions[option].button:SetChecked(false) end		-- set Enable
		end 
	end
end



---------------------------------------------------------------------------------------------------------------------------------------
--		FUNCTION CREATE GLOBAL OPTION
---------------------------------------------------------------------------------------------------------------------------------------

local create_global_option = function(option,value,ypos)

	Goptionstxt[option] = CreateFrame("Frame", nil, iFilgerglobalconfigOptions)
	Goptionstxt[option].text = Goptionstxt[option]:CreateFontString(nil, "OVERLAY")
	Goptionstxt[option].text:SetFont(C.font, 14)
	Goptionstxt[option].text:SetPoint("TOPLEFT", iFilgerglobalconfigOptions, "TOPLEFT", 20, -35 - ypos )
	Goptionstxt[option].text:SetShadowColor(0,0,0)
	Goptionstxt[option].text:SetShadowOffset(1.25, -1.25)
	Goptionstxt[option].text:SetText(L[option].." : ")

	Goptionstxt[option].help = CreateFrame("Frame", nil, iFilgerglobalconfigOptions)
	Goptionstxt[option].help:SetHeight(20)
	Goptionstxt[option].help:SetWidth(20)
	Goptionstxt[option].help:SetPoint("TOP", iFilgerglobalconfigOptions, "TOP", 10, -35 - ypos )
	Goptionstxt[option].help.text = Goptionstxt[option].help:CreateFontString(nil, "OVERLAY")
	Goptionstxt[option].help.text:SetFont(C.font, 12)
	Goptionstxt[option].help.text:SetPoint("CENTER", Goptionstxt[option].help, "CENTER", 0, 1 )
	Goptionstxt[option].help.text:SetShadowColor(0,0,0)
	Goptionstxt[option].help.text:SetShadowOffset(1.25, -1.25)
	Goptionstxt[option].help.text:SetTextColor(1,1,0)
	Goptionstxt[option].help.text:SetJustifyH("CENTER")
	Goptionstxt[option].help.text:SetText("(?)")
	Goptionstxt[option].help:SetScript("OnEnter", function(self)
		helptooltip(self,option)
	end)
	Goptionstxt[option].help:SetScript("OnLeave", function(self) GameTooltip:Hide() end)

	if Goptions == nil then
		Goptions = {}
	end

	Goptions[option] = CreateFrame("Frame", nil, iFilgerglobalconfigOptions)

	if type(value) == "boolean" then
		Goptions[option].button = CreateFrame("CheckButton", "iFilgerConfigGlobal"..option, Goptions[option], "ChatConfigCheckButtonTemplate")
		F.SkinCheckBox(Goptions[option].button)
		Goptions[option].button:SetPoint("TOPLEFT", iFilgerconfigPanel, "TOPRIGHT", F.Scale(-105), F.Scale(-35 - ypos))
		Goptions[option].button:SetScript("OnClick", function(self) SetGlobalValue(option,(self:GetChecked() and true or false)) end)
	elseif type(value) == "number" then
		Goptions[option].editbox = CreateFrame("EditBox", "iFilgerConfigGlobal"..option, Goptions[option])
		Goptions[option].editbox:SetAutoFocus(false)
		Goptions[option].editbox:SetMultiLine(false)
		Goptions[option].editbox:SetWidth(100)
		Goptions[option].editbox:SetHeight(20)
		Goptions[option].editbox:SetFontObject(GameFontNormal)		
		Goptions[option].editbox:SetPoint("TOPLEFT", iFilgerconfigPanel, "TOPRIGHT", F.Scale(-105), F.Scale(-35 - ypos))
		Goptions[option].editbox:SetTextColor(1,1,1)
		Goptions[option].editbox:SetMaxLetters(25)
		Goptions[option].editbox:SetTextInsets(3,0,0,0)
		Goptions[option].editbox:SetBackdrop({
			bgFile = [=[Interface\Addons\iFilger_ConfigUI\media\textures\blank]=], 
			tiled = false,
		})
		Goptions[option].editbox:SetBackdropColor(0,0,0,0.5)
		Goptions[option].editbox:SetBackdropBorderColor(1,1,1,1)
		
		Goptions[option].okbutton = CreateFrame("Button", nil, Goptions[option])
		Goptions[option].okbutton:SetHeight(Goptions[option].editbox:GetHeight())
		Goptions[option].okbutton:SetWidth(Goptions[option].editbox:GetHeight())
		Goptions[option].okbutton:SetPoint("RIGHT", Goptions[option].editbox, "LEFT", -2, 0)
		Goptions[option].okbutton:SetBackdropBorderColor(1,1,1,1)
		
		Goptions[option].oktext = Goptions[option].okbutton:CreateFontString(nil,"OVERLAY",nil)
		Goptions[option].oktext:SetFont(C.font,12)
		Goptions[option].oktext:SetText("OK")
		Goptions[option].oktext:SetPoint("CENTER", F.Scale(1), 0)
		Goptions[option].oktext:SetJustifyH("CENTER")
		Goptions[option].okbutton:Hide()

		if type(value) == "number" then
			Goptions[option].editbox:SetScript("OnEscapePressed", function(self) Goptions[option].okbutton:Hide() self:ClearFocus() self:SetText(value) end)
			Goptions[option].editbox:SetScript("OnChar", function(self) Goptions[option].okbutton:Show() end)
			Goptions[option].editbox:SetScript("OnEnterPressed", function(self) Goptions[option].okbutton:Hide() self:ClearFocus() SetGlobalValue(option,tonumber(self:GetText())) end)
			Goptions[option].okbutton:SetScript("OnMouseDown", function(self) Goptions[option].editbox:ClearFocus() self:Hide() SetGlobalValue(option,tonumber(Goptions[option].editbox:GetText())) end)
		end
	end
end

create_global_option("autoupdate",iFilger_Config["autoupdate"],25)
create_global_option("cleverzone",iFilger_Config["cleverzone"],50)
create_global_option("tooltip",iFilger_Config["tooltip"],75)
create_global_option("TooltipMover",iFilger_Config["TooltipMover"],100)
create_global_option("FlashIcon",iFilger_Config["FlashIcon"],125)
create_global_option("FlashBar",iFilger_Config["FlashBar"],150)
create_global_option("FlashThreshold",iFilger_Config["FlashThreshold"],175)
create_global_option("FlashDuration",iFilger_Config["FlashDuration"],200)



---------------------------------------------------------------------------------------------------------------------------------------
--	CREATE PANEL (begin output)
---------------------------------------------------------------------------------------------------------------------------------------

local data = {}
local indicetab = 0
local numtab
for j = 1, #tabs, 1 do
	if tabs[j].name ~= "HUNTER/DRUID/ROGUE" or ((myClass == "HUNTER" or myClass == "DRUID" or myClass == "ROGUE") and tabs[j].name == "HUNTER/DRUID/ROGUE") then
		create_tab_head(j,tabs[j].name)							-- create tab header
		numtab = #iFilger_Spells[tabs[j].name]					-- get number of tab in the header
		for i = 1, numtab, 1 do
			indicetab = indicetab + 1							-- increase tab id
			data = iFilger_Spells[tabs[j].name][i].Name				-- get data about the current tab
			create_tab(data,indicetab,j,i)						-- create tab and options
		end
	end
end

--	LET'S CLOSE ALL TABS FIRST
hide_tab(1)																-- hide 1st tab
for j = 2, #tabs, 1 do
	hide_tab(j)															-- hide the others tab
	header[j]:ClearAllPoints()											-- clear position of headers
	header[j]:SetPoint("TOP", header[j-1], "BOTTOM", 0, F.Scale(-5))	-- let's put them ones under the others
end



---------------------------------------------------------------------------------------------------------------------------------------
--	TOOGLE FUNCTION + SLASH COMMAND
---------------------------------------------------------------------------------------------------------------------------------------

local EnableConfig = function()
	if InCombatLockdown() then print(ERR_NOT_IN_COMBAT) return end
	ToggleFrame(iFilgerconfigPanel)
end

SLASH_IFILGERCONFIG1 = "/iFilger"
SlashCmdList["IFILGERCONFIG"] = EnableConfig