local C, F, L = unpack(select(2, ...))

--local colorframe:SetBackdropBorderColor(RAID_CLASS_COLORS[I.myclass].r,RAID_CLASS_COLORS[I.myclass].g,RAID_CLASS_COLORS[I.myclass].b)
local myClass = select(2, UnitClass("player"));

C["General"] = {
	["BackdropColor"] = {.075, .075, .075, 0.6},
	["BorderColorConfig"] = {.58, .58, .58, 1},
	["BorderColorHeader"] = {.39, .39, .39, 1},
	["BorderColorTab"] = {.2, .2, .2, 1},
	["ClassColor"] = {RAID_CLASS_COLORS[myClass].r,RAID_CLASS_COLORS[myClass].g,RAID_CLASS_COLORS[myClass].b},
	["White"] = {1, 1, 1},
	["Red"] = {1, 0, 0},
}