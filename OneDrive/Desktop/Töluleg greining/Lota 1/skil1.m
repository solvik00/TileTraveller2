% Lota 1 skil 1:
L = 30; % mm
lambda  = 0.8; % g/mm
El = 1.09*(10^10) % Pa*mm^2

%% 1:
figure('Name', '1:')
fplot(@(x) cos(x)*cosh(x)+1)
grid on
hold on

%% 2 & 3:
tol = 0.5*10^-4;
a = 1;
b = 3;
f = @(x) cos(x)*cosh(x)+1;
fa = f(a)
n=0;
while (b-a)>tol
    n = n+1;
    c = (a+b)/2
    fc = f(c)
    if fc == 0
        break
    end
    if sign(fc)*sign(fa)<0
        b=c;
    else
        a=c;fa=fc;
    end
    
end
xc = (a+b)/2
b
a
plot(xc,f(xc),'.','MarkerSize',10)
%% 4:
k = xc/L
w = sqrt(El*k^4*lambda^-1)
w

