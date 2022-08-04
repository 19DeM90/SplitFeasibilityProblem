%Initializiation 

close all
clear all
clc
format long

N = 1;

syms t x0 v0

%x0(t) = t^2/10;
%x0(t) = (2^t)/16;
%x0(t) = (0.5)*exp(t);
 x0(t) = exp(t) + (t^2)/24;
%x0(t) = 2*sin(5*t)^4 - 3*cos(2*t);

%v0(t) = t^2/10;
%v0(t) = (2^t)/16;
%v0(t) = (0.5)*exp(t);
 v0(t) = exp(t) + (t^2)/24;
%v0(t) = 2*sin(5*t)^4 - 3*cos(2*t);


% [n1, err1] = 
Alg1(x0, v0);
% [n2, err2] = 
Algs1(x0, v0);

% A1 = [n1, err1];
% b1 = A1(2);
% 
% A2 = [n2,err2];

%disp(n1), disp(n2);

% figure
% semilogy(0:n1,err1,'--',0:A2(1),A2(2:end), 'r',0:10^(-3):n1,10^(-3))
% text(3, 10^(-2.9), 'determination criterion', 'FontSize', 10)
% ylim([10^(-3.1), 10^(0.75)])
% xlim([0, n1])
% xlabel('Number of Iterations') 
% ylabel('E(x_n)')
% legend('without strong convergence','with strong convergence')
