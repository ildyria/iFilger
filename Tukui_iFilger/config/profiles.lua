----------------------------------------------------------------------------
-- Per Class Config (overwrite general)
-- Class need to be UPPERCASE
----------------------------------------------------------------------------
local I, C, L = unpack(Tukui) -- Import: I - functions, constants, variables; C - config; L - locales

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

if I.myname == "Nâmi" then
	C["general"].PVP = false
	C["general"].TANKS = true
end
