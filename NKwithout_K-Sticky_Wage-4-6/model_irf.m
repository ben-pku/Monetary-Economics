function irf = model_irf(G1, impact, para, shock)
%% MODEL_IRF 
    T=200;
    impulse_tmp = zeros(7, T);
    for i = 1:T
        impulse_tmp(:,i) = G1^(i-1)*impact*shock;
    end
    %% obtain -- E pi
    Epi = G1*impulse_tmp;   %2nd dimension is the E pi
    %% obtain real_r
    real_r = impulse_tmp(5,:) - Epi(1,:);  % def of real rate  --10
    %% obtain other parameters
    h = (1+para.eta) / (para.sigma*(1-para.alpha)+para.alpha+para.eta );
    output = impulse_tmp(3,:) +h* impulse_tmp(6,:);  % def of x  --8
    emp = (output - impulse_tmp(6,:) )/(1-para.alpha);           % n log linear  --9
    money = para.sigma*output/para.b - para.beta/(para.beta-1)/para.b * impulse_tmp(5,:) ;   % 4.3 formular
   
    irf = [
        impulse_tmp; 
        
        output; %8
        emp; %9
        real_r; %10
        money; %11
        ];

end

