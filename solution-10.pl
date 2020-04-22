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
