function irf = model_irf(G1, impact, para, shock)
%MODEL_IRF 
    T=200;
    impulse_tmp = zeros(13, T);
    for i = 1:T
        impulse_tmp(:,i) = G1^(i-1)*impact*shock;
    end
    
    irf = impulse_tmp; 
%     poten = 2*impulse_tmp(12,:)-impulse_tmp(5,:)-impulse_tmp(7,:);
%     gap = impulse_tmp(1,:)-poten;
%     irf = [irf;
%         gap];
end

