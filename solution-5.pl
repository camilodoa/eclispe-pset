:- lib(lists).
:- lib(fd).
:- lib(fd_search).

% Solution 5:

trusses(Trusses):-
	Weights = [W1, W2, W3, W4, W5, W6, W7, W8, W9, W10],
	Weights :: [110, 112, 113, 114, 115, 116, 117, 118, 120, 121],

	Trusses = [T1, T2, T3, T4, T5],
	Trusses :: 0..121,
	T1 + T2 #= W1, 
	T1 + T3 #= W2, 
	T1 + T4 #= W3, 
	T1 + T5 #= W4, 
	T2 + T3 #= W5, 
	T2 + T4 #= W6, 
	T2 + T5 #= W7, 
	T3 + T4 #= W8, 
	T3 + T5 #= W9, 
	T4 + T5 #= W10, 
    
	alldifferent(Weights),
	labeling(Trusses).