local I, C, L = unpack(select(2, ...)) -- Import: I - functions, constants, variables; C - config; L - locales

C["general"] = {
	["autoscale"] = false,								-- mainly enabled for users that don't want to mess with the config file
	["uiscale"] = 0.61,									-- set your value (between 0.64 and 1) of your uiscale if autoscale is off
	["multisampleprotect"] = true,						-- i don't recommend this because of shitty border but, voila!
	["backdropcolor"] = { .1,.1,.1 },					-- default backdrop color of panels
	["bordercolor"] = { .6,.6,.6 },						-- default border color of panels
	["cleverzone"] = false,								-- load only PVP in PVP zones and PVE in PVE zones (require to reload the 1st time you enter the pve zone)
	["tooltip"] = true,									-- tooltip on mouseover buffs, some people wanted it. I don't.
}

C["cooldown"] = { -- will be disabled if Tukui / ElvUI / OmniCC / ncCooldown is enabled
	["enable"] = true,									-- do i really need to explain this?
	["treshold"] = 8,									-- show decimal under X seconds and text turn red
	["fontsize"] = 20,									--the base font size to use at a scale of 1
}

-- NOT USING ANYMORE. BUFF CONFIG IS DONE IN iFilger_Config/iFilger_Config.lua