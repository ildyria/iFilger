----------------------------------------------------------------------------
-- Per Class Config (overwrite general)
-- Class need to be UPPERCASE
----------------------------------------------------------------------------
local myclass = select(2, UnitClass("player"))
local myname = select(1, UnitName("player"))

if myclass == "PRIEST" then
	-- do some config!
end

----------------------------------------------------------------------------
-- Per Character Name Config (overwrite general and class)
-- Name need to be case sensitive
----------------------------------------------------------------------------

if myname == "Ildyria" then
	iFilgerConfig["Filger_Config"].cleverzone = true
	iFilgerConfig["Filger_Config"].tooltip = true
	iFilgerConfig["Filger_Spells"]["TANKS"][3].Enable = false
	iFilgerConfig["Filger_Spells"]["ALL"][2].Enable = false
	iFilgerConfig["Filger_Spells"]["ALL"][3].Enable = false
	-- yeah my default config is not really like default iFilger.
end

if myname == "Cirælina" then
	iFilgerConfig["Filger_Config"].cleverzone = true
	iFilgerConfig["Filger_Config"].tooltip = true
	iFilgerConfig["Filger_Spells"]["TANKS"][3].Enable = true
	iFilgerConfig["Filger_Spells"]["ALL"][2].Enable = false
	iFilgerConfig["Filger_Spells"]["ALL"][3].Enable = false
	-- yeah my default config is not really like default iFilger.
end

if myname == "Nâmi" then
	for index, value in ipairs(iFilgerConfig["Filger_Spells"]["PVP"]) do
		value.Enable = false
	end
end