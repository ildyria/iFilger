local C, F, L = unpack(select(2, ...))

local client = GetLocale()

if client == "frFR" then
	L["iFilger"] = "|cff1784d1iFilger|r |cffffffffConfiguration|r"
	L["Config"] = "Si vous configurez |cff1784d1iFilger|r en modifiant les fichiers Lua \net souhaitez toujours utiliser l'outil de configuration graphique, \nn'oubliez pas de cliquer sur |cff1784d1reinitialiser la configuration|r\na chaque fois que vous effectué un changement dans config.lua"
	
	-- option name
	L["Name"] = "Nom"
	L["Enable"] = "Activer"
	L["Size"] = "Taille"
	L["Direction"] = "Direction"
	L["IconSide"] = "Coté de l'icône"
	L["Interval"] = "Intervalle"
	L["Mode"] = "Mode"
	L["Alpha"] = "Alpha"
	L["BarWidth"] = "Largeur de la barre"
	L["Merge"] = "Fusionner"

	L["cleverzone"] = "Zone intelligente"
	L["tooltip"] = "Infobulle"
	L["TooltipMover"] = "Ancre des infobulles"
	L["FlashIcon"] = "Flash (Icônes)"
	L["FlashBar"] = "Flash (Barres)"
	L["FlashThreshold"] = "Seuil de Flash"
	L["FlashDuration"] = "Rapiditée du Flash"

	-- option help
	L["H_Name"] = "Le nom du groupe."
	L["H_Enable"] = "Activer ou non le groupe."
	L["H_Size1"] = "Taille des icônes"
	L["H_Size2"] = "Doit être un nombre positif"
	L["H_Direction1"] = "Direction de l'extension :"
	L["H_Direction2"] = "UP (vers le haut), DOWN (vers le bas), LEFT (vers la gauche), RIGHT (vers la droite) ou HORIZONTAL (centré)"
	L["H_IconSide1"] = "Position de l'icône en mode Barre : "
	L["H_IconSide2"] = "LEFT (gauche) ou RIGHT (droite)"
	L["H_Interval"] = "Intervalle entre les Icônes/Barres"
	L["H_Mode1"] = "Mode d'affichage : "
	L["H_Mode2"] = "ICON (sous forme d'icônes) ou BAR (sous forme de barres)"
	L["H_Alpha1"] = "Transparence :"
	L["H_Alpha2"] = "Nombre entre 0 (invisible) et 1 (opaque)"
	L["H_BarWidth"] = "Largeur de la barre (Mode Barre requis)"
	L["H_Merge"] = "Active la fusion des groupes lorsque les noms sont identiques."

	L["H_cleverzone1"] = "Zone intelligente :"
	L["H_cleverzone2"] = "Charge le module JcJ uniquement dans les zones JcJ et le module JcE dans les zones JcE."
	L["H_cleverzone3"] = "(un /rl est requis lorsque vous entrez dans une instance)"
	L["H_tooltip"] = "Affiche une bulle d'information (tooltip) lorsque l'on passe le curseur sur une icône ou barre."
	L["H_TooltipMover"] = "Ancre des bulles d'information (tooltip) sur l'ancre définie par ElvUI ou Tukui."
	L["H_FlashIcon"] = "Flash quand le temps restant est inférieur au seuil fixé en mode ICON."
	L["H_FlashBar"] = "Flash quand le temps restant est inférieur au seuil fixé en mode BAR."
	L["H_FlashThreshold1"] = "Seuil à partir du quel le Flash commence."
	L["H_FlashThreshold2"] = "Doit être suppérieur à 1."
	L["H_FlashDuration1"] = "Durée de chaque flash."
	L["H_FlashDuration2"] = "Doit être un nombre positif, plus il est petit, plus le flash sera rapide."

	-- buttons
	L["Apply"] = "Appliquer"
	L["Reset Config"] = "Réinitialiser"
	L["Move Buffs"] = "Déplacer les icônes"
	L["Reset Buff Position"] = "Réinitialiser les positions"
	L["Global"] = "Config. Globale"
end