% Camilo Ortiz

:- lib(lists).
:- lib(fd).
:- lib(fd_search).

/* Question 6 */

/* Prompt:
(from New Scientist magazine, 17 June 2006.) by W. Haigh.
I have allocated distinct positive integers to the letters of the alphabet. By
adding up the values of the letters in their names, I have obtained the
following scores for some members of the solar system: PLUTO 40,
URANUS 36, NEPTUNE 29, SATURN 33, JUPITER 50, MARS 32,
EARTH 31, MOON 36, VENUS 39, MERCURY 33, SUN 18.
Find the value of PLANETS. (You will find multiple solutions. Modify the
problem and your solution to leave just one.)*/

question6(Letters) :-
  setup(Letters),
  solve(Letters),
  printL(Letters).

setup(Letters) :-
  Letters = [A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z],
  P + L + U + T + O #= 40,
  U + R + A + N + U + S #= 36,
  N + E + P + T + U + N + E #= 29,
  S + A + T + U + R + N #= 33,
  J + U + P + I + T + E + R #= 50,
  M + A + R + S #= 32,
  E + A + R + T + H #= 31,
  M + O + O + N #= 36,
  V + E + N + U + S #= 39,
  M + E + R + C + U + R + Y #= 33,
  S + U + N #= 18.

solve(Letters) :-
  labeling(Letters).

printL(Letters) :-
  Letters = [A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z],
  PLUTO is P + L + U + T + O,
  printf("PLUTO is %3d\n", [PLUTO])
