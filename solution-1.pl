:- lib(lists).
:- lib(fd).
:- lib(fd_search).


/* 
Emily Fedor

1. "Mrs. Spooner called this morning," said the honest grocer to his
assistant. "She wants twenty pounds of tea at 2s. 4½d. per lb. Of
course we have a good 2s. 6d. tea, a slightly inferior at 2s. 3d.,
and a cheap Indian at 1s. 9d., but she is very particular always about
her prices." "What do you propose to do?" asked the innocent assistant.
"Do?" exclaimed the grocer. "Why, just mix up the three teas in
different proportions so that the twenty pounds will work out fairly
at the lady's price. Only don't put in more of the best tea than you
can help, as we make less profit on that, and of course you will use
only our complete pound packets. Don't do any weighing." How was the
poor fellow to mix the three teas? Could eclipse have shown him how
to do it? (Hint: 1s = 12d one shilling is 12 pence. You want to
rescale to avoid fractions.)
*/


/*
she wants:		2s 4.5d = 2(12) + 4.5 	= 28.5
good tea: 		2s 6d 	= 2(12) + 6 	= 30
medium tea: 		2s 3d 	= 2(12) + 3 	= 27
cheap tea: 		1s 9d 	= 12 + 9 	= 21
*/

tea(T) :-

	T = [A, B, C],				% pounds of the best (A), second best (B), and cheapest (C) tea
	
	T :: 0..20,				% constrain weights
	
	A + B + C #= 20,			% must sell her 20 lbs
	
	A*300 + B*270 + C*210 #= 20*285,	% must add up to the right price
	
	labeling(T).				% do the thing.
	
	
solveTea(T) :-
	
	T = [A, B, C],
	minimize(tea(T), A),			% use as little good tea as possible
	print(T).
