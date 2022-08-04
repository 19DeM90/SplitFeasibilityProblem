%min ind_C + ind_Q DR type

function [n, err] = Algs2(x0,v0)

n=0;

syms t;

L(t) = T(x0,t);

err = 1/2 * int((P_C(x0) - x0)^2 + (P_Q(L,t) - L)^2,0,2*pi);

while err > 10^(-3)
    
     lambda = 0.4;       
%    lambda = 0.5 + 1/(2 + n);
     sigma = 0.05;  
     tau = 0.1;     
%    tau = 1.5 - 1/(1 + n);

    if n<1
     beta = 1/4;
    else
     beta = 1 - 1/(1 + n);
    end
    
    p1 = vpa( P_C(beta*x0 - (tau/2)*beta*T_ad(v0,t)) , 15 );
    w1 = vpa( 2*p1 - beta*x0 , 15 );
    p2 = vpa( beta*v0 + (sigma/2)*T(w1,t) - sigma*P_Q(sigma^(-1)*beta*v0 + 0.5*T(w1,t),t) ,15);
    w2 = vpa( 2*p2 - beta*v0 , 15);
    z1 = vpa( w1 - (tau/2)*T_ad(w2,t) , 15);
    x0 = vpa( beta*x0 + lambda*(z1 - p1) , 15 );
    v0 = vpa( beta*v0 - lambda*p2, 15); 
    h = vpa( P_C(x0 - (tau/2)*T_ad(v0,t)) , 15);
    
    L(t) = T(h,t);
    
    err = 1/2 * int((P_C(x0) - x0)^2 + (P_Q(L,t) - L)^2,0,2*pi)
    
%   err = [err, 1/2 * int((P_C(x0) - x0)^2 + (P_Q(L,t) - L)^2,0,2*pi)];
    
    n=n+1
    
end

end