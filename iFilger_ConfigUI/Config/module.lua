local C, F, L = unpack(select(2, ...))

---------------------------------------------------------------------------------------------------------------------------------------
--													TODO LIST
--
-- 			Coding finished.
--			TO DO : KILL BUGS !
--
--
---------------------------------------------------------------------------------------------------------------------------------------



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

local iFilger_Spells										-- list of spells we want to modify
if iFilgerConfig then 
	iFilger_Spells = iFilgerConfig["Filger_Spells"]
end

local help = {
	["Name"] = {
		"The name of the sub-section, what else ?",
	},
	["Enable"] = {
		"Enable or not the sub-section.",
	},
	["Size"] = {
		"Size of the Icons",
		"Must be a positive number",
	},
	["Direction"] = {
		"Direction of expending :",
		"UP, DOWN, LEFT, RIGHT or HORIZONTAL",
	},
	["IconSide"] = {
		"Position of the Icon in bar config mode :",
		"LEFT or RIGHT",
	},
	["Interval"] = {
		"Interval between Icons/Bars",
	},
	["Mode"] = {
		"Display mode : ",
		"ICON or BAR",
	},
	["Alpha"] = {
		"Transparency :",
		"Float between 0 (invisible) and 1 (mat)",
	},
	["BarWidth"] = {
		"Width of the Bar (Bar Mode required)",
	},
	["Merge"] = {
		"Enable Merging when Name is the same.",
	},
}



---------------------------------------------------------------------------------------------------------------------------------------
--		CREATE CONFIG PANEL
---------------------------------------------------------------------------------------------------------------------------------------

local iFilgerconfigPanel = CreateFrame("Frame", "iFilgerConfig", UIParent)
F.CreatePanel(iFilgerconfigPanel, 300, 400, "CENTER", UIParent, "CENTER", 0, 100)
F.SetBorder(iFilgerconfigPanel)
iFilgerconfigPanel:EnableMouse(true)
iFilgerconfigPanel:SetMovable(true)
iFilgerconfigPanel:RegisterForDrag("LeftButton")
iFilgerconfigPanel:SetScript("OnDragStart", function(self) self:SetUserPlaced(true) self:StartMoving() end)
iFilgerconfigPanel:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
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
configClose:SetScript("OnEnter", function(self) self.text:SetTextColor(unpack(C["General"].Red)) end)
configClose:SetScript("OnLeave", function(self) self.text:SetTextColor(unpack(C["General"].White)) end)
configClose:SetScript("OnMouseDown", function() iFilgerconfigPanel:Hide() end)

configClose.text = configClose:CreateFontString(nil, "OVERLAY")
configClose.text:SetFont(C.font, 14)
configClose.text:SetText("X")
configClose.text:SetPoint("CENTER", configClose, 0, 0)

local configApply = CreateFrame("Button", "iFilgerConfigApply", iFilgerconfigPanel, "SecureActionButtonTemplate")
F.CreatePanel(configApply, 147, 25, "TOPRIGHT", iFilgerconfigPanel, "BOTTOMRIGHT", 0, -5)
configApply:EnableMouse(true)
configApply:RegisterForClicks("AnyUp")
configApply:SetAttribute("type1", "macro")
configApply:SetAttribute("macrotext1", "/reload")
configApply:SetFrameStrata("MEDIUM")
configApply:SetScript("OnEnter", function(self) self.text:SetTextColor(unpack(C["General"].ClassColor)) end)
configApply:SetScript("OnLeave", function(self) self.text:SetTextColor(unpack(C["General"].White)) end)

configApply.text = configApply:CreateFontString(nil, "OVERLAY")
configApply.text:SetFont(C.font, 14)
configApply.text:SetText("Apply")
configApply.text:SetPoint("CENTER", configApply, 0, -1)

local configReset = CreateFrame("Frame", "iFilgerConfigReset", iFilgerconfigPanel)
F.CreatePanel(configReset, 147, 25, "TOPLEFT", iFilgerconfigPanel, "BOTTOMLEFT", 0, -5)
configReset:SetFrameStrata("MEDIUM")
configReset:EnableMouse(true)
configReset:SetScript("OnEnter", function(self) self.text:SetTextColor(unpack(C["General"].Red)) end)
configReset:SetScript("OnLeave", function(self) self.text:SetTextColor(unpack(C["General"].White)) end)
configReset:SetScript("OnMouseDown", function(self) 
	ToggleFrame(iFilgerconfigPanel)
	StaticPopup_Show("RESET_IFILGER")
end)

configReset.text = configReset:CreateFontString(nil, "OVERLAY")
configReset.text:SetFont(C.font, 14)
configReset.text:SetText("Reset Config")
configReset.text:SetPoint("CENTER", configReset, 0, -1)

local configMove = CreateFrame("Button", "iFilgerConfigMove", iFilgerconfigPanel, "SecureActionButtonTemplate")
F.CreatePanel(configMove, 147, 25, "TOP", configApply, "BOTTOM", 0, F.Scale(-5))
configMove:EnableMouse(true)
configMove:RegisterForClicks("AnyUp")
configMove:SetAttribute("type1", "macro")
configMove:SetAttribute("macrotext1", "/mifilger")
configMove:SetFrameStrata("MEDIUM")
configMove:SetScript("OnEnter", function(self) self.text:SetTextColor(unpack(C["General"].ClassColor)) end)
configMove:SetScript("OnLeave", function(self) self.text:SetTextColor(unpack(C["General"].White)) end)

configMove.text = configMove:CreateFontString(nil, "OVERLAY")
configMove.text:SetFont(C.font, 14)
configMove.text:SetText("Move Buffs")
configMove.text:SetPoint("CENTER", configMove, 0, -1)

local configResetPosition = CreateFrame("Button", "iFilgerConfigMove", iFilgerconfigPanel, "SecureActionButtonTemplate")
F.CreatePanel(configResetPosition, 147, 25, "TOP", configReset, "BOTTOM", 0, F.Scale(-5))
configResetPosition:EnableMouse(true)
configResetPosition:RegisterForClicks("AnyUp")
configResetPosition:SetAttribute("type1", "macro")
configResetPosition:SetAttribute("macrotext1", "/mifilger")
configResetPosition:SetFrameStrata("MEDIUM")
configResetPosition:SetScript("OnEnter", function(self) self.text:SetTextColor(unpack(C["General"].Red)) end)
configResetPosition:SetScript("OnLeave", function(self) self.text:SetTextColor(unpack(C["General"].White)) end)

configResetPosition.text = configResetPosition:CreateFontString(nil, "OVERLAY")
configResetPosition.text:SetFont(C.font, 14)
configResetPosition.text:SetText("Reset Buff Position")
configResetPosition.text:SetPoint("CENTER", configResetPosition, 0, -1)

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
	text = "Are you sure you want to reset all of your settings to Default?",
	OnAccept = function() 
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
--	Saves Values (saved variable function)
---------------------------------------------------------------------------------------------------------------------------------------

local function SetValue(group,option,value)	
	--Determine if we should be copying our default settings to our player settings, this only happens if we're not using player settings by default
	local savevalue = true

	if value == "" then
		savevalue = false
	end

	-- check values...
	if option == "Size" and (type(value) ~= "number" or value < 1 ) then
		savevalue = false
	elseif option == "Direction" and value ~= "UP" and value ~= "DOWN" and value ~= "RIGHT" and value ~= "LEFT" and value ~= "HORIZONTAl" then
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
		iFilgerConfigUISVPC[group][option] = value
	else
		if (type(iFilgerConfigUISVPC[group][option]) ~= "boolean") then  -- set Value back
			options[group][option].editbox:SetText(iFilgerConfigUISVPC[group][option])
		else
			if iFilgerConfigUISVPC[group][option] then options[group][option].button:SetChecked(true) else options[group][option].button:SetChecked(false) end		-- set Enable
		end 
	end

end



---------------------------------------------------------------------------------------------------------------------------------------
--		FUNCTION CREATE OPTION
---------------------------------------------------------------------------------------------------------------------------------------

local create_option = function(indicetab,option,value,ypos)

	if indicetab == 1 then 
		optionstxt[option] = CreateFrame("Frame", nil, iFilgerconfigPanel)
		optionstxt[option].text = optionstxt[option]:CreateFontString(nil, "OVERLAY")
		optionstxt[option].text:SetFont(C.font, 14)
		optionstxt[option].text:SetPoint("TOPLEFT", iFilgerconfigPanel, "TOPLEFT", 20, -35 - ypos )
		optionstxt[option].text:SetShadowColor(0,0,0)
		optionstxt[option].text:SetShadowOffset(1.25, -1.25)
		optionstxt[option].text:SetText(option.." : ")

		optionstxt[option].help = CreateFrame("Frame", nil, iFilgerconfigPanel)
		optionstxt[option].help:SetHeight(20)
		optionstxt[option].help:SetWidth(20)
		optionstxt[option].help:SetPoint("TOP", iFilgerconfigPanel, "TOP", -40, -35 - ypos )
		optionstxt[option].help.text = optionstxt[option].help:CreateFontString(nil, "OVERLAY")
		optionstxt[option].help.text:SetFont(C.font, 12)
		optionstxt[option].help.text:SetPoint("CENTER", optionstxt[option].help, "CENTER", 0, -1 )
		optionstxt[option].help.text:SetShadowColor(0,0,0)
		optionstxt[option].help.text:SetShadowOffset(1.25, -1.25)
		optionstxt[option].help.text:SetTextColor(1,1,0)
		optionstxt[option].help.text:SetJustifyH("CENTER")
		optionstxt[option].help.text:SetText("(?)")
		optionstxt[option].help:SetScript("OnEnter", function(self)
			helptooltip(self,option)
		end)
		optionstxt[option].help:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
	end

	if options[indicetab] == nil then
		options[indicetab] = {}
	end

	options[indicetab][option] = CreateFrame("Frame", nil, iFilgerconfigPanel)

	if type(value) == "boolean" then
		options[indicetab][option].button = CreateFrame("CheckButton", "iFilgerConfig"..indicetab..option, options[indicetab][option], "ChatConfigCheckButtonTemplate")
		options[indicetab][option].button:SetPoint("TOPLEFT", iFilgerconfigPanel, "TOPRIGHT", F.Scale(-105), F.Scale(-35 - ypos))
		options[indicetab][option].button:SetScript("OnClick", function(self) SetValue(indicetab,option,(self:GetChecked() and true or false)) end)
	elseif type(value) == "number" or type(value) == "string" then
		options[indicetab][option].editbox = CreateFrame("EditBox", "iFilgerConfig"..indicetab..option, options[indicetab][option])
		options[indicetab][option].editbox:SetAutoFocus(false)
		options[indicetab][option].editbox:SetMultiLine(false)
		options[indicetab][option].editbox:SetWidth(100)
		options[indicetab][option].editbox:SetHeight(20)
		options[indicetab][option].editbox:SetFontObject(GameFontNormal)		
		options[indicetab][option].editbox:SetPoint("TOPLEFT", iFilgerconfigPanel, "TOPRIGHT", F.Scale(-105), F.Scale(-35 - ypos))
		options[indicetab][option].editbox:SetTextColor(1,1,1)
		options[indicetab][option].editbox:SetMaxLetters(25)
		options[indicetab][option].editbox:SetTextInsets(3,0,0,0)
		options[indicetab][option].editbox:SetBackdrop({
			bgFile = [=[Interface\Addons\iFilger_ConfigUI\media\textures\blank]=], 
			tiled = false,
		})
		options[indicetab][option].editbox:SetBackdropColor(0,0,0,0.5)
		options[indicetab][option].editbox:SetBackdropBorderColor(1,1,1,1)
--		options[indicetab][option].editbox:SetText(option)
		
		options[indicetab][option].okbutton = CreateFrame("Button", nil, options[indicetab][option])
		options[indicetab][option].okbutton:SetHeight(options[indicetab][option].editbox:GetHeight())
		options[indicetab][option].okbutton:SetWidth(options[indicetab][option].editbox:GetHeight())
		options[indicetab][option].okbutton:SetPoint("RIGHT", options[indicetab][option].editbox, "LEFT", -2, 0)
		options[indicetab][option].okbutton:SetBackdropBorderColor(1,1,1,1)
		
		options[indicetab][option].oktext = options[indicetab][option].okbutton:CreateFontString(nil,"OVERLAY",nil)
		options[indicetab][option].oktext:SetFont(C.font,12)
		options[indicetab][option].oktext:SetText("OK")
		options[indicetab][option].oktext:SetPoint("CENTER", F.Scale(1), 0)
		options[indicetab][option].oktext:SetJustifyH("CENTER")
		options[indicetab][option].okbutton:Hide()

		if type(value) == "number" then
			options[indicetab][option].editbox:SetScript("OnEscapePressed", function(self) options[indicetab][option].okbutton:Hide() self:ClearFocus() self:SetText(value) end)
			options[indicetab][option].editbox:SetScript("OnChar", function(self) options[indicetab][option].okbutton:Show() end)
			options[indicetab][option].editbox:SetScript("OnEnterPressed", function(self) options[indicetab][option].okbutton:Hide() self:ClearFocus() SetValue(indicetab,option,tonumber(self:GetText())) end)
			options[indicetab][option].okbutton:SetScript("OnMouseDown", function(self) options[indicetab][option].editbox:ClearFocus() self:Hide() SetValue(indicetab,option,tonumber(options[indicetab][option].editbox:GetText())) end)
		else
			options[indicetab][option].editbox:SetScript("OnEscapePressed", function(self) options[indicetab][option].okbutton:Hide() self:ClearFocus() self:SetText(value) end)
			options[indicetab][option].editbox:SetScript("OnChar", function(self) options[indicetab][option].okbutton:Show() end)
			options[indicetab][option].editbox:SetScript("OnEnterPressed", function(self) options[indicetab][option].okbutton:Hide() self:ClearFocus() SetValue(indicetab,option,tostring(self:GetText())) end)
			options[indicetab][option].okbutton:SetScript("OnMouseDown", function(self) options[indicetab][option].editbox:ClearFocus() self:Hide() SetValue(indicetab,option,tostring(options[indicetab][option].editbox:GetText())) end)
		end
	end
end



---------------------------------------------------------------------------------------------------------------------------------------
--		FUNCTION HIDE TAB CONTENT (TAB => OPTIONS)
---------------------------------------------------------------------------------------------------------------------------------------

 local hide_tab_content = function(indicetab)
	options[indicetab].Name:Hide()
	options[indicetab].Enable:Hide()
	options[indicetab].Size:Hide()
	options[indicetab].Direction:Hide()
	options[indicetab].IconSide:Hide()
	options[indicetab].Interval:Hide()
	options[indicetab].Mode:Hide()
	options[indicetab].Alpha:Hide()
	options[indicetab].BarWidth:Hide()
	options[indicetab].Merge:Hide()
end



---------------------------------------------------------------------------------------------------------------------------------------
--		FUNCTION SHOW TAB CONTENT (TAB => OPTIONS)
---------------------------------------------------------------------------------------------------------------------------------------

local show_tab_content = function(indicetab)
	options[indicetab].Name:Show()
	options[indicetab].Enable:Show()
	options[indicetab].Size:Show()
	options[indicetab].Direction:Show()
	options[indicetab].IconSide:Show()
	options[indicetab].Interval:Show()
	options[indicetab].Mode:Show()
	options[indicetab].Alpha:Show()
	options[indicetab].BarWidth:Show()
	options[indicetab].Merge:Show()
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
--		FUNCTION SHOW TAB LIST OF A HEADER (HEADER => TAB)
---------------------------------------------------------------------------------------------------------------------------------------

local show_tab = function(i)

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
		F.CreatePanel(header[i], 100, 25, "TOPRIGHT", iFilgerconfigPanel, "TOPLEFT", F.Scale(-5), F.Scale(-30))
	else
		F.CreatePanel(header[i], 100, 25, "TOP", header[i-1], "BOTTOM", 0, F.Scale(-5))
	end
	header[i]:EnableMouse(true)
	header[i]:SetFrameStrata("LOW")

	header[i].status = "close"
	header[i]:SetBackdropBorderColor(unpack(C["General"].BorderColorHeader))
	
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
	header[i]:SetScript("OnMouseDown", function() show_tab(i) end)  -- IDK if it will work as intended..
end



---------------------------------------------------------------------------------------------------------------------------------------
--		FUNCTION CREATE TAB
---------------------------------------------------------------------------------------------------------------------------------------

local create_tab = function(data,indicetab,j,i)

	table.insert(tabs[j].tablist,indicetab)

	tab[indicetab] = CreateFrame("Frame", nil, iFilgerconfigPanel)
	if(i == 1) then
		F.CreatePanel(tab[indicetab], 100, 20, "TOP", header[j], "BOTTOM", 0, F.Scale(-2))			-- anchor to header if 1st
	else
		F.CreatePanel(tab[indicetab], 100, 20, "TOP", tab[indicetab-1], "BOTTOM", 0, F.Scale(-2))	-- anchor to previous tab else
	end
	tab[indicetab]:EnableMouse(true)
	tab[indicetab]:SetFrameStrata("LOW")
	tab[indicetab]:SetScript("OnMouseDown", function() open_tab(indicetab,j) end)  					-- IDK if it will work as intended..

	tab[indicetab].status = "close"
	tab[indicetab]:SetBackdropBorderColor(unpack(C["General"].BorderColorTab))

	-- tab name
	tab[indicetab].text = tab[indicetab]:CreateFontString(nil, "OVERLAY")
	tab[indicetab].text:SetFont(C.font, 12)
	tab[indicetab].text:SetPoint("CENTER", tab[indicetab], "CENTER", 0, F.Scale(-1))
	tab[indicetab].text:SetShadowColor(0,0,0)
	tab[indicetab].text:SetShadowOffset(1.25, -1.25)
	tab[indicetab].text:SetText(data.Name)
	tab[indicetab].text:SetTextColor(unpack(C["General"].BorderColorConfig))
	tab[indicetab]:SetScript("OnEnter", function(self)	self.text:SetTextColor(unpack(C["General"].ClassColor)) end)
	tab[indicetab]:SetScript("OnLeave", function(self)
		if(self.status == "close") then
			self.text:SetTextColor(unpack(C["General"].BorderColorConfig))
		else
			self.text:SetTextColor(unpack(C["General"].White))
		end
	end)
	
	-- secure data to prevent nil from happening...
	data.Name = data.Name or "blabla"
	data.Enable = data.Enable or false
	data.Size = data.Size or 20
	data.Direction = data.Direction or "RIGHT"
	data.IconSide = data.IconSide or "LEFT"
	data.Interval = data.Interval or 3
	data.Mode = data.Mode or "ICON"
	data.Alpha = data.Alpha or 1
	data.BarWidth = data.BarWidth or 200
	data.Merge = data.Merge or false
	
	-- tab options
	create_option(indicetab,"Name",data.Name,25)
	create_option(indicetab,"Enable",data.Enable,50)
	create_option(indicetab,"Size",data.Size,75)
	create_option(indicetab,"Direction",data.Direction,100)
	create_option(indicetab,"IconSide",data.IconSide,125)
	create_option(indicetab,"Interval",data.Interval,150)
	create_option(indicetab,"Mode",data.Mode,175)
	create_option(indicetab,"Alpha",data.Alpha,200)
	create_option(indicetab,"BarWidth",data.BarWidth,225)
	create_option(indicetab,"Merge",data.Merge,250)
end



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

-- OPEN FIRST TAB AT LEAST 
show_tab(1)

---------------------------------------------------------------------------------------------------------------------------------------
--	LOAD SAVED VARIABLES
---------------------------------------------------------------------------------------------------------------------------------------

local SaveVariables = function(self, event, arg1)
	if arg1 == "iFilger_ConfigUI" then					-- this should secure loading. We don't want to begin loading saved variables when they are not yet aviable...
		local data = {}
		local indicetab = 0
		local numtab
		if iFilgerConfigUISVPC == nil then	-- there are no saved variables, let's load the default config ! 
			iFilgerConfigUISVPC = {}			-- let's create an empty table
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
				end
			end
		end
			
		indicetab = 0
		if iFilgerConfigUISVPC then  -- there are saved variables, let's load them !
		-- CARE this will overwrite profiles.
			for j = 1, #tabs, 1 do
				numtab = #iFilger_Spells[tabs[j].name]							-- get number of tab in the header
				for i = 1, numtab, 1 do
					indicetab = indicetab + 1									-- increase tab id
					data = iFilgerConfigUISVPC[indicetab]				-- get data about the current tab
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
					
					tab[indicetab].text:SetText(data.Name)	-- set tab name (even if supposed already done)
					options[indicetab].Name.editbox:SetText(data.Name or "blabla")				-- set Name
					if data.Enable	then options[indicetab].Enable.button:SetChecked() end		-- set Enable
					options[indicetab].Size.editbox:SetText(data.Size or 20)					-- set Size
					options[indicetab].Direction.editbox:SetText(data.Direction or "UP")		-- set Direction
					options[indicetab].IconSide.editbox:SetText(data.IconSide or "LEFT")		-- set IconSide
					options[indicetab].Interval.editbox:SetText(data.Interval or 3)				-- set Interval
					options[indicetab].Mode.editbox:SetText(data.Mode or "ICON")				-- set Mode
					options[indicetab].Alpha.editbox:SetText(data.Alpha or 1.0)					-- set Alpha
					options[indicetab].BarWidth.editbox:SetText(data.BarWidth or 150)			-- set Barwidth
					if data.Merge	then options[indicetab].Merge.button:SetChecked() end		-- set Merge
				end
			end
		end
	end
end

local saver = CreateFrame("FRAME")
saver:RegisterEvent("ADDON_LOADED")
saver:SetScript("OnEvent", SaveVariables)



---------------------------------------------------------------------------------------------------------------------------------------
--	TOOGLE FUNCTION + SLASH COMMAND
---------------------------------------------------------------------------------------------------------------------------------------

local EnableConfig = function()
		ToggleFrame(iFilgerconfigPanel)
end

SLASH_IFILGERCONFIG1 = "/iFilger"
SlashCmdList["IFILGERCONFIG"] = EnableConfig