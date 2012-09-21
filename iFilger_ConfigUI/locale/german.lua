local C, F, L = unpack(select(2, ...))

local client = GetLocale()

if client == "deDE" then
	-- option name
	L["iFilger"] = "|cff1784d1iFilger|r |cffffffffConfiguration|r"
	L["Config"] = "Wenn|cff1784d1iFilger|r in der  Lua-Datei konfiguriert wurde und jedoch ein Benutzung des GUI gewünscht ist,\nmuss vorher nach jeder LUA-Konfiguration eine |cff1784d1Zurücksetzung der Konfiguration|r\ndruchgeführt werden"
	--Wenn iFilger in der Lua-Datei konfiguriert wurde und die GUI Option dennoch benutzt werden soll, muss vor der Benutzung des GUI die Konfiguration zurück gesetzt werden
	L["RESETMSG"] = "Are you sure you want to reset all of your settings to Default?" --Soll die Einstellung auf Standard zurück gesetzt werden?

	L["Name"] = "Name"
	L["Enable"] = "Einschalten"
	L["Size"] = "Größe"
	L["Direction"] = "Richtung"
	L["IconSide"] = "Ikon Seite"
	L["Interval"] = "Intervall"
	L["Mode"] = "Mode"
	L["Alpha"] = "Alpha"
	L["BarWidth"] = "Bar Breite"
	L["Merge"] = "Zusammen führen"
	L["Mergewith"] = "Zusammen führen mit"

	L["autoupdate"] = "Automatisches Update"
	L["cleverzone"] = "Clever Zone"
	L["tooltip"] = "Tooltip"
	L["TooltipMover"] = "Tooltip Mover"
	L["FlashIcon"] = "Blinken (Ikons)"
	L["FlashBar"] = "Blinken (Bars)"
	L["FlashThreshold"] = "Blinken Mindestwert"
	L["FlashDuration"] = "Blinken Dauer"

	L["AddSpell"] = "Zauber hinzufügen"
	L["spellID"] = "hinzufügen der Zauber ID oder Platz ID"
	L["filter"] = "Filter"
	L["unitId"] = "Unit ID"
	L["caster"] = "Spieler"
	L["absID"] = "Absolute ID"
	L["incombat"] = "Im Kampf"
	L["spec"] = "Spezifikation"
	L["trigger"] = "Trigger für ICD"
	L["duration"] = "Dauer für ICD"
	L["icon"] = "Ikon"

	-- option help
	L["H_Name"] = "Name der erweiterten Optionen"
	L["H_Enable"] = "Ein-/Ausschalten der erweiterten Optionen."
	L["H_Size1"] = "Ikon-Größe"
	L["H_Size2"] = "Muß eine positive Nummer sein"
	L["H_Direction1"] = "Richtung der Ikons"
	L["H_Direction2"] = "|cffffffffRAUF|r, |cffffffffRUNTER|r, |cffffffffLINKS|r, |cffffffffRECHTS|r oder |cffffffffHORIZONTAL|r"
	L["H_IconSide1"] = "Position des Ikons in Bar-Mode:"
	L["H_IconSide2"] = "|cffffffffLINKS|r oder |cffffffffRECHTS|r"
	L["H_Interval"] = "Abstand zwischen Ikon und Bar"
	L["H_Mode1"] = "Voransicht:"
	L["H_Mode2"] = "|cffffffffIKON|r oder |cffffffffBAR|r"
	L["H_Alpha1"] = "Transparenz:"
	L["H_Alpha2"] = "Wählen zwischen 1 (gefüllt) oder 0 (unsichtbar)"
	L["H_BarWidth"] = "Barweite (nur in Bar-Mode)"
	L["H_Merge"] = "Zusammenführen."
	L["H_Mergewith"] = "Listenname für Zusammenführung (nur wenn Zusammenführung aktiviert ist)."

	L["H_autoupdate"] = "Automatisches  aktualisiren der Konfiguration."
	L["H_cleverzone1"] = "Clever Zone:"
	L["H_cleverzone2"] = "Laden von PvP ausschließlich in PvP-Zonen und PvE ausschließlich in PvE-Zonen"
	L["H_cleverzone3"] = "(Erfordert, dass das UI neu gelanden wird, wenn zum ersten mal eine PvE-Zone betreten wird)"
	L["H_tooltip"] = "Tooltip am Ikons"
	L["H_TooltipMover"] = "Tooltip am TooltipMover für ElvUI und Tukui Benutzer."
	L["H_FlashIcon"] = "Blinkt im Ikon-Mode, wenn die verbleibende Zeit unterhalb des Grenzwertes liegt."
	L["H_FlashBar"] = "Blinkt im Bar-Mode, wenn die verbleibende Zeit unterhalb des Grenzwertes liegt."
	L["H_FlashThreshold1"] = "Bei blinkendem Ikon ist der Grenzwert erreicht."
	L["H_FlashThreshold2"] = "Muss größer als 1 sein."
	L["H_FlashDuration1"] = "Dauer für jedes einzelne blinken."
	L["H_FlashDuration2"] = "Muss eine positive Nummer sein, kleiner => schneller."

	L["H_spellID"] = "Zauber ID oder Platz ID : 13 oder 14 für Schmuck"
	L["H_filter1"] = "Liste der verfügbaren Filter: "
	L["H_filter2"] = "|cffffffffBUFF|r - filtert Stärkungszauber."
	L["H_filter3"] = "|cffffffffDEBUFF|r - filtert Schwächungszauber."
	L["H_filter4"] = "|cffffffffIBUFF|r - aufspüren  von fehlenden Stärkungszauber buff."
	L["H_filter5"] = "|cffffffffIDEBUFF|r - aufspüren  von fehlenden Schwächungszauber."
	L["H_filter6"] = "|cffffffffCD|r - aufspüren  Abklingzeit."
	L["H_filter7"] = "|cffffffffACD|r - aufspüren  ob die Abklingzeit verfügbar ist oder nicht, erfordert Zauber getzt zu \"allen\""
	L["H_filter8"] = "|cffffffffICD|r - aufspüren  Internal Abklingzeit, require trigger and duration"
	L["H_unitId1"] = "Liste der verfügbaren Unit-ID:"
	L["H_unitId2"] = "|cffffffffSpieler|r"
	L["H_unitId3"] = "|cffffffffZiel|r"
	L["H_unitId4"] = "|cffffffffFokus|r"
	L["H_unitId5"] = "|cffffffffBegleiter|r"
	L["H_unitId6"] = "|cffffffffZiel von Ziel|r"
	L["H_unitId7"] = "|cffffffffGruppe1|r ..."
	L["H_unitId8"] = "|cffffffffArena1|r ..."
	L["H_caster"] = "|cffffffffSpieler|r or |cffffffffAlle|r - nur gezaubert von Spieler oder allen"
	L["H_absID"] = "Nur anzeigen wenn die Zauber-ID identisch ist"
	L["H_incombat"] = "Anzeige nur im Kampf"
	L["H_spec"] = "Nur anzeigen wenn in Talent (|cffffffff1|r |cffffffff2|r |cffffffff3|r or |cffffffff4|r)"
	L["H_trigger1"] = "Trigger für ICD :"
	L["H_trigger2"] = "|cffffffffBUFF|r - ICD startet wenn der Stärkungszauber aktiv ist."
	L["H_trigger3"] = "|cffffffffDEBUFF|r - ICD startet wenn der Schwächungszauber aktiv ist."
	L["H_trigger4"] = "|cffff0000/!\\ BITTE BEACHTEN, DAS ES STARTET WENN|r"
	L["H_trigger5"] = "|cffff0000TRIGGER ANZEIGEN, NICHT WENN ES VERSCHWINDET.|r"
	L["H_duration"] = "Dauer des ICD in Sekunden"
	L["H_icon1"] = "Die Ikon Konfiguration ist nur für"
	L["H_icon2"] = "|cffff0000fortgeschritten |r und"; --Benutzer |r und
	L["H_icon3"] = "Muss im LUA-Dokument geändert werden." 

	-- buttons
	L["Apply"] = "Anwenden"
	L["Cancel"] = "Abbrechen"
	L["Reset Config"] = "Zurücksetzten der Konfiguration"
	L["Move Stärkungszauber"] = "Verschieben des Stärkungszaubers"
	L["Reset Buff Position"] = "Zurücksetzten der Verstärkungszuaber-Position"
	L["Global"] = "Globale Konfiguration"
	L["Del"] = "löschen"
	L["Edit"] = "Bearbeiten"
	L["Add"] = "Hinzufügen" 

	-- update text
	local myClass = select(2, UnitClass("player"));

	L["VersionNotFound"] = "Version nicht gefunden, löschen der gesicherten Einstellungen."
	L["UpdateRequired"] = "Diese Konfiguration is veraltet, wir empfehlen dringend ein |cffff0000"..L["Reset Config"].."|r bevor |cff1784d1iFilger|r." --konfiguriert wird.
	L["WarningConfig"] = "Die Konfiguration wrude geändert.\nWir empfehlen dringend ein |cffff0000"..L["Reset Config"].."|r\nbevor |cff1784d1iFilger|r." --benutzt wird.
	L["Updated"] = "|cff1784d1iFilger|r has been updated." --wurde aktuallisiert
	L["ClassVersion"] = myClass.." version : " --Version
	L["AllVersion"] = ", ALL version : " --Alle Versionen
	L["CurrentClassVersion"] = "Aktuelle "..myClass.." Version : "
	L["CurrentAllVersion"] = ", Aktuelle ALLE Version : "
	L["AvailableClassVersion"] = "Vorhandenen "..myClass.." Versionen : "
	L["AvailableAllVersion"] = ", alle vorhandenen Version : " 
end