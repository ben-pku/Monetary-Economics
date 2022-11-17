function irf = model_irf(G1, impact, para, shock)
%% MODEL_IRF 
    T=200;
    impulse_tmp = zeros(5, T);
    for i = 1:T
        impulse_tmp(:,i) = G1^(i-1)*impact*shock;
    end
    %% obtain -- E pi
    Epi = G1*impulse_tmp;   %2nd dimension is the E pi
    %% obtain real_r
    real_r = impulse_tmp(3,:) - Epi(2,:);  % def of real rate 
    %% obtain other parameters
    h = (1+para.eta) / (para.sigma*(1-para.alpha)+para.alpha+para.eta );
    output = impulse_tmp(1,:) +h* impulse_tmp(4,:);  % def of x
    emp = (output - impulse_tmp(4,:) )/(1-para.alpha);           % n log linear 
    money = para.sigma*output/para.b + (3*para.beta-para.beta*para.beta-1 )/( (para.beta-1)*para.beta*para.b )*impulse_tmp(3,:) ;   % 4.3 formular
   
    irf = [
        impulse_tmp; 
        real_r;
        output;
        emp;
        money;
        ];

end

