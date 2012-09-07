local I, C, L = unpack(select(2, ...))

C["media"] = {
	-- fonts (ENGLISH, SPANISH)
	["font"] = [=[Interface\Addons\iFilger\media\fonts\normal_font.ttf]=], -- general font of iFilger
	
	-- fonts (GLOBAL)
	["pixelfont"] = [=[Interface\Addons\iFilger\media\fonts\pixel_font.ttf]=], -- general font of iFilger
	
	-- textures
	["normTex"] = [[Interface\AddOns\iFilger\media\textures\normTex]], -- texture used for iFilger
	["glowTex"] = [[Interface\AddOns\iFilger\media\textures\glowTex]], -- the glow text around some frame.
	["blank"] = [[Interface\AddOns\iFilger\media\textures\blank]], -- the main texture for all borders/panels
	["bordercolor"] = { .6,.6,.6 }, -- border color of iFilger panels
	["altbordercolor"] = { .4,.4,.4 }, -- alternative border color, mainly for unitframes text panels.
	["backdropcolor"] = { .1,.1,.1 }, -- background color of tukui panels
}
