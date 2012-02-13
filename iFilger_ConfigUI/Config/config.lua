local C, F, L = unpack(select(2, ...))

C["General"] = {
	["BorderColor"] = {.2, .2, .2, 1},
	["BackdropColor"] = {.075, .075, .075, 0.6},
}


if iFilgerBuffConfig then 
	C["Filger_Spells"] = iFilgerBuffConfig["Filger_Spells"]
	C["Filger_Panels"] = iFilgerBuffConfig["Filger_Panels"]
end