% Realimentação integral com observador de Luenberger

clear;
clc;

A = [1 0;0 -2];
B = [1;1];
C = [1 1];
D = [0];
planta = ss(A,B,C,D);

Ai = [A zeros(2,1);-C 0];
Bi = [B;0];
Ci = [C 0];
Di = D;

plantaAM = ss(Ai,Bi,Ci,Di);

M = ctrb(Ai,Bi);
rank(M)

N = obsv(A,C);
rank(N)

eig(plantaAM)

polosMF = [-10 -10 -10];

Ki = acker(Ai,Bi,polosMF);
K = Ki(1:2);
Ke = -Ki(3);

autovOBSV = [-50 -50];

L = acker(A',C',autovOBSV)';

% Sistema em malha fechada com realimentação integral

% [x_dot] = (Ai-Bi*Ki)[x_] + [zeros]r
% [  e  ]             [e ] + [  1  ]
%    y    =     Ci[x_]
%                 [e ]

Amf = Ai-Bi*Ki;
Bmf = [zeros(2,1); 1];
Cmf = Ci;
Dmf = Di;

sysmf = ss(Amf,Bmf,Cmf,Dmf);

%rltool(sysmf) % verificar melhor localização dos polos 








