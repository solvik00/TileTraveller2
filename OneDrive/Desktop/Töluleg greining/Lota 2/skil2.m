%% 1
clear all; close all; clc;

L=1
d=0.2
f = 0.02
ro = 998
QA = 2*10^-5
QB = 4*10^-5
c = (pi^2*d^5)/(8*f*ro*L)
P0 = 0.5

q = [0.1, 0.1, 0.1, 0.1, 0.1, 0.1]'
% q1 = 0.1
% q2 = 0.1
% q3 = 0.1
% q4 = 0.1
% q5 = 0.1
% q6 = 0.1

f1 = @(q1,q2,q3)  q1 - q2 - q3
f2 = @(q2,q4) -q4 - QA + q2
f3 = @(q3,q5) -q5 - QB + q3
f4 = @(q4,q5,q6) q4 + q5 -q6
f5 = @(q1,q2,q4,q6,P0) 2*q1^2 + q2^2 + q4^2 + 2*q6^2 - c*P0
f6 = @(q2,q4,q5,q3) q2^2 + q4^2 - q5^2 -q3^2

F = @(q) [f1(q(1),q(2),q(3)) f2(q(2),q(4)) f3(q(3),q(5)) f4(q(4),q(5),q(6)) f5(q(1),q(2),q(4),q(6),P0) f6(q(2),q(4),q(5),q(3))]'

%syms q q1 q2 q3 q4 q5 q6
%eqn = F(q) == [0 0 0 0 0 0]'

%solve(eqn)

%% 2

J =@(q) [1 -1 -1 0 0 0; 0 1 0 -1 0 0; 0 0 1 0 -1 0; 0 0 0 1 1 -1;4*q(1) 2*q(2) 0 2*q(4) 0 4*q(6); 0 2*q(2) -2*q(3) 2*q(4) -2*q(5) 0]

%DF = @(q1,q2,q3,q4,q5,q6) diff(F(q1,q2,q3,q4,q5,q6))
%Df(q1,q2,q3,q4,q5,q6)

%% 3
format long
q = [0.1, 0.1, 0.1, 0.1, 0.1, 0.1]
k = 6
tol = 0.5*10^-k
% reikna fram og aftur skekkju

[x,oldx] = newtonmult(q,tol,F,J)

% framvirk skekkja
skekkja_framvirk = norm(F(x))

% afturvirk skekkja
skekkja_afturvirk = norm(x-oldx)

% hlutfalsleg skekkja
skekkja_hlutfallsleg = norm((x-oldx)/oldx)
skekkja_hlutfallsleg = norm(x-oldx)/norm(oldx)
%% 4
F = @(q,P0) [f1(q(1),q(2),q(3)) f2(q(2),q(4)) f3(q(3),q(5)) f4(q(4),q(5),q(6)) f5(q(1),q(2),q(4),q(6),P0) f6(q(2),q(4),q(5),q(3))]'

q_1 = []
q_2 = []
q_3 = []
q_4 = []
q_5 = []
q_6 = []

P0 = linspace(0.5,2,100);
for i = 1:100;
    P = P0(i);
    q_new = newtonmultD4(q,P,tol,F,J)
    q_new = q_new'
    q_1(i) = q_new(1)
    q_2(i) = q_new(2)
    q_3(i) = q_new(3)
    q_4(i) = q_new(4)
    q_5(i) = q_new(5)
    q_6(i) = q_new(6)
    
    q = q_new
    
end
    
%%
plot(P0,q_1)
hold on
plot(P0,q_2)
plot(P0,q_3)
plot(P0,q_4)
plot(P0,q_5)
plot(P0,q_6)
legend('1','2','3','4','5','6')

%% 5
F = @(q) [f1(q(1),q(2),q(3)) f2(q(2),q(4)) f3(q(3),q(5)) f4(q(4),q(5),q(6)) f5(q(1),q(2),q(4),q(6),P0) f6(q(2),q(4),q(5),q(3))]'
Df = diff(F(q))
index = find(q_1 >=2.5*10^-3)
a = P0(index(1)-1)
b = P0(index(1))
x0 = q(1) % upphafsgildi

P0_final = bisectD5(F,Df,x0,a,b,tol)
