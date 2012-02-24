local I, C, L = unpack(select(2, ...)) -- Import: I - functions, constants, variables; C - config; L - locales




------------------------------------------------------------------------
--	Movers Frame
------------------------------------------------------------------------

I.MoverFrames = {}

I.CreateMover = function(name, w, h, anchor, x, y, color, text)
	local frame = CreateFrame("Frame", name, UIParent) -- Ice Block / smoke / ShS...
	I.CreateMoverFrames(frame, w, h, anchor, x, y, color, text)
	table.insert(I.MoverFrames,frame)
end

I.CreateMoverFrames = function(frame, w, h, anchor, x, y, color, text)
	frame:CreatePanel("Transparent",w, h,anchor, "UIParent" , "CENTER", x, y)
	frame:SetMovable(true)
	if(color == "class")
	then
		frame:SetBackdropBorderColor(RAID_CLASS_COLORS[I.myclass].r,RAID_CLASS_COLORS[I.myclass].g,RAID_CLASS_COLORS[I.myclass].b)
	else
		frame:SetBackdropBorderColor(1,0,0)
	end
	frame:SetFrameLevel(2)
	frame:SetFrameStrata("HIGH")
	frame.text = I.SetFontString(frame, C.media.pixelfont, 16, "MONOCHROMEOUTLINE")
	frame.text:SetPoint("CENTER")
	frame.text:SetText("Move "..text)
	frame:Hide()
end



---------------------------------
-- Filger FRAMES
---------------------------------

local Filger_Panels;
if iFilgerBuffConfig then 
	Filger_Panels = iFilgerBuffConfig["Filger_Panels"]
else
	Filger_Panels = C.Filger_Panels
end

-- load all of them even if we don't use some of them (like pvp in pve & so...)
if (Filger_Panels["ALL"]) then
	for i = 1, #Filger_Panels["ALL"], 1 do
		local panel = Filger_Panels["ALL"][i];
		I.CreateMover(panel.name, panel.w, panel.h, panel.anchor, panel.x, panel.y, "red", panel.text)
	end
end



---------------------------------
-- CLASS FRAMES Filger
---------------------------------

if (Filger_Panels[I.myclass]) then
	for i = 1, #Filger_Panels[I.myclass], 1 do
		local panel = Filger_Panels[I.myclass][i];
		I.CreateMover(panel.name, panel.w, panel.h, panel.anchor, panel.x, panel.y, "class", panel.text)
	end
end
