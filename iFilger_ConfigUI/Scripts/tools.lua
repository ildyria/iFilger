local C, F, L = unpack(select(2, ...))

-- Media
C.blank = [[Interface\AddOns\iFilger_ConfigUI\media\blank]]
C.font = [=[Interface\AddOns\iFilger_ConfigUI\media\font.ttf]=]

-- Functions, credit Tukui (Tukz / nightcracker)

local UIscale = min(2, max(.64, 768/string.match(({GetScreenResolutions()})[GetCurrentResolution()], "%d+x(%d+)")))
local mult = 768/string.match(GetCVar("gxResolution"), "%d+x(%d+)")/UIscale
local Scale = function(x)
    return mult*math.floor(x/mult+.5)
end

F.Scale = function(x) return Scale(x) end

F.CreatePanel = function(f, w, h, a1, p, a2, x, y)
	local sh = Scale(h)
	local sw = Scale(w)
	f:SetFrameLevel(1)
	f:SetHeight(sh)
	f:SetWidth(sw)
	f:SetFrameStrata("BACKGROUND")
	f:SetPoint(a1, p, a2, Scale(x), Scale(y))
	f:SetBackdrop({
	  bgFile = C.blank, 
	  edgeFile = C.blank, 
	  tile = false, tileSize = 0, edgeSize = mult, 
	  insets = { left = -mult, right = -mult, top = -mult, bottom = -mult}
	})
	
	f:SetBackdropColor(unpack(C["General"].BackdropColor))
	f:SetBackdropBorderColor(unpack(C["General"].BorderColorConfig))
end

F.Kill = function(object)
	if object.UnregisterAllEvents then
		object:UnregisterAllEvents()
	end
	
	object.Show = function() end
	object:Hide()
end

F.SetBorder = function(frame)
	if frame:GetFrameStrata() == "BACKGROUND" then frame:SetFrameStrata("LOW") end

	frame:SetBackdropColor(.075, .075, .075, 0.6)
	frame:SetBackdropBorderColor(unpack(C["General"].BorderColorConfig))
	
	local border = CreateFrame("Frame", nil, frame)
	border:SetPoint("TOPLEFT", frame, "TOPLEFT", F.Scale(-1), F.Scale(1))
	border:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", F.Scale(1), F.Scale(-1))
	border:SetFrameStrata("BACKGROUND")
	border:SetFrameLevel(1)
	border:SetBackdrop { edgeFile = C.blank, edgeSize = F.Scale(3), insets = {left = 0, right = 0, top = 0, bottom = 0} }
	border:SetBackdropColor(unpack(C["General"].BackdropColor))
	border:SetBackdropBorderColor(unpack(C["General"].BorderColorConfig))
end

local CreateBackdrop = function(f)
	if not t then t = "Default" end

	local b = CreateFrame("Frame", nil, f)
	b:SetPoint("TOPLEFT", F.Scale(-2), F.Scale(2))
	b:SetPoint("BOTTOMRIGHT", F.Scale(2), F.Scale(-2))
	b:SetBackdrop({
	  bgFile = C.blank, 
	  edgeFile = C.blank, 
	  tile = false, tileSize = 0, edgeSize = mult, 
	  insets = { left = -mult, right = -mult, top = -mult, bottom = -mult}
	})
	b:SetBackdropColor(unpack(C["General"].BackdropColor))
	b:SetBackdropBorderColor(unpack(C["General"].BorderColorConfig))

	if f:GetFrameLevel() - 1 >= 0 then
		b:SetFrameLevel(f:GetFrameLevel() - 1)
	else
		b:SetFrameLevel(0)
	end

	f.backdrop = b
end

local StripTextures = function(object, kill)
	for i = 1, object:GetNumRegions() do
		local region = select(i, object:GetRegions())
		if region:GetObjectType() == "Texture" then
			if kill then
				F.Kill(region)
			else
				region:SetTexture(nil)
			end
		end
	end		
end

F.SkinCheckBox = function(frame)
	StripTextures(frame)
	CreateBackdrop(frame)
	frame.backdrop:SetPoint("TOPLEFT", F.Scale(4), F.Scale(-4))
	frame.backdrop:SetPoint("BOTTOMRIGHT", F.Scale(-4), F.Scale(4))
	
	if frame.SetCheckedTexture then
		frame:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")
	end
	
	if frame.SetDisabledTexture then
		frame:SetDisabledTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")
	end
	
	frame.SetNormalTexture = function() return end
	frame.SetPushedTexture = function() return end
	frame.SetHighlightTexture = function() return end
end

local waitTable = {}
local waitFrame
F.Delay = function(delay, func, ...)
	if (type(delay) ~= "number" or type(func) ~= "function") then
		return false
	end
	
	if (waitFrame == nil) then
		waitFrame = CreateFrame("Frame", "WaitFrame", UIParent)
		waitFrame:SetScript("OnUpdate", function (self, elapse)
			local count = #waitTable
			local i = 1
			while (i <= count) do
				local waitRecord = tremove(waitTable, i)
				local d = tremove(waitRecord, 1)
				local f = tremove(waitRecord, 1)
				local p = tremove(waitRecord, 1)
				if(d > elapse) then
					tinsert(waitTable, i, {d-elapse, f, p})
					i = i + 1
				else
					count = count - 1
					f(unpack(p))
				end
			end
		end)
	end
	
	tinsert(waitTable, {delay, func, {...}})
	return true
end