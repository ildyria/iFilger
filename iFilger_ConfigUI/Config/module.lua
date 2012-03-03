local C, F, L = unpack(select(2, ...))

local ipairs = ipairs
local tab = {}
local options = {}
--local buttons = {}
--local edit = {}
--local size = {}


local iFilger_Spells, iFilger_Config;
if iFilgerConfig then 
	iFilger_Spells = iFilgerConfig["Filger_Spells"]
	iFilger_Config = iFilgerConfig["Filger_Config"]
end

local iFilgerconfigPanel = CreateFrame("Frame", "iFilgerConfig", UIParent)
F.CreatePanel(iFilgerconfigPanel, 300, 500, "CENTER", UIParent, "CENTER", 0, 140)
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
configTitle.text:SetText("|cff1784d1iFilger ConfigUI|r")
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

local data;
local class = select(2, UnitClass("player"));
local maximum = #iFilger_Spells[class]
for i = 1, maximum, 1 do
	data = iFilger_Spells[class][i];

	-- size[i].Id = i;
	-- size[i].Name = data.Name;
	-- size[i].Direction = data.Direction or "DOWN";
	-- size[i].IconSide = data.IconSide or "LEFT";
	-- size[i].Interval = data.Interval or 3;
	-- size[i].Mode = data.Mode or "ICON";
	-- size[i].Alpha = data.Alpha or 1;
	-- size[i].BarWidth = data.BarWidth or 200;
	-- size[i].setPoint = data.setPoint or "CENTER";
	-- size[i]:SetWidth(C["Filger_Spells"][class][i][1] and C["Filger_Spells"][class][i][1].size or 100);
	-- size[i]:SetHeight(C["Filger_Spells"][class][i][1] and C["Filger_Spells"][class][i][1].size or 20);
	-- size[i]:SetPoint(unpack(data.setPoint));

	tab[i] = CreateFrame("Frame", nil, iFilgerconfigPanel)
	if(i == 1) then
		F.CreatePanel(tab[i], 100, 25, "TOPRIGHT", iFilgerconfigPanel, "TOPLEFT", -5, -30)
	else
		F.CreatePanel(tab[i], 100, 25, "TOP", tab[i-1], "BOTTOM", 0, -5)
	end
	tab[i]:EnableMouse(true)
	tab[i]:SetFrameStrata("LOW")

	tab[i].text = iFilgerconfigPanel:CreateFontString(nil, "OVERLAY")
	tab[i].text:SetFont(C.font, 12)
	tab[i].text:SetPoint("CENTER", tab[i], "CENTER", 0, F.Scale(-1))
	tab[i].text:SetShadowColor(0,0,0)
	tab[i].text:SetShadowOffset(1.25, -1.25)
	tab[i].text:SetText(data.Name)

	options[i] = CreateFrame("Frame", nil, iFilgerconfigPanel)

	options[i].Enable = options[i]:CreateFontString(nil, "OVERLAY")
	options[i].Enable:SetFont(C.font, 14)
	options[i].Enable:SetPoint("TOPLEFT", iFilgerconfigPanel, "TOPLEFT", 40, -35 )
	options[i].Enable:SetShadowColor(0,0,0)
	options[i].Enable:SetShadowOffset(1.25, -1.25)
	options[i].Enable:SetText(" : Enable")
	
	options[i].Enable.button = CreateFrame("CheckButton", "iFilgerConfigEnable"..i, iFilgerconfigPanel, "ChatConfigCheckButtonTemplate")
	options[i].Enable.button:SetPoint("RIGHT", options[i].Enable, "LEFT", F.Scale(-5), F.Scale(-1))

	options[i].Size = options[i]:CreateFontString(nil, "OVERLAY")
	options[i].Size:SetFont(C.font, 14)
	options[i].Size:SetPoint("TOPLEFT", iFilgerconfigPanel, "TOPLEFT", 40, -70 )
	options[i].Size:SetShadowColor(0,0,0)
	options[i].Size:SetShadowOffset(1.25, -1.25)
	options[i].Size:SetText(" : Size")
	
	options[i].Size.Editbox = CreateFrame("EditBox", "iFilgerConfigSizeEdit"..i, iFilgerconfigPanel)
	options[i].Size.Editbox:SetFont(C.font, 14)
	options[i].Size.Editbox:SetWidth(20)
	options[i].Size.Editbox:SetHeight(15)
	options[i].Size.Editbox:SetPoint("RIGHT", options[i].Size, "LEFT", F.Scale(-5), F.Scale(-1))
	options[i].Size.Editbox:SetMaxLetters(3)
	options[i].Size.Editbox:SetAutoFocus(false)
	options[i].Size.Editbox:EnableKeyboard(true)
	options[i].Size.Editbox:EnableMouse(true)
	options[i].Size.Editbox:SetScript("OnMouseDown", function(self) self:SetAutoFocus(true) end)
	options[i].Size.Editbox:SetScript("OnEscapePressed", function(self) self:SetAutoFocus(false) self:ClearFocus() end)
--	options[i].Size.Editbox:SetScript("OnEnterPressed", OnEnterPressedWidth)
	options[i].Size.Editbox:SetText(data.Size)
end

for i = 1, maximum, 1 do
	options[i]:Hide()
	options[i].Size.Editbox:Hide()
	options[i].Enable.button:Hide()
end
	
options[1]:Show()
options[1].Size.Editbox:Show()
options[1].Enable.button:Show()

local EnableConfig = function()
	ToggleFrame(iFilgerconfigPanel)
end

SLASH_IFILGERCONFIG1 = "/ciFilger"
SlashCmdList["IFILGERCONFIG"] = EnableConfig