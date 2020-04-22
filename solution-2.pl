:- lib(lists).
:- lib(fd).
:- lib(fd_search).

% Solution 2:

wine(Wine) :-
	Barrels = [B1,B2,B3,B4,B5,Wine],
	Barrels :: [15,31,19,20,16,18],

	alldifferent(Barrels),
	
	Sold1 #= B1 + B2,
	Sold2 #= B3 + B4 + B5,
	Sold2 #= Sold1 * 2,
	labeling(Barrels).