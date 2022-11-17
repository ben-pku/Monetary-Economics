function irf = model_irf(G1, impact, para, shock)
%MODEL_IRF 
    T=200;
    impulse_tmp = zeros(4, T);
    for i = 1:T
        impulse_tmp(:,i) = G1^(i-1)*impact*shock;
    end
    output = impulse_tmp(1,:) +(1+para.eta)/(para.sigma*(1-para.alpha)+para.alpha+para.eta ) *shock(1);
    emp = (output - shock(1) )/(1-para.alpha);     
    money = para.sigma*output/para.b + para.beta/( (para.beta-1)*para.b )*impulse_tmp(3,:) ;
   
    
    irf = [impulse_tmp; 
        output;
        emp;
        money;
        ];

end

