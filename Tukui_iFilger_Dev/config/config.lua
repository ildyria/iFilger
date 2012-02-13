local I, C, L = unpack(Tukui) -- Import: I - functions, constants, variables; C - config; L - locales

C["Filger"] = {
	["cleverzone"] = false,								-- load only PVP in PVP zones and PVE in PVE zones (require to reload the 1st time you enter the pve zone)
	["tooltip"] = false,									-- tooltip on mouseover buffs, some people wanted it. I don't.
}

C["cooldown"].fontsize = 20									--the base font size to use at a scale of 1


-- BUFF CONFIG IS DONE IN iFilger_Config/iFilger_Config.lua