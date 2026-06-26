#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func VQTahnnakiTemple()
    If GetMapID() <> $TahnnakiTemple_Map And GetMapID() <> $TahnnakiTemple_Outpost  Then TravelTo($TahnnakiTemple_Outpost)   
    If GetMapID() = $TahnnakiTemple_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $TahnnakiTemple_Map Then
   
		Local $aWaypoints[43][4] = [ [2884.86, -12387.98, " ", $vqrange] _
		, [227.31, -7360.89, " ", $vqrange] _
		, [2259.09, -3369.35, " ", $vqrange] _
		, [3171.27, 2108.69, " ", $vqrange] _
		, [5448.64, 6261.96, " ", $vqrange] _
		, [7727.54, 7918.97, " ", $vqrange] _
		, [6018.50, 12309.87, " ", $vqrange] _
		, [2701.72, 15909.80, " ", $vqrange] _
		, [35.89, 15392.52, " ", $vqrange] _
		, [3262.73, 17048.24, " ", $vqrange] _
		, [-496.69, 18513.76, " ", $vqrange] _
		, [-5882.72, 18474.70, " ", $vqrange] _
		, [-3350.72, 19307.39, " ", $vqrange] _
		, [-4000.28, 20523.49, " ", $vqrange] _
		, [-6150.13, 15909.22, " ", $vqrange] _
		, [-3010.30, 14238.12, " ", $vqrange] _
		, [-2055.81, 9994.25, " ", $vqrange] _
		, [-1183.52, 6956.74, " ", $vqrange] _
		, [-795.18, 2365.00, " ", $vqrange] _
		, [-1684.97, 491.57, " ", $vqrange] _
		, [-3603.41, 1782.88, " ", $vqrange] _
		, [-1182.65, 2540.33, " ", $vqrange] _
		, [-1301.95, 7008.48, " ", $vqrange] _
		, [-4043.49, 11365.57, " ", $vqrange] _
		, [-5954.37, 16051.86, " ", $vqrange] _
		, [-4059.57, 20010.92, " ", $vqrange] _
		, [-3350.72, 19307.39, " ", $vqrange] _
		, [-5730.48, 18567.43, " ", $vqrange] _
		, [-45.43, 17957.73, " ", $vqrange] _
		, [-454.99, 12625.01, " ", $vqrange] _
		, [994.91, 11490.00, " ", $vqrange] _
		, [2622.04, 11361.75, " ", $vqrange] _
		, [2563.03, 10063.27, " ", $vqrange] _
		, [528.62, 6662.03, " ", $vqrange] _
		, [4637.26, 6492.83, " ", $vqrange] _
		, [644.60, 6116.35, " ", $vqrange] _
		, [-4203.87, 6541.97, " ", $vqrange] _
		, [-6157.41, 9375.21, " ", $vqrange] _
		, [-7327.60, 10265.17, " ", $vqrange] _
		, [-8954.89, 10217.43, " ", $vqrange] _
		, [-7033.71, 6410.47, " ", $vqrange] _
		, [-7398.63, 1914.15, " ", $vqrange] _
		, [-10296.21, -2138.44, " ", $vqrange] ]

		MoveandAggroVQ($aWaypoints)
      		MoveAndAggroVQReverse($aWaypoints)
		
    EndIf
EndFunc