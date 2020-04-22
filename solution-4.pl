:- lib(lists).
:- lib(fd).
:- lib(fd_search).


/*
# 4. A woman was carrying a basket of eggs to market when a passer-by bumped her. She dropped the basket and all the eggs broke. The passer-by, wishing to pay for her loss, asked, 'How many eggs were in your basket?' 'I don't remember exactly,' the woman replied, 'but I do recall that whether I divided the eggs by 2,3,4,5 or 6 there was always one egg left over. When I took the eggs out in groups of seven, I emptied the basket.' Write an eclipse constraint program to find the least possible number of eggs.
*/


eggs(E) :-
	
	E #> 0,						% there are positive eggs
				
	E #= 2*_ + 1,				% remainder 1 when modded by 2-6
	E #= 3*_ + 1,
	E #= 4*_ + 1,
	E #= 5*_ + 1,
	E #= 6*_ + 1,
	
	E #= 7*_.					% divisible by 7
	
	
solveEggs(E) :-
	minimize(eggs(E), E),		% find the smallest possible E
	print(E).