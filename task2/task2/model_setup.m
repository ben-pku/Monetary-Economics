function [A_1, A_2, A_3, A_4] = model_setup(para)
%MODEL_SETUP 
%input diff equations 

    idx_pi = 1;
    idx_x = 2;
    idx_psi = 3;
    idx_z = 4;
    idx_i = 5;
    idx_v = 6;
    idx_r = 7;
    
    
    idx_pi_err = 1;
    idx_x_err = 2;
    idx_psi_err = 3;
    idx_z_err = 4;
    
    idx_v_shock = 1;
    idx_z_shock = 2;
    idx_psi_shock = 3;
    
    kappa = (1-para.omega)*(1-para.omega*para.beta)*(para.eta+para.sigma)/para.omega;
    
    A_1 = zeros(7, 7);
    A_2 = zeros(7, 7);
    A_3 = zeros(7, 3);
    A_4 = zeros(7, 4);

    % equation 1
    A_1(1, idx_pi) = -para.beta;
    
    A_2(1, idx_pi) = -1;
    A_2(1, idx_x) = kappa;
    
    A_4(1, idx_pi_err) = para.beta;
    
    % equation 2
    A_1(2, idx_psi) = para.eta/(para.eta+para.sigma);
    A_1(2, idx_z) = -para.sigma*(para.eta+1)/(para.eta+para.sigma);
    A_1(2, idx_x) = -para.sigma;
    A_1(2, idx_pi) = -1;
    
    A_2(2, idx_i) = -1;
    A_2(2, idx_psi) = para.eta/(para.eta+para.sigma);   
    A_2(2, idx_z) = -para.sigma*(para.eta+1)/(para.eta+para.sigma);
    A_2(2, idx_x) = -para.sigma;
    
    A_4(2, idx_psi_err) = para.sigma/(para.eta+para.sigma);
    A_4(2, idx_z_err) =  para.sigma*(para.eta+1)/(para.eta+para.sigma);
    A_4(2, idx_x_err) = para.sigma;
    A_4(2, idx_pi_err) = 1;
    
    % equation 3
    A_1(3, idx_i) = -1;
    A_1(3, idx_pi) = para.alpha;
    A_1(3, idx_x) = para.sigma;
    A_1(3, idx_v) = 1;
    
    % equation 4
    A_1(4, idx_v) =  1;
    
    A_2(4, idx_v) = para.rho_v;
    
    A_3(4, idx_v_shock) = 1;
    
    % equation 5
    A_1(5, idx_z) = 1;
   
    A_2(5, idx_z) = para.rho_z;
    
    A_3(5, idx_z_shock) = 1;
    
    % equation 6
    A_1(6, idx_psi) = 1;
    
    A_2(6, idx_psi) = para.rho_psi;
    
    A_3(6, idx_psi_shock) = 1;
    
%     % equation 7
%     A_1(7, idx_c) = -1;
%     A_1(7, idx_x) = 1;
%     
%     A_3(7, idx_z) = (para.eta+1)/(para.sigma+para.eta);
%     
    % equation 7
    A_1(7, idx_pi) = 1;
    
    A_2(7, idx_r) = -1;
    A_2(7, idx_i) = 1/para.beta;
    
    A_4(7, idx_pi_err) = -1;
%     
%     % equation 9
%     A_1(9, idx_n) = -1;
%     A_1(9, idx_c) = 1;
%     A_1(9, idx_z) = -1;
%     
%     %equation 10
%     A_1(10, idx_m) =para.b;
%     A_1(10, idx_psi) = 1;
%     A_1(10, idx_c) = -para.sigma;
%     A_1(10, idx_i) = para.beta/(1-para.beta);
    
    
end

