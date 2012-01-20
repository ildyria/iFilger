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

if I.myname == "Ildyria" then
	C.Filger.cleverzone = true
--	C.Filger.tooltip = false
--	iFilgerBuffConfig["Filger_Spells"]["ALL"][3].Enable = false -- disable ICD
	-- yeah my default config is not really like default iFilger.
end

if I.myname == "Nâmi" then
	for index, value in ipairs(iFilgerBuffConfig["Filger_Spells"]["PVP"]) do
		value.Enable = false
	end
end