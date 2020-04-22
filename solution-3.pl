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

question3(Numbers, N) :-
  % N is the product that we are maximizing
  N :: 0..10000,
  setup(Numbers, N),
  solve(Numbers, N),
  printN(Numbers, N).

question3_2(Numbers, N) :-
  % N is the product that we are maximizing
  N :: 0..10000,
  setup(Numbers, N),
  solve2(Numbers, N),
  printN(Numbers, N).

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

solve(Numbers, N) :-
  % Our solving function
  % THERE IS AN ERROR HERE, IT SHOULD BE -N BUT IDK HOW TO GET THAT TO WORK
  minimize(labeling(Numbers), N).

solve2(Numbers, N) :-
  % Our solving function
  % THERE IS AN ERROR HERE, IT SHOULD BE -N BUT IDK HOW TO GET THAT TO WORK
  minimize(labeling(Numbers), (N * -1)).

printN(Numbers, N) :-
  Numbers = [X, Y1, Y2, Y3],
  printf("First number is %3d\n", [X]),
  printf("Second number is %3d\n", [Y1]),
  printf("Third number is %3d\n", [Y2]),
  printf("Fourth number is %3d\n", [Y3]),
  printf("Max product is %3d\n", [N]).
