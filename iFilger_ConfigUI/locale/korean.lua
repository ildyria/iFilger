local C, F, L = unpack(select(2, ...))

local client = GetLocale()

if client == "koKR" then
	L["iFilger"] = "|cff1784d1iFilger|r |cffffffffConfiguration|r"
	L["Config"] = "If you config your |cff1784d1iFilger|r by Lua and\nstill wish to use the configuration GUI,\ndon't forget to click on |cff1784d1Reset Config|r\neach time you modify the config.lua"

	-- option name
	L["Name"] = "이름"
	L["Enable"] = "활성화"
	L["Size"] = "크기"
	L["Direction"] = "방향"
	L["IconSide"] = "아이콘 크기"
	L["Interval"] = "간격"
	L["Mode"] = "유행"
	L["Alpha"] = "알파"
	L["BarWidth"] = "바 폭"
	L["Merge"] = "모드"

	L["cleverzone"] = "Clever Zone"
	L["tooltip"] = "도움말"
	L["TooltipMover"] = "앵커 이동을 도움말"
	L["FlashIcon"] = "아이콘 깜박임"
	L["FlashBar"] = "깜박이는 바"
	L["FlashThreshold"] = "깜박임 제한"
	L["FlashDuration"] = "Flash Duration"

	-- option help
	L["H_Name"] = "하위 섹션의 이름"
	L["H_Enable"] = "이 하위 섹션을 사용 또는 사용 안 함."
	L["H_Size1"] = "아이콘의 크기"
	L["H_Size2"] = "Must be a positive number"
	L["H_Direction1"] = "아이콘의 방향:"
	L["H_Direction2"] = "위, 아래, 왼쪽, 오른쪽 또는 수평"
	L["H_IconSide1"] = "바 모드에서 아이콘의 위치:"
	L["H_IconSide2"] = "왼쪽 또는 오른쪽"
	L["H_Interval"] = "아이콘 / 바 사이의 공간"
	L["H_Mode1"] = "모드 표시:"
	L["H_Mode2"] = "아이콘 또는 바"
	L["H_Alpha1"] = "투명도:"
	L["H_Alpha2"] = "사이에 선택 1 (전체) 또는 0 (보이지 않는)"
	L["H_BarWidth"] = "바 폭 (바 모드가 필요)"
	L["H_Merge"] = "이름이 같은 경우 병합 사용."

	L["H_cleverzone1"] = "Clever Zone:"
	L["H_cleverzone2"] = "PvE 영역에서 PVP 영역 및 PvE에서만 PVP로드"
	L["H_cleverzone3"] = "(Required to reload the first time you enter a PvE zone)"
	L["H_tooltip"] = "Tooltip on buffs"
	L["H_TooltipMover"] = "ElvUI 및 Tukui 사용자 TooltipMover에 툴팁."
	L["H_FlashIcon"] = "시간 왼쪽 아래 아이콘 모드에서 임계 값이 플래시."
	L["H_FlashBar"] = "시간 왼쪽 아래 막대 모드에서 임계 값이 플래시."
	L["H_FlashThreshold1"] = "임계 값 아이콘이 깜박 시작."
	L["H_FlashThreshold2"] = "1 보다 커야합니다."
	L["H_FlashDuration1"] = "각 플래시의 기간."
	L["H_FlashDuration2"] = "Must be a positive number, smaller => quicker."

	-- buttons
	L["Apply"] = "Apply"
	L["Reset Config"] = "구성 재설정"
	L["Move Buffs"] = "이동 Buffs"
	L["Reset Buff Position"] = "Buffs 위치 재설정"
	L["Global"] = "Global Config"
end