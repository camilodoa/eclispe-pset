:- lib(lists).
:- lib(fd).
:- lib(fd_search).


/* 
Emily Fedor

7. A farmer leaves 45 casks of wine, of which 9 each are full, three-quarters full,
half full, one quarter full and empty. His five nephews want to divide the wine and
the casks without changing wine from cask to cask in such a way that each receives
the same amount of wine and the same number of casks, and further so that each
receives at least one of each kind of cask, and no two of them receive the same
number of every kind of cask.
*/

wine(Q) :-

	Q = [V, W, X, Y, Z],

	V = [VA, VB, VC, VD, VE],		% how many they have of each
	W = [WA, WB, WC, WD, WE],
	X = [XA, XB, XC, XD, XE],
	Y = [YA, YB, YC, YD, YE],
	Z = [ZA, ZB, ZC, ZD, ZE],
	
	V :: 1..5,				% all receive at least one of each cask
	W :: 1..5,
	X :: 1..5,
	Y :: 1..5,
	Z :: 1..5,
	
	VA + WA + XA + YA + ZA #= 9, 		% there are nine of each kind of cask
	VB + WB + XB + YB + ZB #= 9,
	VC + WC + XC + YC + ZC #= 9,
	VD + WD + XD + YD + ZD #= 9,
	VE + WE + XE + YE + ZE #= 9,
	
	VA + VB + VC + VD + VE #= 9,		% all receive the same number of casks
	WA + WB + WC + WD + WE #= 9,
	XA + XB + XC + XD + XE #= 9,
	YA + YB + YC + YD + YE #= 9,
	ZA + ZB + ZC + ZD + ZE #= 9,
	
	F = [4, 3, 2, 1, 0],			% fullness
	F*V #= F*W,				% all receive the same amount of wine
	F*W #= F*X,
	F*X #= F*Y,
	F*Y #= F*Z,
	F*Z #= F*V,
	
	labeling(V),				% do the thing
	labeling(W),
	labeling(X),
	labeling(Y),
	labeling(Z),
	
	alldifferent(Q).			% no two receive the same number of every kind of cask

	
solveWine(Q) :-
	Q = [V, W, X, Y, Z],
	wine(Q),
	print(Q).
