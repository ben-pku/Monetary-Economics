function irf = model_irf(G1, impact, para, shock)
%MODEL_IRF 
    T=200;
    impulse_tmp = zeros(7, T);
    for i = 1:T
        impulse_tmp(:,i) = G1^(i-1)*impact*shock;
    end
    output = impulse_tmp(2,:) +(1+para.eta)/(para.sigma+para.eta)*impulse_tmp(4,:);
    emp = output - impulse_tmp(4,:);
    money = -1/para.b*impulse_tmp(3,:)+ para.sigma/para.b*impulse_tmp(7,:)+para.beta/(1-para.beta)/para.b * impulse_tmp(5,:);
    
    
    irf = [impulse_tmp; 
        output;
        emp;
        money];

end

