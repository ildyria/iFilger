﻿----------------------------------------------------------------------------
-- Per Class Config (overwrite general)
-- Class need to be UPPERCASE
----------------------------------------------------------------------------
local I, C, L = unpack(select(2, ...)) -- Import: I - functions, constants, variables; C - config; L - locales

if I.myclass == "PRIEST" then
	-- do some config!
end

----------------------------------------------------------------------------
-- Per Character Name Config (overwrite general and class)
-- Name need to be case sensitive
----------------------------------------------------------------------------

if I.myname == "Tukz" then
	-- yeah my default config is not really like default tukui.
end

if I.myname == "Ildyria" then
	C.Filger.cleverzone = true
	C.Filger.tooltip = false
	-- yeah my default config is not really like default tukui.
end

if I.myname == "Nâmi" then
	for index, value in ipairs(C["Filger_Spells"]["PVP"]) do
		value.Enable = false
	end
end