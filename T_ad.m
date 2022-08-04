%Adjoint Operator T*
function y = T_ad(f,x)

y = int(f(x)*x,0,2*pi);

end