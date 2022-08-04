%min detal_C + delta_Q 
%A = N_C, B = N_Q, C = 0. 

N = 50;
n=0;


syms t x0 v0

x0(t) = t^2/10;
v0(t) = t^4/5;

L(t) = T(x0,t);
L_ad(t) = T_ad(v0,t);

err = 1/2 * int((P_C(x0) - x0)^2 + (P_Q(L,t) - L)^2,0,2*pi);

while err > 10^(-3)
    
     lambda = 0.1;       
%    lambda = 0.5 + 1/(2 + n);
     sigma = 0.05;  
     tau = 0.07;     
%    tau = 1.5 - 1/(1 + n);

    if n<1
     beta = 1/4;
    else
     beta = 1 - 1/(1 + n);
    end
    
    h0 = vpa( beta*x0 - tau*beta*L_ad , 15 );
    p0 = vpa( P_C(h0) , 15 );
    x0 = vpa( beta*x0 + lambda*(p0 - beta*x0) , 15 );
    H0 = vpa ( 2*p0 - beta*x0, 15);
    q0 = vpa( beta*v0 + sigma*T(H0,t) - sigma*P_Q(sigma^(-1)*beta*v0 + T(H0,t), t) , 15);
    v0 = vpa( beta*v0 + lambda*(q0 - beta*v0), 15); 
    
    L(t) = T(x0,t);
    L_ad(t) = T_ad(v0,t);
    
    err = [err, 1/2 * int((P_C(x0) - x0)^2 + (P_Q(L,t) - L)^2,0,2*pi)];
    
    n=n+1
    
end