% Camilo Ortiz

:- lib(lists).
:- lib(fd).
:- lib(fd_search).

/* Question 3 */

/*
Prompt:
The nine digits 1-9 are used to form one three-digit and three two-digit
numbers so that the product of the three digit number and the first two-digit
number is the same as the product of the second and third two-digit
numbers. E.g. 158 multiplied by 23 is 3,634, and 79 multiplied by 46 is also
3,634. Write an eclipse program to find all such arrangements of digits, and
one that will find the arrangement with the largest product. (Hint:
maximizing X is the same as minimizing -X)
*/

/*
Found solution:

*/

question3_1(Numbers, N) :-
  % First solution (all of them)
  % N is the product that we are maximizing
  N :: 0..10000,
  setup(Numbers, N),
  solve1(Numbers, N),
  printN1(Numbers, N).

setup(Numbers, N) :-
  % Our constraints
  Numbers = [X, Y1, Y2, Y3],
  % X is a 3 digit number
  X :: 100 .. 999,
  % Y1 .. Y3 are 2 digit numbers
  Y1 :: 10 .. 99,
  Y2 :: 10 .. 99,
  Y3 :: 10 .. 99,
  X * Y1 #= N,
  Y2 * Y3 #= N.

solve1(Numbers, N) :-
  % Our solving function
  % Returns all solutions (by pressing more).
  labeling(Numbers).

printN1(Numbers, N) :-
  Numbers = [X, Y1, Y2, Y3],
  printf("First number is %3d\n", [X]),
  printf("Second number is %3d\n", [Y1]),
  printf("Third number is %3d\n", [Y2]),
  printf("Fourth number is %3d\n", [Y3]),
  printf("Product is %3d\n\n", [N]).


question3_2(Numbers, N) :-
  % Second solution (just the largest N)
  % N is the product that we are maximizing
  N :: 0..10000,
  setup(Numbers, N),
  N1 :: -10000..0,
  N1 #= -N,
  solve2(Numbers, N1),
  printN2(Numbers, N).

solve2(Numbers, N1) :-
  % Our solving function
  % Supposed to return the values for the largest value of N.
  % THERE IS AN ERROR HERE, IT SHOULD BE -N BUT IDK HOW TO GET THAT TO WORK
  minimize(labeling(Numbers), N1).

printN2(Numbers, N) :-
  Numbers = [X, Y1, Y2, Y3],
  printf("First number is %3d\n", [X]),
  printf("Second number is %3d\n", [Y1]),
  printf("Third number is %3d\n", [Y2]),
  printf("Fourth number is %3d\n", [Y3]),
  printf("Max product is %3d\n", [N]).
