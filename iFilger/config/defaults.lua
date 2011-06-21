local E, C, L, DB = unpack(select(2, ...)) -- Import Functions/Constants, Config, Locales

DB["media"] = {
	-- fonts
	["font"] = "ElvUI Font", -- general font of Elvui
		
	-- textures
	["normTex"] = "ElvUI Norm", -- texture used for Elvui healthbar/powerbar/etc
	["blank"] = "ElvUI Blank",
	
	--colors
	["bordercolor"] = { r = .23,g = .23,b = .23 }, -- border color of Elvui panels
	["backdropcolor"] = { r = .07,g = .07,b = .07 }, -- background color of Elvui panels
}


DB["general"] = {
	["autoscale"] = false,                  -- mainly enabled for users that don't want to mess with the config file
	["uiscale"] = 0.75,                    -- set your value (between 0.64 and 1) of your uiscale if autoscale is off
}

DB["actionbar"] = {
	["enablecd"] = true,                     -- do i really need to explain this?
	["treshold"] = 3,                      -- show decimal under X seconds and text turn red
	["expiringcolor"] = { r = 1, g = 0, b = 0 },		--color of expiring seconds turns to 
	["secondscolor"] = { r = 1, g = 1, b = 0 },			--seconds color
	["minutescolor"] = { r = 1, g = 1, b = 1 },			-- minutes color
	["hourscolor"] = { r = 0.4, g = 1, b = 1 },			-- hours color
}