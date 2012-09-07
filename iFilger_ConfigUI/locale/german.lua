local C, F, L = unpack(select(2, ...))

local client = GetLocale()

if client == "deDE" then
	L["Global"] = "Globale Konfiguration"
	L["iFilger"] = "|cff1784d1iFilger|r |cffffffffKonfiguration|r"
	L["Config"] = "Wenn du |cff1784d1iFilger|r mit der LUA-Datei konfigurierst und\n trotzdem die Konfigurations-UI benutzen \n möchtest, vergess nicht jedes mal auf |cff1784d1Zurücksetzen|r\n zu klicken wenn du config.lua änderst."

	-- option name
	L["Name"] = "Name"
	L["Enable"] = "Aktivieren"
	L["Size"] = "Größe"
	L["Direction"] = "Richtung"
	L["IconSide"] = "Seite des Icons"
	L["Interval"] = "Intervall"
	L["Mode"] = "Modus"
	L["Alpha"] = "Alpha"
	L["BarWidth"] = "Breite"
	L["Merge"] = "Zusammenfügen"

	L["cleverzone"] = "Zonenerkennung"
	L["tooltip"] = "Tooltip"
	L["TooltipMover"] = "Tooltip Bewegen"
	L["FlashIcon"] = "Icon Blinken"
	L["FlashBar"] = "Balken Blinken"
	L["FlashThreshold"] = "Blinken Grenzwert"
	L["FlashDuration"] = "Blinkdauer"

	-- option help
	L["H_Name"] = "Die Name des Abschnittes"
	L["H_Enable"] = "Aktivieren oder Deaktivieren des Abschnittes"
	L["H_Size1"] = "Größe der Icons"
	L["H_Size2"] = "Muss größer Null sein"
	L["H_Direction1"] = "Wachstumsrichtung der Icons"
	L["H_Direction2"] = "UP (Hoch), DOWN (Nach Unten), LEFT (Links), RIGHT (Rechts) oder HORIZONTAL (Waagerecht)"
	L["H_IconSide1"] = "Position des Icons im Balkenmodus"
	L["H_IconSide2"] = " LEFT (Links) oder RIGHT (Rechts)"
	L["H_Interval"] = "Platz zwischen Icons/Balken"
	L["H_Mode1"] = "Anzeigemodus"
	L["H_Mode2"] = "ICON oder BALKEN"
	L["H_Alpha1"] = "Transparenz"
	L["H_Alpha2"] = "Wähle zwischen 1 (Sichtbar) oder 0 (Unsichtbar)"
	L["H_BarWidth"] = "Breite des Balkens (Benötigt Balkenmodus)"
	L["H_Merge"] = "Lasse Zusammenlegung zu wenn Name gleich ist"

	L["H_cleverzone1"] = "Intelligente Zonenerkennung"
	L["H_cleverzone2"] = "Lade PvP nur in PvP Zonen und PvE nur in PvE Zonen"
	L["H_cleverzone3"] = "(Benötigt das Neuladen des UIs bem ersten Betreten einer PvE-Zone)"
	L["H_tooltip"] = "Bufftooltip"
	L["H_TooltipMover"] = "Benutze den Tooltip-Anker von Tukui und ElvUI (setzt die Installation von Tukui oder ElvUI voraus)."
	L["H_FlashIcon"] = "Blinken wenn verbleibende Zeit unterhalb des Grenzwertes liegt."
	L["H_FlashBar"] = "Blinken wenn verbleibende Zeit unterhalb des Grenzwertes im Balkenmodus liegt."
	L["H_FlashThreshold1"] = "Grenzwert des Blinkzeits."
	L["H_FlashThreshold2"] = "Muss größer 1 sein."
	L["H_FlashDuration1"] = "Blinkdauer."
	L["H_FlashDuration2"] = "Muss positiv sein. Je kleiner desto schneller."

	-- buttons
	L["Apply"] = "Anwenden"
	L["Reset Config"] = "Zurücksetzen"
	L["Move Buffs"] = "Buffs bewegen"
	L["Reset Buff Position"] = "Buffs zurücksetzen"
end