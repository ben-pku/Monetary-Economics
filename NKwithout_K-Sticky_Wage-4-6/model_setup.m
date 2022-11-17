function [A_1, A_2, A_3, A_4] = model_setup(para)
%MODEL_SETUP 
%% input diff equations 
    idx_pi = 1;
    idx_pi_w = 2;
    idx_x = 3;
    idx_x_w = 4;
    idx_i = 5;
    idx_z = 6;
    idx_v = 7;
        
    idx_v_shock = 1;
    idx_z_shock = 2;
    
    idx_pi_err = 1;
    idx_pi_w_err = 2;
    idx_x_err = 3;
    idx_z_err = 4;
   
    % parameters
    kappa = (1-para.omega)*(1-para.omega*para.beta)* (para.sigma+(para.alpha+para.eta)/(1-para.alpha) )* (1-para.alpha)/  (para.omega * (1-para.alpha+para.alpha*para.theta) );
    kappa_w = ( 1-para.beta*para.omega_bar )*(1-para.omega_bar)/((1+para.eta*para.nu)*para.omega_bar);
    
    h = (1+para.eta) / (para.sigma*(1-para.alpha)+para.alpha+para.eta );
    
    A_1 = zeros(7, 7);
    A_2 = zeros(7, 7);
    A_3 = zeros(7, 2);
    A_4 = zeros(7, 4);

    %% equation 1  -- Phillips production
    A_1(1, idx_pi) = -para.beta;
    
    A_2(1, idx_pi) = -1;
    A_2(1, idx_x_w) = kappa;
    A_2(1, idx_x) = para.alpha/(1-para.alpha)*kappa;
    
    A_4(1, idx_pi_err) = para.beta;
    
    %% equation 2 -- Phillips wage
    A_1(2, idx_pi_w) = -para.beta;
    
    A_2(2, idx_pi_w) = -1;
    A_2(2, idx_x_w) = -kappa_w;
    A_2(2, idx_x) = kappa_w*(para.sigma + para.eta/(1-para.alpha) );
    
    A_4(2, idx_pi_w_err) = para.beta;
    
    %% equation 3 -- dynamics IS
    A_1(3, idx_x) = -1;
    A_1(3, idx_pi) = -1/para.sigma;
    A_1(3, idx_z) = -h;
    
    A_2(3, idx_x) = -1;
    A_2(3, idx_i) = -1/para.sigma;  
    A_2(3, idx_z) = -h;
    
    A_4(3, idx_x_err) = 1;
    A_4(3, idx_pi_err) = 1/para.sigma;  
    A_4(3, idx_z_err) = h;
    
    %% equation 4 -- wage gap
    A_1(4, idx_x_w) = 1;
    A_1(4, idx_pi_w) = -1;
    A_1(4, idx_z) = (-para.alpha*h+1 )/(1-para.alpha);
    
    A_2(4, idx_x_w) = 1;
    A_2(4, idx_z) = (-para.alpha*h+1 )/(1-para.alpha);
    
    
    %% equation 5 -- taylor rule
    A_1(5, idx_i) = 1;
    A_1(5, idx_pi) = -para.phi_pi;
    A_1(5, idx_x) = -para.phi_x;  
    A_1(5, idx_pi_w) = -para.phi_w;
    A_1(5, idx_v) = -1;
    
    %% equation 6 v-shock
    A_1(6, idx_v) =  1;
    
    A_2(6, idx_v) = para.rho_v;
   
    A_3(6, idx_v_shock) = 1;
   
    %% equation 7 z-shock
    A_1(7, idx_z) = 1;
   
    A_2(7, idx_z) = para.rho_z;
    
    A_3(7, idx_z_shock) = 1;   
    
    
    
end

