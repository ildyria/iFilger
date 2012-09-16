local C, F, L = unpack(select(2, ...))

-- Media
C.blank = [[Interface\AddOns\iFilger_ConfigUI\media\blank]]
C.font = [=[Interface\AddOns\iFilger_ConfigUI\media\font.ttf]=]

local client = GetLocale()

if client == "koKR" then
	C.font = [=[Interface\AddOns\iFilger_ConfigUI\media\batang.ttf]=]
end

if client == "zhCN" then 
	C.font = [=[fonts\ARHei.ttf]=] 
end

if client == "zhTW" then 
	C.font = [=[fonts\ARHei.ttf]=] 
end


local function GetTemplate(t)
	if t == "iFilger" then
		borderr, borderg, borderb = .6, .6, .6
		backdropr, backdropg, backdropb = .1, .1, .1
	elseif t == "ClassColor" then
		local c = I.oUF_colors.class[class]
		borderr, borderg, borderb = c[1], c[2], c[3]
		backdropr, backdropg, backdropb = unpack(C["General"].BackdropColor)
	elseif t == "Elv" then
		borderr, borderg, borderb = .3, .3, .3
		backdropr, backdropg, backdropb = .1, .1, .1	
	elseif t == "Duffed" then
		borderr, borderg, borderb = .2, .2, .2
		backdropr, backdropg, backdropb = .02, .02, .02
	elseif t == "Dajova" then
		borderr, borderg, borderb = .05, .05, .05
		backdropr, backdropg, backdropb = .1, .1, .1
	elseif t == "Eclipse" then
		borderr, borderg, borderb = .1, .1, .1
		backdropr, backdropg, backdropb = 0, 0, 0
	elseif t == "Hydra" then
		borderr, borderg, borderb = .2, .2, .2
		backdropr, backdropg, backdropb = .075, .075, .075
	else
		borderr, borderg, borderb = unpack(C["General"].BorderColorConfig)
		backdropr, backdropg, backdropb = unpack(C["General"].BackdropColor)
	end
end

-- Functions, credit Tukui (Tukz / nightcracker)
local UIscale = min(2, max(.64, 768/string.match(({GetScreenResolutions()})[GetCurrentResolution()], "%d+x(%d+)")))
local mult = 768/string.match(GetCVar("gxResolution"), "%d+x(%d+)")/UIscale
local Scale = function(x)
    return mult*math.floor(x/mult+.5)
end

F.Scale = function(x) return Scale(x) end

local function SetTemplate(f, t, tex)
	if tex then texture = C.normTex else texture = C.blank end
	
	GetTemplate(t)
		
	f:SetBackdrop({
	  bgFile = texture, 
	  edgeFile = C.blank, 
	  tile = false, tileSize = 0, edgeSize = mult, 
	  insets = { left = -mult, right = -mult, top = -mult, bottom = -mult}
	})
	
	if t == "Transparent" then backdropa = 0.8 else backdropa = 1 end
	
	f:SetBackdropColor(backdropr, backdropg, backdropb, backdropa)
	f:SetBackdropBorderColor(borderr, borderg, borderb)
end

local function Point(obj, arg1, arg2, arg3, arg4, arg5)
	-- anyone has a more elegant way for this?
	if type(arg1)=="number" then arg1 = Scale(arg1) end
	if type(arg2)=="number" then arg2 = Scale(arg2) end
	if type(arg3)=="number" then arg3 = Scale(arg3) end
	if type(arg4)=="number" then arg4 = Scale(arg4) end
	if type(arg5)=="number" then arg5 = Scale(arg5) end

	obj:SetPoint(arg1, arg2, arg3, arg4, arg5)
end

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

local function innerBorder(f)
	if f.innerborder then f.innerborder:Show() return end
	f.innerborder = CreateFrame("Frame", nil, f)
	f.innerborder:SetPoint("TOPLEFT", mult, -mult)
	f.innerborder:SetPoint("BOTTOMRIGHT", -mult, mult)
	f.innerborder:SetBackdrop({
		edgeFile = C.blank, 
		edgeSize = mult, 
		insets = { left = mult, right = mult, top = mult, bottom = mult }
	})
	f.innerborder:SetBackdropBorderColor(0,0,0)
	
end

local function outerBorder(f)
	if f.outerborder then f.outerborder:Show() return end
	f.outerborder = CreateFrame("Frame", nil, f)
	f.outerborder:SetPoint("TOPLEFT", -mult, mult)
	f.outerborder:SetPoint("BOTTOMRIGHT", mult, -mult)
	f.outerborder:SetBackdrop({
		edgeFile = C.blank, 
		edgeSize = mult, 
		insets = { left = mult, right = mult, top = mult, bottom = mult }
	})
	f.outerborder:SetBackdropBorderColor(0,0,0)
	
end

local function ThickBorder(f, force)
	if f.backdrop and not force then
		outerBorder(f.backdrop)
		innerBorder(f.backdrop)
	else
		outerBorder(f)
		innerBorder(f)
	end
end

F.SkinScrollBar = function(frame)
	if _G[frame:GetName().."BG"] then _G[frame:GetName().."BG"]:SetTexture(nil) end
	if _G[frame:GetName().."Track"] then _G[frame:GetName().."Track"]:SetTexture(nil) end

	if _G[frame:GetName().."Top"] then
		_G[frame:GetName().."Top"]:SetTexture(nil)
	end
	
	if _G[frame:GetName().."Bottom"] then
		_G[frame:GetName().."Bottom"]:SetTexture(nil)
	end
	
	if _G[frame:GetName().."Middle"] then
		_G[frame:GetName().."Middle"]:SetTexture(nil)
	end

	if _G[frame:GetName().."ScrollUpButton"] and _G[frame:GetName().."ScrollDownButton"] then
		StripTextures(_G[frame:GetName().."ScrollUpButton"])
		SetTemplate(_G[frame:GetName().."ScrollUpButton"], "Default", true)
		if not _G[frame:GetName().."ScrollUpButton"].texture then
			_G[frame:GetName().."ScrollUpButton"].texture = _G[frame:GetName().."ScrollUpButton"]:CreateTexture(nil, "OVERLAY")
			Point(_G[frame:GetName().."ScrollUpButton"].texture, "TOPLEFT", 2, -2)
			Point(_G[frame:GetName().."ScrollUpButton"].texture, "BOTTOMRIGHT", -2, 2)
			_G[frame:GetName().."ScrollUpButton"].texture:SetTexture([[Interface\AddOns\iFilger_ConfigUI\Media\arrowup.tga]])
			_G[frame:GetName().."ScrollUpButton"].texture:SetVertexColor(unpack(C["General"].BorderColorConfig))
		end	
		
		StripTextures(_G[frame:GetName().."ScrollDownButton"])
		SetTemplate(_G[frame:GetName().."ScrollDownButton"], "Default", true)
	
		if not _G[frame:GetName().."ScrollDownButton"].texture then
			_G[frame:GetName().."ScrollDownButton"].texture = _G[frame:GetName().."ScrollDownButton"]:CreateTexture(nil, "OVERLAY")
			Point(_G[frame:GetName().."ScrollDownButton"].texture, "TOPLEFT", 2, -2)
			Point(_G[frame:GetName().."ScrollDownButton"].texture, "BOTTOMRIGHT", -2, 2)
			_G[frame:GetName().."ScrollDownButton"].texture:SetTexture([[Interface\AddOns\iFilger_ConfigUI\Media\arrowdown.tga]])
			_G[frame:GetName().."ScrollDownButton"].texture:SetVertexColor(unpack(C["General"].BorderColorConfig))
		end				
		
		if not frame.trackbg then
			frame.trackbg = CreateFrame("Frame", nil, frame)
			Point(frame.trackbg, "TOPLEFT", _G[frame:GetName().."ScrollUpButton"], "BOTTOMLEFT", 0, -1)
			Point(frame.trackbg, "BOTTOMRIGHT", _G[frame:GetName().."ScrollDownButton"], "TOPRIGHT", 0, 1)
			SetTemplate(frame.trackbg, "Transparent")
		end
		
		if frame:GetThumbTexture() then
			if not thumbTrim then thumbTrim = 3 end
			frame:GetThumbTexture():SetTexture(nil)
			if not frame.thumbbg then
				frame.thumbbg = CreateFrame("Frame", nil, frame)
				Point(frame.thumbbg, "TOPLEFT", frame:GetThumbTexture(), "TOPLEFT", 2, -thumbTrim)
				Point(frame.thumbbg, "BOTTOMRIGHT", frame:GetThumbTexture(), "BOTTOMRIGHT", -2, thumbTrim)
				SetTemplate(frame.thumbbg, "Default", true)
				if frame.trackbg then
					frame.thumbbg:SetFrameLevel(frame.trackbg:GetFrameLevel())
				end
			end
		end	
	end	
end

local function addapi(object)
	local mt = getmetatable(object).__index
	if not object.ThickBorder then mt.ThickBorder = ThickBorder end
	if not object.SetTemplate then mt.SetTemplate = SetTemplate end
	if not object.Point then mt.Point = Point end
	if not object.InnerBorder then mt.Innerborder = innerBorder end
	if not object.OuterBorder then mt.Outerborder = outerBorder end
	if not object.SkinScrollBar then mt.SkinScrollBar = SkinScrollBar end
end

local handled = {["Frame"] = true}
local object = CreateFrame("Frame")
addapi(object)
addapi(object:CreateTexture())
addapi(object:CreateFontString())

object = EnumerateFrames()
while object do
	if not handled[object:GetObjectType()] then
		addapi(object)
		handled[object:GetObjectType()] = true
	end

	object = EnumerateFrames(object)
end