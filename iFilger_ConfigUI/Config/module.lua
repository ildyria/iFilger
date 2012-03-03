local C, F, L = unpack(select(2, ...))

---------------------------------------------------------------------------------------------------------------------------------------
--													TODO LIST
--
--	/!\ /!\	add saved variables (mandatory) http://www.wowwiki.com/Saving_variables_between_game_sessions
--	/!\ /!\	Reset button so we can go back to initial config -- DONE (IN THEORY...)
--	  /!\	add Enable
--	  /!\	add Size
--	  /!\	add Direction
--			add Interval
--			add Alpha
--			add Mode
--			add IconSide
--			add BarWidth
--			add lots of other things
--
--
--
---------------------------------------------------------------------------------------------------------------------------------------


---------------------------------------------------------------------------------------------------------------------------------------
--		BEGIN SCRIPT
---------------------------------------------------------------------------------------------------------------------------------------

--local ipairs = ipairs
local myPlayerRealm = GetCVar("realmName")
local myPlayerName  = UnitName("player")
local myClass = select(2, UnitClass("player"));
local tabs = {  											-- List of headers and number of tabs inside each ones
	[1] = {
		name = myClass,										--	"MAGE","DEATHKNIGHT","PRIEST";"WARLOCK","DRUID","HUNTER","ROGUE","PALADIN","SHAMAN","WARRIOR","HUNTER/DRUID/ROGUE",
		tablist = {},										-- list of tabs => to know which ones to open and close
	},
	[2] = {
		name = "HUNTER/DRUID/ROGUE",
		tablist = {},
	},
	[3] = {
		name = "ALL",
		tablist = {},
	},
	[4] = {
		name = "PVP",
		tablist = {},
	},
	[5] = {
		name = "PVE",
		tablist = {},
	},
	[6] = {
		name = "TANKS",
		tablist = {},
	},
}
local header = {}											-- List of headers (frames)
local tab = {}												-- List of tab (frames)
local options = {}											-- List of options (frames)
C["tempdata"] = {}											-- List of savedvariables => easier to work with

local iFilger_Spells										-- list of spells we want to modify
if iFilgerConfig then 
	iFilger_Spells = iFilgerConfig["Filger_Spells"]
end

---------------------------------------------------------------------------------------------------------------------------------------
--		FUNCTION CREATE PANEL
---------------------------------------------------------------------------------------------------------------------------------------

local create_panel = function ()
	local iFilgerconfigPanel = CreateFrame("Frame", "iFilgerConfig", UIParent)
	F.CreatePanel(iFilgerconfigPanel, 300, 500, "CENTER", UIParent, "CENTER", 0, 140)
	F.SetBorder(iFilgerconfigPanel)
--	iFilgerconfigPanel:EnableMouse(true)
--	iFilgerconfigPanel:SetMovable(true)
--	iFilgerconfigPanel:RegisterForDrag("LeftButton")
--	iFilgerconfigPanel:SetScript("OnDragStart", function(self) self:SetUserPlaced(true) self:StartMoving() end)
--	iFilgerconfigPanel:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
	iFilgerconfigPanel:Hide()

	local configTitle = CreateFrame("Frame", "iFilgerConfigTitle", iFilgerconfigPanel)
	F.CreatePanel(configTitle, 1, 24, "TOPLEFT", UIParent, "TOPLEFT", 0, 0)
	configTitle:SetPoint("TOPLEFT", F.Scale(4), F.Scale(-4))
	configTitle:SetPoint("TOPRIGHT", F.Scale(-31), F.Scale(-4))
	configTitle:SetFrameStrata("MEDIUM")

	configTitle.text = configTitle:CreateFontString(nil, "OVERLAY")
	configTitle.text:SetFont(C.font, 14)
	configTitle.text:SetText("|cff1784d1iFilger|r |cffffffffConfigUI|r")
	configTitle.text:SetPoint("CENTER")

	local configClose = CreateFrame("Frame", "iFilgerConfigClose", iFilgerconfigPanel)
	F.CreatePanel(configClose, 24, 24, "TOPRIGHT", iFilgerconfigPanel, "TOPRIGHT", -4, -4)
	configClose:SetFrameStrata("MEDIUM")
	configClose:EnableMouse(true)
	configClose:SetScript("OnEnter", function(self) self.text:SetTextColor(1,0,0) end)
	configClose:SetScript("OnLeave", function(self) self.text:SetTextColor(1,1,1) end)
	configClose:SetScript("OnMouseDown", function() iFilgerconfigPanel:Hide() end)

	configClose.text = configClose:CreateFontString(nil, "OVERLAY")
	configClose.text:SetFont(C.font, 14)
	configClose.text:SetText("X")
	configClose.text:SetPoint("CENTER", configClose, 0, 0)

	local configApply = CreateFrame("Frame", "iFilgerConfigApply", iFilgerconfigPanel)
	F.CreatePanel(configApply, 95, 25, "TOPRIGHT", iFilgerconfigPanel, "BOTTOMRIGHT", 0, -5)
	configApply:SetFrameStrata("MEDIUM")
	configApply:EnableMouse(true)
	configApply:SetScript("OnEnter", function(self) self.text:SetTextColor(1,0,0) end)
	configApply:SetScript("OnLeave", function(self) self.text:SetTextColor(1,1,1) end)
--	configApply:SetScript("OnMouseDown", function() iFilgerconfigPanel:Hide() end)
	configApply:SetScript("OnClick", function(self) ReloadUI() end)

	configApply.text = configApply:CreateFontString(nil, "OVERLAY")
	configApply.text:SetFont(C.font, 14)
	configApply.text:SetText("Apply")
	configApply.text:SetPoint("CENTER", configApply, 0, -1)

	local configReset = CreateFrame("Frame", "iFilgerConfigReset", iFilgerconfigPanel)
	F.CreatePanel(configReset, 95, 25, "TOPLEFT", iFilgerconfigPanel, "BOTTOMLEFT", 0, -5)
	configReset:SetFrameStrata("MEDIUM")
	configReset:EnableMouse(true)
	configReset:SetScript("OnEnter", function(self) self.text:SetTextColor(1,0,0) end)
	configReset:SetScript("OnLeave", function(self) self.text:SetTextColor(1,1,1) end)
--	configReset:SetScript("OnMouseDown", function() iFilgerconfigPanel:Hide() end)
	configReset:SetScript("OnClick", function(self) 
		ToggleFrame(iFilgerconfigPanel)
		StaticPopup_Show("RESET_IFILGER")
	end)
	
	configReset.text = configReset:CreateFontString(nil, "OVERLAY")
	configReset.text:SetFont(C.font, 14)
	configReset.text:SetText("Reset Config")
	configReset.text:SetPoint("CENTER", configReset, 0, -1)
	
	local configMove = CreateFrame("Button", "iFilgerConfigMove", iFilgerconfigPanel, "SecureActionButtonTemplate")
	F.CreatePanel(configMove, 95, 25, "TOP", iFilgerconfigPanel, "BOTTOM", 0, -5)
	configMove:EnableMouse(true)
	configMove:RegisterForClicks("AnyUp")
	configMove:SetAttribute("type1", "macro")
	configMove:SetAttribute("macrotext1", "/mifilger")
	configMove:SetFrameStrata("MEDIUM")
	configMove:SetScript("OnEnter", function(self) self.text:SetTextColor(1,0,0) end)
	configMove:SetScript("OnLeave", function(self) self.text:SetTextColor(1,1,1) end)
	configMove:SetScript("OnMouseDown", function() ToggleFrame(iFilgerconfigPanel) end)

	configMove.text = configMove:CreateFontString(nil, "OVERLAY")
	configMove.text:SetFont(C.font, 14)
	configMove.text:SetText("Move Config")
	configMove.text:SetPoint("CENTER", configMove, 0, -1)
end

StaticPopupDialogs["RESET_IFILGER"] = {
	text = "Are you sure you want to reset all of your settings to Default?",
	OnAccept = function() 
		iFilgerConfigUISavedVariables = nil
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
--		FUNCTION CREATE TAB HEADER
---------------------------------------------------------------------------------------------------------------------------------------

local create_tab_head = function(i,name)
	header[i] = CreateFrame("Frame", nil, iFilgerconfigPanel)
	if(i == 1) then
		F.CreatePanel(header[i], 100, 25, "TOPRIGHT", iFilgerconfigPanel, "TOPLEFT", F.Scale(-5), F.Scale(-30))
	else
		F.CreatePanel(header[i], 100, 25, "TOP", header[i-1], "BOTTOM", 0, F.Scale(-5))
	end
	header[i]:EnableMouse(true)
	header[i]:SetFrameStrata("LOW")

	header[i].text = iFilgerconfigPanel:CreateFontString(nil, "OVERLAY")
	header[i].text:SetFont(C.font, 12)
	header[i].text:SetPoint("CENTER", header[i], "CENTER", 0, F.Scale(-1))
	header[i].text:SetShadowColor(0,0,0)
	header[i].text:SetShadowOffset(1.25, -1.25)
	header[i].text:SetText(name)
	header[i]:SetScript("OnMouseDown", function() open_tab(i) end)  -- IDK if it will work as intended..
end



---------------------------------------------------------------------------------------------------------------------------------------
--		FUNCTION CREATE TAB
---------------------------------------------------------------------------------------------------------------------------------------

local create_tab = function(data,indicetab,j,i)

	table.insert(tabs[j].tablist,indicetab)

	tab[indicetab] = CreateFrame("Frame", nil, iFilgerconfigPanel)
	if(i == 1) then
		F.CreatePanel(tab[indicetab], 100, 25, "TOP", header[j], "BOTTOM", 0, F.Scale(-5))			-- anchor to header if 1st
	else
		F.CreatePanel(tab[indicetab], 100, 25, "TOP", tab[indicetab-1], "BOTTOM", 0, F.Scale(-5))	-- anchor to previous tab else
	end
	tab[indicetab]:EnableMouse(true)
	tab[indicetab]:SetFrameStrata("LOW")
	tab[indicetab]:SetScript("OnMouseDown", function() open_tab(indicetab,j) end)  -- IDK if it will work as intended..

	-- tab name
	tab[indicetab].text = iFilgerconfigPanel:CreateFontString(nil, "OVERLAY")
	tab[indicetab].text:SetFont(C.font, 12)
	tab[indicetab].text:SetPoint("CENTER", tab[i], "CENTER", 0, F.Scale(-1))
	tab[indicetab].text:SetShadowColor(0,0,0)
	tab[indicetab].text:SetShadowOffset(1.25, -1.25)
	tab[indicetab].text:SetText(data.Name)


	-- tab options
	options[indicetab] = CreateFrame("Frame", nil, iFilgerconfigPanel)

	-- options : Enable
	options[indicetab].Enable = options[indicetab]:CreateFontString(nil, "OVERLAY")
	options[indicetab].Enable:SetFont(C.font, 14)
	options[indicetab].Enable:SetPoint("TOPLEFT", iFilgerconfigPanel, "TOPLEFT", 40, -35 )
	options[indicetab].Enable:SetShadowColor(0,0,0)
	options[indicetab].Enable:SetShadowOffset(1.25, -1.25)
	options[indicetab].Enable:SetText(" : Enable")
	options[indicetab].Enable.button = CreateFrame("CheckButton", "iFilgerConfigEnable"..indicetab, iFilgerconfigPanel, "ChatConfigCheckButtonTemplate")
	options[indicetab].Enable.button:SetPoint("RIGHT", options[indicetab].Enable, "LEFT", F.Scale(-5), F.Scale(-1))
--	options[indicetab].Enable.button:SetBackdropBorderColor(unpack(C["General"].BorderColor)) - to test later
	options[indicetab].Enable.button:SetChecked(false)

	-- options : Size
	options[indicetab].Size = options[indicetab]:CreateFontString(nil, "OVERLAY")
	options[indicetab].Size:SetFont(C.font, 14)
	options[indicetab].Size:SetPoint("TOPLEFT", iFilgerconfigPanel, "TOPLEFT", 40, -70 )
	options[indicetab].Size:SetShadowColor(0,0,0)
	options[indicetab].Size:SetShadowOffset(1.25, -1.25)
	options[indicetab].Size:SetText(" : Size")
	options[indicetab].Size.Editbox = CreateFrame("EditBox", "iFilgerConfigSizeEdit"..indicetab, iFilgerconfigPanel)
	options[indicetab].Size.Editbox:SetFont(C.font, 14)
	options[indicetab].Size.Editbox:SetWidth(20)
	options[indicetab].Size.Editbox:SetHeight(15)
	options[indicetab].Size.Editbox:SetPoint("RIGHT", options[indicetab].Size, "LEFT", F.Scale(-5), F.Scale(-1))
	options[indicetab].Size.Editbox:SetMaxLetters(3)
	options[indicetab].Size.Editbox:SetAutoFocus(false)
	options[indicetab].Size.Editbox:EnableKeyboard(true)
	options[indicetab].Size.Editbox:EnableMouse(true)
--	options[indicetab].Size.Editbox:SetBackdropBorderColor(unpack(C["General"].BorderColor)) - to test later
	options[indicetab].Size.Editbox:SetScript("OnMouseDown", function(self) self:SetAutoFocus(true) end)
	options[indicetab].Size.Editbox:SetScript("OnEscapePressed", function(self) self:SetAutoFocus(false) self:ClearFocus() end)
--	options[indicetab].Size.Editbox:SetScript("OnEnterPressed", OnEnterPressedWidth)
	options[indicetab].Size.Editbox:SetText(data.Size)
end



---------------------------------------------------------------------------------------------------------------------------------------
--		FUNCTION HIDE TAB CONTENT
---------------------------------------------------------------------------------------------------------------------------------------

local hide_tab_content = function(indicetab)
	options[indicetab]:Hide()
	options[indicetab].Size.Editbox:Hide()
	options[indicetab].Enable.button:Hide()
end



---------------------------------------------------------------------------------------------------------------------------------------
--		FUNCTION SHOW TAB CONTENT
---------------------------------------------------------------------------------------------------------------------------------------

local show_tab_content = function(indicetab)
	options[indicetab]:Show()
	options[indicetab].Size.Editbox:Show()
	options[indicetab].Enable.button:Show()
end



---------------------------------------------------------------------------------------------------------------------------------------
--		FUNCTION OPEN TAB CONTENT
---------------------------------------------------------------------------------------------------------------------------------------

local open_tab = function(indicetab,indicehead)
	for j = 1, #tabs[indicehead].tablist, 1 do
		numtab = tabs[indicehead]["tablist"][j]
		tab[numtab]:Hide()
		hide_tab_content(numtab)
	end
	show_tab_content(indicetab)
end



---------------------------------------------------------------------------------------------------------------------------------------
--		FUNCTION HIDE TAB
---------------------------------------------------------------------------------------------------------------------------------------

local hide_tab = function(i)
	local numtab
	for j = 1, #tabs[i].tablist, 1 do
		numtab = tabs[i]["tablist"][j]
		tab[numtab]:Hide()
		hide_tab_content(numtab)
	end
end



---------------------------------------------------------------------------------------------------------------------------------------
--		FUNCTION SHOW TAB
---------------------------------------------------------------------------------------------------------------------------------------

local show_tab = function(i)

	hide_tab(1)

	for j = 2, #tabs, 1 do
		hide_tab(j)
		header[j]:ClearAllPoints()
		header[j]:SetPoint("TOP", header[j-1], "BOTTOM", 0, F.Scale(-5))
	end

	if i < #tabs then
		header[i+1]:ClearAllPoints()
		header[i]:SetPoint("TOP", tab[i-1], "BOTTOM", 0, F.Scale(-5))
	end

	local numtab
	for j = 1, #tabs[i].tablist, 1 do
		numtab = tabs[i]["tablist"][j]
		tab[numtab]:Show()
	end
	show_tab_content(tabs[i]["tablist"][1])
end



---------------------------------------------------------------------------------------------------------------------------------------
--	CREATE PANEL
---------------------------------------------------------------------------------------------------------------------------------------

create_panel()

---------------------------------------------------------------------------------------------------------------------------------------
--	CREATE TABS
---------------------------------------------------------------------------------------------------------------------------------------

local data = {}
local indicetab = 0
local numtab
for j = 1, #tabs, 1 do
	if tabs[j].name ~= "HUNTER/DRUID/ROGUE" or ((myClass == "HUNTER" or myClass == "DRUID" or myClass == "ROGUE") and tabs[j].name == "HUNTER/DRUID/ROGUE") then
		create_tab_head(j,tabs[j].name)							-- create tab header
		numtab = #iFilger_Spells[tabs[j].name]			-- get number of tab in the header
		for i = 1, numtab, 1 do
			indicetab = indicetab + 1							-- increase tab id
			data = iFilger_Spells[tabs[j].name][i]				-- get data about the current tab
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
--	LOAD SAVED VARIABLES
---------------------------------------------------------------------------------------------------------------------------------------

-- Saved Variables
local SaveVariables = function(self, event)
	local data = {}
	local indicetab = 0
	local numtab
	if event == "ADDON_LOADED" then
		if iFilgerConfigUISavedVariables == nil then	-- there are no saved variables, let's load the default config ! 
			iFilgerConfigUISavedVariables = {}			-- let's create an empty table

			for j = 1, #tabs, 1 do
				if tabs[j].name ~= "HUNTER/DRUID/ROGUE" or ((myClass == "HUNTER" or myClass == "DRUID" or myClass == "ROGUE") and tabs[j].name == "HUNTER/DRUID/ROGUE") then
					numtab = #iFilger_Spells[tabs[j].name]			-- get number of tab in the header

					for i = 1, numtab, 1 do
						indicetab = indicetab + 1							-- increase tab id
						data = iFilger_Spells[tabs[j].name][i]				-- get data about the current tab

						iFilgerConfigUISavedVariables[indicetab].Name = data.Name
						iFilgerConfigUISavedVariables[indicetab].Direction = data.Direction or "UP"
						iFilgerConfigUISavedVariables[indicetab].IconSide = data.IconSide or "LEFT"
						iFilgerConfigUISavedVariables[indicetab].Interval = data.Interval or 3
						iFilgerConfigUISavedVariables[indicetab].Mode = data.Mode or "ICON"
						iFilgerConfigUISavedVariables[indicetab].Size = data.Size or 20
						iFilgerConfigUISavedVariables[indicetab].Alpha = data.Alpha or 1.0
						iFilgerConfigUISavedVariables[indicetab].BarWidth = data.BarWidth or 200
						iFilgerConfigUISavedVariables[indicetab].setPoint = data.setPoint or "CENTER"
					end

				end
			end

		end
		
		indicetab = 0
		if iFilgerConfigUISavedVariables then  -- there are saved variables, let's load them !
		-- Put this will overwrite profiles.
			for j = 1, #tabs, 1 do
				if tabs[j].name ~= "HUNTER/DRUID/ROGUE" or ((myClass == "HUNTER" or myClass == "DRUID" or myClass == "ROGUE") and tabs[j].name == "HUNTER/DRUID/ROGUE") then
					numtab = #iFilger_Spells[tabs[j].name]			-- get number of tab in the header

					for i = 1, numtab, 1 do
						indicetab = indicetab + 1									-- increase tab id
						data = iFilgerConfigUISavedVariables[indicetab]				-- get data about the current tab

						iFilger_Spells[tabs[j].name][i].Name = data.Name
						iFilger_Spells[tabs[j].name][i].Direction = data.Direction or "UP"
						iFilger_Spells[tabs[j].name][i].IconSide = data.IconSide or "LEFT"
						iFilger_Spells[tabs[j].name][i].Interval = data.Interval or 3
						iFilger_Spells[tabs[j].name][i].Mode = data.Mode or "ICON"
						iFilger_Spells[tabs[j].name][i].Size = data.Size or 20
						iFilger_Spells[tabs[j].name][i].Alpha = data.Alpha or 1.0
						iFilger_Spells[tabs[j].name][i].Barwidth = data.BarWidth or 200
						iFilger_Spells[tabs[j].name][i].setPoint = data.setPoint or "CENTER"
						
						C["tempdata"][indicetab].Name = data.Name
						C["tempdata"][indicetab].Direction = data.Direction or "UP"
						C["tempdata"][indicetab].IconSide = data.IconSide or "LEFT"
						C["tempdata"][indicetab].Interval = data.Interval or 3
						C["tempdata"][indicetab].Mode = data.Mode or "ICON"
						C["tempdata"][indicetab].Size = data.Size or 20
						C["tempdata"][indicetab].Alpha = data.Alpha or 1.0
						C["tempdata"][indicetab].Barwidth = data.BarWidth or 200
						C["tempdata"][indicetab].setPoint = data.setPoint or "CENTER"
					end

				end
			end
		end
		
	elseif event == "PLAYER_LOGOUT" then
		for i = 1, #C["tempdata"], 1 do
			data = C["tempdata"][i]			-- get data about the current tab

			iFilgerConfigUISavedVariables[i].Name = data.Name
			iFilgerConfigUISavedVariables[i].Direction = data.Direction or "UP"
			iFilgerConfigUISavedVariables[i].IconSide = data.IconSide or "LEFT"
			iFilgerConfigUISavedVariables[i].Interval = data.Interval or 3
			iFilgerConfigUISavedVariables[i].Mode = data.Mode or "ICON"
			iFilgerConfigUISavedVariables[i].Size = data.Size or 20
			iFilgerConfigUISavedVariables[i].Alpha = data.Alpha or 1.0
			iFilgerConfigUISavedVariables[i].BarWidth = data.BarWidth or 200
			iFilgerConfigUISavedVariables[i].setPoint = data.setPoint or "CENTER"
		end
	end
	
	-- And now we set all vars in config panel ! 
	for i = 1, #C["tempdata"], 1 do
		data = C["tempdata"][i]			-- get data about the current tab
		
		tab[indicetab].text:SetText(data.Name)										-- set tab name (even if supposed already done)
		options[indicetab].Size.Editbox:SetText(data.Size)							-- set Size
		if data.Enable	then options[indicetab].Enable.button:SetChecked() end		-- set Enable


		-- iFilgerConfigUISavedVariables[i].Name = data.Name
		-- iFilgerConfigUISavedVariables[i].Direction = data.Direction or "UP"
		-- iFilgerConfigUISavedVariables[i].IconSide = data.IconSide or "LEFT"
		-- iFilgerConfigUISavedVariables[i].Interval = data.Interval or 3
		-- iFilgerConfigUISavedVariables[i].Mode = data.Mode or "ICON"
		-- iFilgerConfigUISavedVariables[i].Size = data.Size or 20
		-- iFilgerConfigUISavedVariables[i].Alpha = data.Alpha or 1.0
		-- iFilgerConfigUISavedVariables[i].BarWidth = data.BarWidth or 200
		-- iFilgerConfigUISavedVariables[i].setPoint = data.setPoint or "CENTER"
	end
end

local saver = CreateFrame("FRAME")
saver:RegisterEvent("ADDON_LOADED")
saver:RegisterEvent("PLAYER_LOGOUT")
saver:SetScript("OnEvent", SaveVariables)


---------------------------------------------------------------------------------------------------------------------------------------
--	TOOGLE FUNCTION + SLASH COMMAND
---------------------------------------------------------------------------------------------------------------------------------------

local EnableConfig = function()
	if select(1, UnitName("player")) == "Ildyria" then					-- let's make sure nobody use this while it's not ready to use. :P
		ToggleFrame(iFilgerconfigPanel)
	end
end

SLASH_IFILGERCONFIG1 = "/iFilger"										-- slash command will need some rework later i guess... :/
SlashCmdList["IFILGERCONFIG"] = EnableConfig