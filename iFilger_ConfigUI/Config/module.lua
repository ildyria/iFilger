local C, F, L = unpack(select(2, ...))

local ipairs = ipairs
local options = {}
local buttons = {}
local edit = {}
local size = {}


local Filger_Spells;
if iFilgerConfig then 
	Filger_Spells = iFilgerConfig["Filger_Spells"]
end

local iFilgerconfigPanel = CreateFrame("Frame", "iFilgerConfig", UIParent)
F.CreatePanel(iFilgerconfigPanel, 300, 300, "CENTER", UIParent, "CENTER", 0, 140)
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

local OnClick = function(self) -- This is dumb, make a better method
	local button = tonumber(strsub(self:GetName(), 22))
--[[
	if button == 1 then
		if self:GetChecked() then
			C["ChatWindows"].AutoFade = true
		else
			C["ChatWindows"].AutoFade = false
		end
	elseif button == 2 then
		if self:GetChecked() then
			C["ChatWindows"].ShowTitle = true
		else
			C["ChatWindows"].ShowTitle = false
		end
		UpdateTitles()
	elseif button == 3 then
		if self:GetChecked() then
			C["ChatWindows"].AutoHide = true
		else
			C["ChatWindows"].AutoHide = false
		end
	elseif button == 4 then
		if self:GetChecked() then
			C["ChatWindows"].MinimizeAll = true
			MinimizeAllChats()
		else
			C["ChatWindows"].MinimizeAll = false
			MinimizeAllChats()
		end
	elseif button == 5 then
		if self:GetChecked() then
			C["ChatWindows"].Timestamps = true
		else
			C["ChatWindows"].Timestamps = false
		end
	end]]
end

-- for k, v in pairs(C["ChatWindows"]) do -- place the options into a new table for ease of use
	-- tinsert(options, {k, v})
-- end

	local data;
	local class = MAGE;
	for i = 1, #Filger_Spells[class], 1 do
		data = Filger_Spells[class][i];
		
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

		size[i] = CreateFrame("Frame", nil, iFilgerconfigPanel)
		F.CreatePanel(size[i], 50, 20, "BOTTOM", iFilgerconfigPanel, "BOTTOM", 5, i*20)
		size[i]:EnableMouse(true)
		size[i]:SetFrameStrata("LOW")

		size[i].edit = CreateFrame("EditBox", "iFilgerConfigEdit"..i, iFilgerconfigPanel)
		size[i].edit:SetFont(C.font, 12)
		size[i].edit:SetPoint("TOPLEFT", size[i], F.Scale(4), F.Scale(-2))
		size[i].edit:SetPoint("BOTTOMRIGHT", size[i], F.Scale(-4), F.Scale(2))
		size[i].edit:SetMaxLetters(5)
		size[i].edit:SetAutoFocus(false)
		size[i].edit:EnableKeyboard(true)
		size[i].edit:EnableMouse(true)
	--	size[i].edit:SetScript("OnMouseDown", function(self) self:SetAutoFocus(true) end)
	--	size[i].edit:SetScript("OnEscapePressed", function(self) self:SetAutoFocus(false) self:ClearFocus() end)
		
		size[i].text = iFilgerconfigPanel:CreateFontString(nil, "OVERLAY")
		size[i].text:SetFont(C.font, 12)
		size[i].text:SetPoint("BOTTOM", size[i], "TOP", 0, F.Scale(3))
		size[i].text:SetShadowColor(0,0,0)
		size[i].text:SetShadowOffset(1.25, -1.25)
		
		size[i]:SetPoint("BOTTOM", iFilgerconfigPanel, "BOTTOM", F.Scale(64), F.Scale(10*i))
--		size[i].edit:SetScript("OnEnterPressed", OnEnterPressed)
		size[i].text:SetText(data.Name)

	end

-- for key, option in ipairs(options) do
	-- local name, value = unpack(option)
	
	-- buttons[key] = CreateFrame("CheckButton", "iFilgerConfigButton"..key, iFilgerconfigPanel, "ChatConfigCheckButtonTemplate")
	-- buttons[key]:ClearAllPoints()
	
	-- if key == 1 then
		-- buttons[key]:SetPoint("BOTTOMLEFT", iFilgerconfigPanel, "BOTTOMLEFT", F.Scale(6), F.Scale(6))
		-- _G[format("iFilgerConfigButton%dText", key)]:SetText("  AutoFade")
	-- elseif key == 2 then
		-- buttons[key]:SetPoint("BOTTOM", buttons[key-1], "TOP", 0, F.Scale(4))
		-- _G[format("iFilgerConfigButton%dText", key)]:SetText("  ShowTitle")
	-- elseif key == 3 then
		-- buttons[key]:SetPoint("BOTTOM", buttons[key-1], "TOP", 0, F.Scale(4))
		-- _G[format("iFilgerConfigButton%dText", key)]:SetText("  AutoHide")
	-- elseif key == 4 then
		-- buttons[key]:SetPoint("BOTTOM", buttons[key-1], "TOP", 0, F.Scale(4))
		-- _G[format("iFilgerConfigButton%dText", key)]:SetText("  Minimize")
	-- elseif key == 5 then
		-- buttons[key]:SetPoint("BOTTOM", buttons[key-1], "TOP", 0, F.Scale(4))
		-- _G[format("iFilgerConfigButton%dText", key)]:SetText("  Timestamps") -- localize later
	-- end
	
	-- buttons[key]:SetScript("OnClick", OnClick)
	-- F.SkinCheckBox(buttons[key])
	-- iFilgerconfigPanel:SetSize(F.Scale(200), F.Scale((30 * (key-3)) + 30)) -- Auto size the background
-- end

local EnableConfig = function()
	ToggleFrame(iFilgerconfigPanel)
end

SLASH_IFILGERCONFIG1 = "/ciFilger"
SlashCmdList["IFILGERCONFIG"] = EnableConfig

-- Saved Variables
local SaveVariables = function(self, event)
	if event == "ADDON_LOADED" then
		if Config == nil then
			Config = {
				-- ["AutoFade"] = C["ChatWindows"].AutoFade,
				-- ["AutoHide"] = C["ChatWindows"].AutoHide,
				-- ["ShowTitle"] = C["ChatWindows"].ShowTitle,
				-- ["MinimizeAll"] = C["ChatWindows"].MinimizeAll,
				-- ["Width"] = C["ChatWindows"].Width,
				-- ["Height"] = C["ChatWindows"].Height,
				-- ["FontSize"] = C["ChatWindows"].FontSize,
				-- ["Timestamps"] = C["ChatWindows"].Timestamps,
			}
		end
		
		if Config then
			-- C["ChatWindows"] = Config
		end
		
	elseif event == "PLAYER_LOGOUT" then
		Config = {
			-- ["AutoFade"] = C["ChatWindows"].AutoFade,
			-- ["AutoHide"] = C["ChatWindows"].AutoHide,
			-- ["ShowTitle"] = C["ChatWindows"].ShowTitle,
			-- ["MinimizeAll"] = C["ChatWindows"].MinimizeAll,
			-- ["Width"] = C["ChatWindows"].Width,
			-- ["Height"] = C["ChatWindows"].Height,
			-- ["FontSize"] = C["ChatWindows"].FontSize,
			-- ["Timestamps"] = C["ChatWindows"].Timestamps,
		}
	end
	
	-- Clean this up
	-- if C["ChatWindows"].AutoFade then iFilgerConfigButton1:SetChecked() end
	-- if C["ChatWindows"].ShowTitle then iFilgerConfigButton2:SetChecked() end
	-- if C["ChatWindows"].AutoHide then iFilgerConfigButton3:SetChecked() end
	-- if C["ChatWindows"].MinimizeAll then iFilgerConfigButton4:SetChecked() end
	-- if C["ChatWindows"].Timestamps then iFilgerConfigButton5:SetChecked() end
	-- iFilgerConfigEdit1:SetText(C["ChatWindows"].Width)
	-- iFilgerConfigEdit2:SetText(C["ChatWindows"].Height)
	-- iFilgerConfigEdit3:SetText(C["ChatWindows"].FontSize)
end

local saver = CreateFrame("FRAME")
saver:RegisterEvent("ADDON_LOADED")
saver:RegisterEvent("PLAYER_LOGOUT")
saver:SetScript("OnEvent", SaveVariables)