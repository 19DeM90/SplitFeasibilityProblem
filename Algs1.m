%min 1/2 d_C^2 + delta_Q T FB type

function [n, err] = Algs1(x0,v0)

n=0;

syms t;

L(t) = T(x0,t);
L_ad(t) = T_ad(v0,t);

err = 1/2 * int((P_C(x0) - x0)^2 + (P_Q(L,t) - L)^2,0,2*pi);

while err > 10^(-3)
    
     lambda = 0.4;       
%    lambda = 0.5 + 1/(2 + n);
     sigma = 0.01;  
     tau = 0.1;     
%    tau = 1.5 - 1/(1 + n);

    if n<1
     beta = 1/4;
    else
     beta = 1 - 1/(1 + n);
    end
    
    p0 = vpa( beta*x0 - tau*(beta*L_ad + beta*x0 - P_C(beta*x0)) , 15 );
    x0 = vpa( beta*x0 + lambda*(p0 - beta*x0) , 15 );
    H0 = vpa ( 2*p0 - beta*x0, 15);
    q0 = vpa( beta*v0 + sigma*T(H0,t) - sigma*P_Q(sigma^(-1)*beta*v0 + T(H0,t), t) , 15);
    v0 = vpa( beta*v0 + lambda*(q0 - beta*v0), 15); 
    
    L(t) = T(x0,t);
    L_ad(t) = T_ad(v0,t);
    
    err = 1/2 * int((P_C(x0) - x0)^2 + (P_Q(L,t) - L)^2,0,2*pi)
    
%   err = [err, 1/2 * int((P_C(x0) - x0)^2 + (P_Q(L,t) - L)^2,0,2*pi)];
    
    n=n+1
    
end

end