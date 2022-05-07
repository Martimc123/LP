max_div(N, 0, N) :- !.
max_div(A, B, C) :- A > B,
                    B > 0,!,
                    R is A mod B,
                    max_div(B, R, C).

max_div(A, B, C) :- B > A,!,
                    max_div(B, A, C).
