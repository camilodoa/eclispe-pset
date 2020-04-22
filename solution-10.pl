% Camilo Ortiz

:- lib(lists).
:- lib(fd).
:- lib(fd_search).

/* Question 10 */

/*
Your task is to write a program to find a list of people who fit as many of the
following criteria as you can manage to program:
1. The guest set must have exactly N members.
2. Each guest must be a male or a female.
3. There must be a day on which each guest is available.
4. At least one interesting person is a guest.
5. At least one funny person is a guest.
6. Numbers of men and women are equal.
7. Everyone knows someone else. (knowing is probably two way, but
represented one way)
8. No one dislikes anyone else. (disliking is one way)
9. No mixing Republicans and Democrats.
*/

men([tom, fred, billy, tim, frank, barry]).
women([sue, jane, betty, ellen, joan, betsy]).

funny([tom, sue, tim, ellen]).
interesting([fred, betty, frank, betsy]).


available(tom, saturday).
available(fred, saturday).
available(sue, saturday).
available(jane, saturday).
available(tom, friday).
available(billy, friday).
available(sue, friday).
available(betty, friday).
available(tim, saturday).
available(frank, saturday).
available(ellen, saturday).
available(joan, saturday).
available(tim, friday).
available(barry, friday).
available(ellen, friday).
available(betsy, friday).

democrat(tom).
democrat(sue).
democrat(tim).
democrat(ellen).

republican(fred).
republican(jane).
republican(frank).
republican(joan).

independent(billy).
independent(betty).
independent(barry).
independent(betsy).

know(tom, fred).
know(fred, tom).
know(fred, billy).
know(billy, fred).
know(billy, betty). know(betty, billy).
know(betty, sue). know(tom, sue).
know(sue, tom). know(sue, betty).
know(sue, jane). know(jane, sue).
know(tim, frank). know(frank, tim).
know(frank, barry). know(barry, frank).
know(barry, betsy). know(betsy, barry).
know(betsy, ellen). know(tim, ellen).
know(ellen, tim). know(ellen, betsy).
know(ellen, joan). know(joan, ellen).

dislike(billy, fred).
dislike(sue, jane).
dislike(barry, frank).
dislike(ellen, joan).

question10(Invitees, N) :-
  N :: 0..12,
  Day :: friday..saturday..sunday, % Not sure if this syntax is correct
  setup(Invitees, N, Day),
  solve(Invitees),
  printI(Invitees).

setup(Invitees, N) :-
  Invitees = [X1, X2, X3, X4, X5, X6, X7, X8, X9, X10, X11, X12],
  Invitees :: 0..1, % Everyone is either invited or not

  % Restriction on how many people are invited
  X1 + X2 + X3 + X4 + X5 + X6 + X7 + X8 + X9 + X10 + X11 + X12 #= N,
  % You could also do this by having the Invitees be a dynamically sized list of
  % guests but I have no idea how to do that.

  % Every invitee must be available on a particular day

  /*More constraints here*/.

solve(Invitees) :-
  labeling(Invitees).

printI(Invitees) :-
  Invitees = [X1, X2, X3, X4, X5, X6, X7, X8, X9, X10, X11, X12],
  printf("X1 is %3d", [X1]),
  printf("X2 is %3d", [X2]),
  printf("X3 is %3d", [X3]),
  printf("X4 is %3d", [X4]),
  printf("X5 is %3d", [X5]),
  printf("X6 is %3d", [X6]),
  printf("X7 is %3d", [X7]),
  printf("X8 is %3d", [X8]),
  printf("X9 is %3d", [X9]),
  printf("X10 is %3d", [X10]),
  printf("X11 is %3d", [X11]),
  printf("X12 is %3d", [X12]).
