A = [1 0;0 -2];
B = [1;1];
C = [1 1];
D = [0];

eig(A);

M = ctrb(A,B);
rank(M)

N = obsv(A,C);
rank(N)

polos_desejados = [-2, -1];
K = place(A,B,polos_desejados)

polosL = [-20 -10];
L = place(A',C',polosL)

