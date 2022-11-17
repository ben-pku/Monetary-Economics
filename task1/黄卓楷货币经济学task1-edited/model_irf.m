function irf = model_irf(G1, impact, para, shock)
%MODEL_IRF 
    T=200;
    impulse_tmp = zeros(9, T);
    for i = 1:T
        impulse_tmp(:,i) = G1^(i-1)*impact*shock;
    end
    impulse_y = impulse_tmp(6, :) + para.alpha*impulse_tmp(3,:) + (1-para.alpha)*impulse_tmp(8,:);
    irf = [impulse_tmp; impulse_y];

end

