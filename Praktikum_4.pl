% Autor:
% Datum: 12.12.2013

%Aufgabe 1
%a)
alpha(a).
alpha(b).

vari(v_S).

start(v_S).

p([v_S], []).
p([v_S], [a,v_S,a]).
p([v_S], [b,v_S,b]).



%b)
%redrel(Alpha, Beta)
%redrel(Alpha, Beta) :- p(L, R), append(Alpha1,L,AlphaH), append(AlphaH,Alpha2,Alpha), append(Alpha1,R,BetaH), append(BetaH,Alpha2,Beta).
redrel(Alpha, Beta) :- p(L, R), append(L,Alpha2,AlphaH), append(Alpha1,AlphaH,Alpha), append(Alpha1,R,BetaH), append(BetaH,Alpha2,Beta).



%c)
sigma_stern([]).
sigma_stern([X|Ys]) :- alpha(X), sigma_stern(Ys).

%redrel_plus(Alpha, Beta) :- sigma_stern(Alpha), sigma_stern(Beta), redrel(Aplpha, Beta).
redrel_plus(Alpha, Beta) :- redrel(Aplpha, Beta).
redrel_plus(Alpha, Beta) :- redrel(Aplpha, H), redrel_plus(H,Beta).

%lvong(Ws).
lvong(Ws) :- start(Start), sigma_stern(Ws), redrel_plus([Start],Ws).



%Aufgabe 2
%a)
%(0|1) (0|1)^* (01) (0|1)^* (0|1)

%b) linkslinear
%G=(V,SigmaBin,S,P)
%V={S,A}
%P={S->S0, S->S1, S->A01, A->A0, A->A1, A->0, A->1}

%c) rechtslinear
%G=(V,SigmaBin,S,P)
%V={S,A}
%P={S->0S, S->1S, S->0M, S->1M, M->01A, A->0A, A->1A, A->0, A->1}

%d) rechtslineare Grammatik in NEA
% Zustände  0             1
%       z0  z1            z1
%       z1  {z1,z2}       z1
%       z2  z1            z3
%       z3  z4            z4
%       z4  z4            z4

%e)
% Zustände  0             1
%     {z0}  {z1}         {z1}
%     {z1}  {z1,z2}      {z1}
%  {z1,z2}  {z1,z2}      {z1,z3}
%  {z1,z3}  {z1,z2,z4}   {z1,z4}
%  *{z1,z4} {z1,z2,z4}   {z1,z4}
%*{z1,z2,z4} {z1,z2,z4}  {z1,z3,z4}
%*{z1,z3,z4} {z1,z2,z4}  {z1,z2,z4}

%f) rechtslineare Grammatik aus e)
%G=(V,SigmaBin,Z0,P)
%V={Z0,Z1,{Z1,Z2},{Z1,Z3},{Z1,Z4},{Z1,Z2,Z4},{Z1,Z3,Z4}}
%P={Z0->0Z1, Z0->1Z1, Z1->0{Z1,Z2}, Z1->1Z1, {Z1,Z2}->0{Z1,Z2}, {Z1,Z2}->1{Z1,Z3},
%   {Z1,Z3}->0{Z1,Z2,Z4}, {Z1,Z3}->1{Z1,Z4}, {Z1,Z4}->0{Z1,Z2,Z4}, {Z1,Z4}->1{Z1,Z4},
%   {Z1,Z2,Z4}->0{Z1,Z2,Z4}, {Z1,Z2,Z4}->1{Z1,Z3,Z4}, {Z1,Z3,Z4}->0{Z1,Z2,Z4}, {Z1,Z3,Z4}->1{Z1,Z2,Z4}
%   {Z1,Z4}->0, {Z1,Z4}->1, {Z1,Z2,Z4}->0, {Z1,Z2,Z4}->1, {Z1,Z3,Z4}->0, {Z1,Z3,Z4}->1}

%g)

% alpha(0).
% alpha(1).
% 
% vari(z0).
% vari(z1).
% vari(z1z2).
% vari(z1z3).
% vari(z1z4).
% vari(z1z2z4).
% vari(z1z3z4).
% 
% start(z1).
% 
% p([z0], [0,z1]).
% p([z0], [1,z1]).
% p([z1], [0,z1z2]).
% p([z1], [1,z1]).
% p([z1z2], [0,z1z2]).
% p([z1z2], [1,z1z3]).
% p([z1z3], [0,z1z2z4]).
% p([z1z3], [1,z1z4]).
% p([z1z4], [0,z1z2z4]).
% p([z1z4], [1,z1z4]).
% p([z1z2z4], [0,z1z2z4]).
% p([z1z2z4], [1,z1z3z4]).
% p([z1z3z4], [0,z1z2z4]).
% p([z1z3z4], [1,z1z2z4]).
% p([z1z4], [0]).
% p([z1z4], [1]).
% p([z1z2z4], [0]).
% p([z1z2z4], [1]).
% p([z1z3z4], [0]).
% p([z1z3z4], [1]).
% 