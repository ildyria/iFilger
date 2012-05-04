local C, F, L = unpack(select(2, ...))

local client = GetLocale()

-- option name
L["Name"] = "Name"
L["Enable"] = "Enable"
L["Size"] = "Size"
L["Direction"] = "Direction"
L["IconSide"] = "IconSide"
L["Interval"] = "Interval"
L["Mode"] = "Mode"
L["Alpha"] = "Alpha"
L["BarWidth"] = "Bar Width"
L["Merge"] = "Merge"

L["cleverzone"] = "Clever Zone"
L["tooltip"] = "Tooltip"
L["TooltipMover"] = "Tooltip Mover"
L["FlashIcon"] = "Flash (Icons)"
L["FlashBar"] = "Flash (Bars)"
L["FlashThreshold"] = "Flash Threshold"
L["FlashDuration"] = "Flash Duration"

-- option help
L["H_Name"] = "The name of the sub-section, what else ?"
L["H_Enable"] = "Enable or not the sub-section."
L["H_Size1"] = "Size of the Icons"
L["H_Size2"] = "Must be a positive number"
L["H_Direction1"] = "Direction of expending :"
L["H_Direction2"] = "UP, DOWN, LEFT, RIGHT or HORIZONTAL"
L["H_IconSide1"] = "Position of the Icon in bar config mode :"
L["H_IconSide2"] = "LEFT or RIGHT"
L["H_Interval"] = "Interval between Icons/Bars"
L["H_Mode1"] = "Display mode : "
L["H_Mode2"] = "ICON or BAR"
L["H_Alpha1"] = "Transparency :"
L["H_Alpha2"] = "Float between 0 (invisible) and 1 (mat)"
L["H_BarWidth"] = "Width of the Bar (Bar Mode required)"
L["H_Merge"] = "Enable Merging when Name is the same."

L["H_cleverzone1"] = "Clever Zone :"
L["H_cleverzone2"] = "Load only PVP in PVP zones and PVE in PVE zones"
L["H_cleverzone3"] = "(require to reload the 1st time you enter the pve zone)"
L["H_tooltip"] = "Tooltip on mouseover buffs"
L["H_TooltipMover"] = "Tooltip on TooltipMover for ElvUI and Tukui users."
L["H_FlashIcon"] = "Flash when time left is below the threshold in ICON mode."
L["H_FlashBar"] = "Flash when time left is below a threshold in BAR mode."
L["H_FlashThreshold1"] = "Threshold from which icons start flashing."
L["H_FlashThreshold2"] = "Must be greater than 1."
L["H_FlashDuration1"] = "Duration of each flash."
L["H_FlashDuration2"] = "Must be a positive number, smaller => quicker."

-- buttons
L["Apply"] = "Apply"
L["Reset Config"] = "Reset Config"
L["Move Buffs"] = "Move Buffs"
L["Reset Buff Position"] = "Reset Buff Position"


if client == "frFR" then -- French

	-- option name
	L["Name"] = "Nom"
	L["Enable"] = "Activer"
	L["Size"] = "Taille"
	L["Direction"] = "Direction"
	L["IconSide"] = "Coté de l'icone"
	L["Interval"] = "Intervalle"
	L["Mode"] = "Mode"
	L["Alpha"] = "Alpha"
	L["BarWidth"] = "Largeur de la barre"
	L["Merge"] = "Fusionner"

	L["cleverzone"] = "Zone intelligente"
	L["tooltip"] = "Tooltip"
	L["TooltipMover"] = "Ancre Tooltip"
	L["FlashIcon"] = "Flash (Icons)"
	L["FlashBar"] = "Flash (Barres)"
	L["FlashThreshold"] = "Seuil de Flash"
	L["FlashDuration"] = "Rapidité du Flash"

	-- option help
	L["H_Name"] = "Le nom du groupe."
	L["H_Enable"] = "Activer ou non le groupe."
	L["H_Size1"] = "Taille des icones"
	L["H_Size2"] = "Doit être un nombre positif"
	L["H_Direction1"] = "Direction de l'extension :"
	L["H_Direction2"] = "UP (vers le haut), DOWN (vers le bas), LEFT (vers la gauche), RIGHT (vers la droite) ou HORIZONTAL (centré)"
	L["H_IconSide1"] = "Position de l'icone en mode Barre : "
	L["H_IconSide2"] = "LEFT (gauche) ou RIGHT (droite)"
	L["H_Interval"] = "Intervalle entre les Icones/Barres"
	L["H_Mode1"] = "Mode d'affichage : "
	L["H_Mode2"] = "ICON (en icones) ou BAR (en barres)"
	L["H_Alpha1"] = "Transparence :"
	L["H_Alpha2"] = "Nombre entre 0 (invisible) et 1 (opaque)"
	L["H_BarWidth"] = "Largeur de la barre (Mode Barre requis)"
	L["H_Merge"] = "Active la fusion des groupes quand les noms sont les mêmes."

	L["H_cleverzone1"] = "Zone intelligente :"
	L["H_cleverzone2"] = "Charge le PVP seulement dans les zones PVP et le PVE dans les zones PVE."
	L["H_cleverzone3"] = "(un /rl est nécessaire quand vous entrez dans une instance)"
	L["H_tooltip"] = "Affiche un Tooltip lorsqu'on passe la souris sur les buffs."
	L["H_TooltipMover"] = "Ancre du Tooltip sur l'ancre définie par ElvUI ou Tukui."
	L["H_FlashIcon"] = "Flash quand le temps restant est inférieur au seuil fixé en mode ICON."
	L["H_FlashBar"] = "Flash quand le temps restant est inférieur au seuil fixé en mode BAR."
	L["H_FlashThreshold1"] = "Seuil à partir du quel le Flash commence."
	L["H_FlashThreshold2"] = "Doit être suppérieur à 1."
	L["H_FlashDuration1"] = "Durée de chaque flash."
	L["H_FlashDuration2"] = "Doit être un nombre positif, plus il est petit, plus le flash sera rapide."

	-- buttons
	L["Apply"] = "Appliquer"
	L["Reset Config"] = "Réinitialiser"
	L["Move Buffs"] = "Déplacer les icones"
	L["Reset Buff Position"] = "Réinitialiser les positions"

elseif client == "deDE" then -- German
	-- Translation is required, is some one can do it, that would be nice. Thx in advance !
end