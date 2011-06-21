------------------------------------------------------------------------
-- prevent action bar users config errors
------------------------------------------------------------------------
local E, C, L, DB = unpack(select(2, ...)) -- Import Functions/Constants, Config, Locales
local LSM = LibStub("LibSharedMedia-3.0")

--Convert default database
for group,options in pairs(DB) do
	if not C[group] then C[group] = {} end
	for option, value in pairs(options) do
		C[group][option] = value
	end
end

if C["general"].classcolortheme == true then
	C["unitframes"].classcolor = true
end

E.UnpackColors = function(color)
	if not color.r then color.r = 0 end
	if not color.g then color.g = 0 end
	if not color.b then color.b = 0 end
	
	if color.a then
		return color.r, color.g, color.b, color.a
	else
		return color.r, color.g, color.b
	end
end

-------------------------------
-- Convert Colors
-------------------------------
C["media"].backdropcolor = {E.UnpackColors(C["media"].backdropcolor)}
C["media"].bordercolor = {E.UnpackColors(C["media"].bordercolor)}
C["actionbar"].expiringcolor = {E.UnpackColors(C["actionbar"].expiringcolor)}
C["actionbar"].secondscolor = {E.UnpackColors(C["actionbar"].secondscolor)}
C["actionbar"].minutescolor = {E.UnpackColors(C["actionbar"].minutescolor)}
C["actionbar"].hourscolor = {E.UnpackColors(C["actionbar"].hourscolor)}

-------------------------------
-- Load Shared Media Settings
-------------------------------
C["media"].font = LSM:Fetch("font", C["media"].font)
C["media"].normTex = LSM:Fetch("statusbar", C["media"].normTex)
C["media"].blank = LSM:Fetch("background", C["media"].blank)
