local I, C, L = unpack(select(2, ...)) -- Import: I - functions, constants, variables; C - config; L - locales

C["general"] = {
	["autoscale"] = false,								-- mainly enabled for users that don't want to mess with the config file
	["uiscale"] = 0.61,									-- set your value (between 0.64 and 1) of your uiscale if autoscale is off
	["multisampleprotect"] = true,						-- i don't recommend this because of shitty border but, voila!
	["backdropcolor"] = { .1,.1,.1 },					-- default backdrop color of panels
	["bordercolor"] = { .6,.6,.6 },						-- default border color of panels
}

-- NOT USING ANYMORE. CONFIG IS DONE IN iFilger_Config/iFilger_Config.lua