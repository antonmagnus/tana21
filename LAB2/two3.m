A = [4 -2 1; 3 2 -6; 1 -1 1];
B = [2 0 4 3; -2 0 2 -13; 1 15 2 -4.5; -4 5 -7 -10]
[L, U, P] = lufact(B)
[L_ex, U_ex, P_ex] = lu(B)