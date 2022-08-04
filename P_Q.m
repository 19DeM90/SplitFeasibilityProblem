%Projection of Q 
function y = P_Q(f,x)
if int((f(x) - sin(x))^2,0,2*pi) > 16
   y = sin(x) + 4*(f(x) - sin(x))/(int((f(x) - sin(x))^2,0,2*pi)^(1/2));
else
   y = f(x);
end