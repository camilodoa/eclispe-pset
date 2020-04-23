% Camilo Ortiz

:- lib(lists).
:- lib(fd).
:- lib(fd_search).
:- use_module(library(apply)).

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

question10(Invitees) :-
  setup(Invitees),
  solve(Invitees),
  printI(Invitees).

setup(Invitees) :-
  % Number of people to invite
  N :: 1..12,
  % Restrict number of people invited to N
  length(Invitees, N),
  % Invitees are the people we know
  Invitees :: [tom, fred, billy, tim, frank, barry, sue, jane, betty, ellen, joan, betsy],
  % Can't invite the same person more than twice
  alldifferent(Invitees),

  % Everyone must be available on the same day
  Day :: [friday, saturday, sunday],
  (foreach(Person, Invitees) do available(Person, Day)),

  % There has to be an interesting person
  interesting(InterestingPersons),
  member(InterestingInvitee, Invitees),
  member(InterestingInvitee, InterestingPersons),

  % There has to be at least one funny person
  funny(FunnyPersons),
  member(FunnyInvitee, Invitees),
  member(FunnyInvitee, FunnyPersons),

  % Make a list of all the men
  include(men(X), Invitees, Men),
  % Make a list of all the women
  include(women(Y), Invitees, Women),
  % Number of women and men is the same
  length(Men, NumMen),
  length(Women, NumWomen),
  NumMen #= NumWomen,

  % Everyone knows someone else
  (foreach(LonelyPerson, Invitees) do member(AnotherLonelyPerson, Invitees), know(LonelyPerson, AnotherLonelyPerson)),

  % No one dislikes anyone else
  (foreach(HatefulPerson, Invitees) do (foreach(OtherHatefulPerson, Invitees) do not(dislike(HatefulPerson, OtherHatefulPerson)))),

  % No mixing republicans and democrats
  PoliticalLeaning :: [democrat, republican, independent],
  (foreach(PoliticalPerson, Invitees) do call(PoliticalLeaning, PoliticalPerson)).

solve(Invitees) :-
  labeling(Invitees).

printI(Invitees) :-
  foreach(member(Invitee, Invitees), printf("%3d is invited", [Invitee])).
