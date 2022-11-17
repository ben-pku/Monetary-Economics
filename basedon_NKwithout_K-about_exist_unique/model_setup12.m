function [A_1, A_2, A_3, A_4] = model_setup12(para)
%MODEL_SETUP  12 --iid
%input diff equations 
    idx_x = 1;
    idx_pi = 2;
    %idx_z = 3;
    %idx_i = 3;
    %idx_v = 5;
    %idx_r = 3;
        
    idx_z_shock = 1;
    idx_v_shock = 2;
    
    idx_x_err = 1;
    idx_pi_err = 2;
    %idx_z_err = 3;
   
    kappa = (1-para.omega)*(1-para.omega*para.beta)* (para.sigma+(para.alpha+para.eta)/(1-para.alpha) )* (1-para.alpha)/  (para.omega * (1-para.alpha+para.alpha*para.theta) );
    h = (1+para.eta) / (para.sigma*(1-para.alpha)+para.alpha+para.eta );
    
    A_1 = zeros(2, 2);
    A_2 = zeros(2, 2);
    A_3 = zeros(2, 2);
    A_4 = zeros(2, 2);

    % equation 1  -- phillips
    A_1(1, idx_pi) = -para.beta;
    
    A_2(1, idx_pi) = -1;
    A_2(1, idx_x) = kappa;
    
    A_4(1, idx_pi_err) = para.beta;
    
    % equation 2 -- dynamics IS
    A_1(2, idx_x) = 1;
    A_1(2, idx_pi) = 1/para.sigma;
    %A_1(2, idx_z) = h;
    
    A_2(2, idx_x) = 1+para.phi_x/para.sigma;
    A_2(2, idx_pi) = para.phi_pi / para.sigma;  
   
    A_3(2, idx_z_shock) = h;
    A_3(2, idx_v_shock) = 1/para.sigma;
    
    A_4(2, idx_x_err) = -1;
    A_4(2, idx_pi_err) =  -1/para.sigma;  
    %A_4(2, idx_z_err) = -h;
    
%     % equation 3 -- taylor rule
%     A_1(3, idx_i) = -1;
%     A_1(3, idx_pi) = para.phi_pi;
%     A_1(3, idx_x) = para.phi_x;
%     
%     A_1(3, idx_v_shock) = 1;
    
%     % equation 4
%     A_1(4, idx_v) =  1;
%     
%     %A_2(4, idx_v) = para.rho_v;
%     
%     A_3(4, idx_v_shock) = 1;
%     
%     % equation 5
%     A_1(5, idx_z) = 1;
%    
%     %A_2(5, idx_z) = para.rho_z;
%     
%     A_3(5, idx_z_shock) = 1;
    
%     %equation 4 -- def real r
%     A_1(3, idx_pi) = 1;
%     
%     A_2(3, idx_r) = -1;
%     A_2(3, idx_pi) = para.phi_pi;
%     A_2(3, idx_x) = para.phi_x;
%     
%     A_3(3, idx_v_shock) = 1;
%     
%     A_4(3, idx_pi_err) = -1;
    
    
    
end

