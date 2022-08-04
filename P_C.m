%Projection of C 
function y = P_C(f)
if int(f,0,2*pi) > 1
   y = (1 - int(f,0,2*pi))/(2 * pi) + f;
else
   y = f;
end