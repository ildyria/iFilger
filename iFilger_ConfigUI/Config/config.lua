local C, F, L = unpack(select(2, ...))

C["General"] = {
	["BorderColor"] = {.2, .2, .2, 1},
	["BackdropColor"] = {.075, .075, .075, 0.6},
}


if iFilgerConfig then 
	C["Filger_Spells"] = iFilgerConfig["Filger_Spells"]
	C["Filger_Panels"] = iFilgerConfig["Filger_Panels"]
end