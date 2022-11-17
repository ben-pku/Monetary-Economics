function irf = model_irf_ces(G1, impact, para, shock)
%MODEL_IRF 
    global para ss
    T=200;
    impulse_tmp = zeros(13, T);
    for i = 1:T
        impulse_tmp(:,i) = G1^(i-1)*impact*shock;
    end
    
    irf = impulse_tmp; 
    poten = impulse_tmp(5,:) + impulse_tmp(12,:) - ss.l/((1-ss.l)*(1-para.sigma1) ) * impulse_tmp(8,:);
    gap = impulse_tmp(1,:)-poten;
    irf = [irf;
        gap];
end

