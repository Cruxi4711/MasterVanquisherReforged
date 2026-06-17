#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Local $aLornarsPassOutpostPath[2][2] = [ _
	[6647, -41652], _
	[5831, -41296] _
]

Local $aLornarsPassTransitPath[38][2] = [ _
	[4361, -40986], _
	[2911, -39264], _
	[2133, -33852], _
	[-1060, -33346], _
	[-4758, -28947], _
	[-6471, -25171], _
	[-6082, -22640], _
	[-904, -21784], _
	[1054, -19774], _
	[1709, -15734], _
	[777, -12391], _
	[-1244, -9061], _
	[3023, -995], _
	[3610, 211], _
	[1680, 291], _
	[2015, 1742], _
	[-305, 3030], _
	[3103, 7774], _
	[1909, 14297], _
	[-816, 17801], _
	[-3619, 17256], _
	[-5371, 19670], _
	[-1984, 23796], _
	[-1945, 26833], _
	[508, 25354], _
	[1870, 22590], _
	[4868, 23524], _
	[3856, 27378], _
	[2065, 30960], _
	[2026, 32945], _
	[4634, 33957], _
	[6230, 35670], _
	[3038, 39018], _
	[-310, 37850], _
	[-2023, 40926], _
	[-5916, 41977], _
	[-7311, 44525], _
	[-7091, 45561] _
]

Local $aLornarsPassTransit2Path[11][2] = [ _
	[-6657, -6239], _
	[-5031, -5928], _
	[-3275, -7065], _
	[-1100, -6274], _
	[-1891, -1676], _
	[-606, 2946], _
	[-754, 5666], _
	[-2386, 7708], _
	[-4783, 7055], _
	[-5363, 7789], _
	[-5705, 8493] _
]

Func GoOutLornarsPass()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $LornarsPass_Map Then Return

	If $l_i_Map = $LornarsPass_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> LornarsPass (portal 1)")
		_Vanquisher_RunAggroPortalPath($aLornarsPassOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $LornarsPass_Transit Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Transit -> LornarsPass (portal 2)")
		_Vanquisher_RunAggroPortalPath($aLornarsPassTransitPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $LornarsPass_Transit2 Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Transit -> LornarsPass (portal 3)")
		_Vanquisher_RunAggroPortalPath($aLornarsPassTransit2Path, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQLornarsPass()
	If GetMapID() <> $LornarsPass_Map And GetMapID() <> $LornarsPass_Outpost And GetMapID() <> $LornarsPass_Transit And GetMapID() <> $LornarsPass_Transit2 Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for LornarsPass.")
		TravelTo($LornarsPass_Outpost)
	EndIf

	If GetMapID() = $LornarsPass_Outpost Or GetMapID() = $LornarsPass_Transit Or GetMapID() = $LornarsPass_Transit2 Then
		_Vanquisher_ApplyDifficulty()
		GoOutLornarsPass()
		If GetMapID() <> $LornarsPass_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need LornarsPass (" & $LornarsPass_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $LornarsPass_Map Then
		CurrentAction("LornarsPass route waiting - on map " & GetMapID() & ", need " & $LornarsPass_Map & ".")
		Return
	EndIf

	CurrentAction("Starting LornarsPass vanquish route.")

	Local $aWaypoints[138][4] = [ _
		[-9753, -33232], " ", $vqrange], _
		[-8804, -32701], " ", $vqrange], _
		[-5501, -31637], " ", $vqrange], _
		[-5097, -31180], " ", $vqrange], _
		[-4880, -30931], " ", $vqrange], _
		[-4876, -30673], " ", $vqrange], _
		[-4494, -30200], " ", $vqrange], _
		[-3914, -29688], " ", $vqrange], _
		[-3110, -29977], " ", $vqrange], _
		[-2354, -29933], " ", $vqrange], _
		[-2118, -29256], " ", $vqrange], _
		[-2690, -28385], " ", $vqrange], _
		[-2718, -28260], " ", $vqrange], _
		[-3149, -28110], " ", $vqrange], _
		[-5470, -28240], " ", $vqrange], _
		[-7024, -28062], " ", $vqrange], _
		[-7329, -28006], " ", $vqrange], _
		[-7375, -27825], " ", $vqrange], _
		[-3760, -27244], " ", $vqrange], _
		[-2649, -26625], " ", $vqrange], _
		[-1746, -25106], " ", $vqrange], _
		[-461, -23887], " ", $vqrange], _
		[-168, -23715], " ", $vqrange], _
		[1430, -23009], " ", $vqrange], _
		[2007, -23150], " ", $vqrange], _
		[1496, -22220], " ", $vqrange], _
		[2092, -21736], " ", $vqrange], _
		[3725, -20528], " ", $vqrange], _
		[4358, -20348], " ", $vqrange], _
		[6986, -19801], " ", $vqrange], _
		[7425, -18572], " ", $vqrange], _
		[7870, -17627], " ", $vqrange], _
		[9562, -15404], " ", $vqrange], _
		[9559, -14005], " ", $vqrange], _
		[8229, -11503], " ", $vqrange], _
		[8256, -10306], " ", $vqrange], _
		[7944, -5845], " ", $vqrange], _
		[9485, -2495], " ", $vqrange], _
		[9118, -1435], " ", $vqrange], _
		[9545, 1156], " ", $vqrange], _
		[9507, 4023], " ", $vqrange], _
		[8115, 5297], " ", $vqrange], _
		[3353, 4637], " ", $vqrange], _
		[2456, -634], " ", $vqrange], _
		[1838, -140], " ", $vqrange], _
		[2316, -1082], " ", $vqrange], _
		[3172, -5457], " ", $vqrange], _
		[2792, -6967], " ", $vqrange], _
		[-864, -7897], " ", $vqrange], _
		[-2310, -7701], " ", $vqrange], _
		[-4762, -7597], " ", $vqrange], _
		[-7094, -7614], " ", $vqrange], _
		[-8744, -10262], " ", $vqrange], _
		[-7554, -12446], " ", $vqrange], _
		[-3493, -16575], " ", $vqrange], _
		[-2494, -16843], " ", $vqrange], _
		[-1989, -16694], " ", $vqrange], _
		[-1818, -16604], " ", $vqrange], _
		[-693, -15952], " ", $vqrange], _
		[1598, -17995], " ", $vqrange], _
		[3529, -18245], " ", $vqrange], _
		[5840, -17977], " ", $vqrange], _
		[9384, -14793], " ", $vqrange], _
		[8394, -11526], " ", $vqrange], _
		[8527, -10266], " ", $vqrange], _
		[8960, -9835], " ", $vqrange], _
		[9016, -7192], " ", $vqrange], _
		[9006, -5026], " ", $vqrange], _
		[9422, 1081], " ", $vqrange], _
		[9647, 2250], " ", $vqrange], _
		[8388, 4426], " ", $vqrange], _
		[2908, 1152], " ", $vqrange], _
		[-115, 786], " ", $vqrange], _
		[-2452, 709], " ", $vqrange], _
		[-2517, 711], " ", $vqrange], _
		[-3128, 767], " ", $vqrange], _
		[-5284, 1991], " ", $vqrange], _
		[-4886, 5301], " ", $vqrange], _
		[-6018, 6262], " ", $vqrange], _
		[-5625, 13454], " ", $vqrange], _
		[-5311, 14355], " ", $vqrange], _
		[-5345, 17710], " ", $vqrange], _
		[-5066, 18580], " ", $vqrange], _
		[-3600, 20985], " ", $vqrange], _
		[-5607, 22341], " ", $vqrange], _
		[-4600, 22913], " ", $vqrange], _
		[-3980, 23765], " ", $vqrange], _
		[-4761, 24366], " ", $vqrange], _
		[-2199, 24911], " ", $vqrange], _
		[223, 26327], " ", $vqrange], _
		[2509, 26426], " ", $vqrange], _
		[4621, 28321], " ", $vqrange], _
		[5453, 30474], " ", $vqrange], _
		[3987, 32287], " ", $vqrange], _
		[4116, 33119], " ", $vqrange], _
		[4666, 34042], " ", $vqrange], _
		[5577, 34562], " ", $vqrange], _
		[7269, 33969], " ", $vqrange], _
		[8400, 33040], " ", $vqrange], _
		[9275, 31848], " ", $vqrange], _
		[7354, 33848], " ", $vqrange], _
		[4762, 34220], " ", $vqrange], _
		[3094, 33914], " ", $vqrange], _
		[2252, 34322], " ", $vqrange], _
		[2061, 34333], " ", $vqrange], _
		[1664, 34088], " ", $vqrange], _
		[242, 32819], " ", $vqrange], _
		[-708, 31896], " ", $vqrange], _
		[-1077, 33310], " ", $vqrange], _
		[-1393, 33532], " ", $vqrange], _
		[-1746, 33782], " ", $vqrange], _
		[-1217, 31897], " ", $vqrange], _
		[-2677, 31568], " ", $vqrange], _
		[-3992, 31099], " ", $vqrange], _
		[-2470, 31160], " ", $vqrange], _
		[-1868, 29500], " ", $vqrange], _
		[-1789, 28126], " ", $vqrange], _
		[-3476, 25356], " ", $vqrange], _
		[-6957, 25425], " ", $vqrange], _
		[-7485, 25536], " ", $vqrange], _
		[-9573, 26376], " ", $vqrange], _
		[-10254, 28166], " ", $vqrange], _
		[-10349, 28955], " ", $vqrange], _
		[-10196, 28272], " ", $vqrange], _
		[-3560, 34847], " ", $vqrange], _
		[1602, 32579], " ", $vqrange], _
		[4108, 27725], " ", $vqrange], _
		[1938, 26219], " ", $vqrange], _
		[-2655, 24187], " ", $vqrange], _
		[-5502, 16207], " ", $vqrange], _
		[-5497, 15443], " ", $vqrange], _
		[-6641, 13259], " ", $vqrange], _
		[-9412, 7825], " ", $vqrange], _
		[-5207, 6931], " ", $vqrange], _
		[-7261, 2251], " ", $vqrange], _
		[-8621, 855], " ", $vqrange], _
		[-9227, 15], " ", $vqrange], _
		[-9227, 15], " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

