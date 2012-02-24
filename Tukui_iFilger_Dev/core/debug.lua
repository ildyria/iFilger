local I, C, L = unpack(Tukui) -- Import: I - functions, constants, variables; C - config; L - locales

---------------------------------
-- Text frame functions (thx Hydra)
---------------------------------
local numlines = 2

local OnMouseWheel = function(self, delta) -- Blizzard/Tukui credit
	if delta < 0 then
		if IsShiftKeyDown() then
			self.text:ScrollToBottom()
		else
			for i = 1, numlines do
				self.text:ScrollDown()
			end
		end
	elseif delta > 0 then
		if IsShiftKeyDown() then
			self.text:ScrollToTop()
		else
			for i = 1, numlines do
				self.text:ScrollUp()
			end
		end
	end
end

local OnEnter = function(self)
	if (self.faded and self:GetAlpha() ~= 1) then
		UIFrameFadeIn(self, 0.4, 0.4, 1)
	end
	
	self.faded = false
end

local OnLeave = function(self)
	if not self.faded then
		UIFrameFadeIn(self, 0.4, 1, 0.4)
		self.faded = true
	end
end



---------------------------------
-- Create text frame and make function aviable to other scripts
---------------------------------

I.InitNewFrame = function() -- Create the new frame
	if _G["Chat_iFilger"] then return end
		
	chatColor = ChatTypeInfo["BN_WHISPER"]
	hex = string.format("|c%02x%02x%02x%02x", 255, chatColor.r * 255, chatColor.g * 255, chatColor.b * 255)

	local Chatbox = CreateFrame("Frame", "Chat_iFilger", UIParent)
	Chatbox:CreatePanel(Chatbox, 300, 80, "TOP", UIParent, "TOP", 400, -14)
	Chatbox:EnableMouse(true)
	Chatbox:SetMovable(true)
	Chatbox:RegisterForDrag("LeftButton")
	Chatbox:EnableMouseWheel(true)
	Chatbox:SetScript("OnMouseWheel", OnMouseWheel)
	Chatbox:SetScript("OnDragStart", function(self) self:SetUserPlaced(true) self:StartMoving() end)
	Chatbox:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
	Chatbox:SetScript("OnEnter", OnEnter)
	Chatbox:SetScript("OnLeave", OnLeave)
	Chatbox:SetClampedToScreen(true)
	
	Chatbox.hex = hex

	Chatbox.title = UIParent:CreateFontString("HydraChat_iFilgerTitle", "OVERLAY")
	Chatbox.title:SetFont(C.media.font, C["datatext"].fontsize)
	Chatbox.title:SetShadowColor(0, 0, 0)
	Chatbox.title:SetShadowOffset(1.25, -1.25)
	Chatbox.title:SetPoint("BOTTOMLEFT", Chatbox, "TOPLEFT", 0, 1)
	Chatbox.title:SetText(hex.."iFilger Debug|r")
	
	Chatbox.text = CreateFrame("ScrollingMessageFrame", "Chat_iFilgerText", Chatbox)
	Chatbox.text:SetFont(C.media.font, C["datatext"].fontsize)
	Chatbox.text:SetShadowColor(0, 0, 0)
	Chatbox.text:SetShadowOffset(1.25, -1.25)
	Chatbox.text:SetPoint("TOPLEFT", 2, -2)
	Chatbox.text:SetPoint("BOTTOMRIGHT", -2, 2)
	Chatbox.text:SetJustifyH("LEFT")
	Chatbox.text:SetFading(false)
	Chatbox.text:SetMaxLines(20)

	Chatbox.hideBG = CreateFrame("Frame", nil, Chatbox)
	Chatbox.hideBG:CreatePanel(Chatbox.hideBG, 12, 12, "BOTTOMRIGHT", Chatbox, "TOPRIGHT", 0, 1)
	Chatbox.hideBG:EnableMouse(true)
	Chatbox.hideBG:SetFrameStrata("HIGH")
	Chatbox.hideBG:SetScript("OnMouseDown", function()	
		Chatbox.title:Kill()
		_G["Chat_iFilger"]:Kill()
		_G["Chat_iFilgerText"]:Kill()
		_G["Chat_iFilger"] = nil
		_G["Chat_iFilgerText"] = nil
	end)
	
	Chatbox.hideBG:SetScript("OnEnter", function() Chatbox.close:SetTextColor(1,0,0) end)
	Chatbox.hideBG:SetScript("OnLeave", function() Chatbox.close:SetTextColor(1,1,1) end)
	
	Chatbox.close = Chatbox.hideBG:CreateFontString(nil, "OVERLAY")
	Chatbox.close:SetFont(C.media.font, C["datatext"].fontsize)
	Chatbox.close:SetPoint("CENTER", 1, 0)
	Chatbox.close:SetText("X")
	Chatbox:SetAlpha(0.4)
	Chatbox.faded = true
end



---------------------------------
-- Add messages to it... and make function aviable to other scripts
---------------------------------

I.iFilgerAddIncoming = function(msg) -- Add messages to the frame

	if not(_G["Chat_iFilger"]) then
		return
	end

	local frame = _G["Chat_iFilgerText"]
	
	local Hr, Min, timestamp
	
	Hr, Min = GetGameTime()
	timestamp = format("[%d:%d] ", Hr, Min)

	local color = ChatTypeInfo["BN_WHISPER"]
	local addmessage = frame.AddMessage
	frame.AddMessage = function(self, text, ...) addmessage(self, text, ...) end
	
	frame:AddMessage(timestamp..msg, 1, 1, 1, nil, false)
end



---------------------------------
-- Add slash command so we can use debug window...
---------------------------------

local function debugiFilger()
	I.InitNewFrame()
end

SLASH_DEBUGIFILGER1 = "/difilger"
SLASH_DEBUGIFILGER2 = "/debugfilger"
SlashCmdList.DEBUGIFILGER = debugiFilger