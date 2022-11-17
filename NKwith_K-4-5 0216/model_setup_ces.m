function [A_1, A_2, A_3, A_4] = model_setup(para,ss)
%% MODEL_SETUP   with CES production function
%input diff equations 
    idx_y = 1;
    idx_c = 2;
    idx_s = 3;
    idx_k = 4;
    idx_n = 5;
    idx_m = 6;
    idx_w = 7;
    idx_r = 8;
    idx_i = 9;
    idx_pi = 10;
    idx_phi = 11;
    idx_z = 12;
    idx_v = 13;
    
    idx_v_shock = 1;
    idx_z_shock = 2;
    
    idx_c_err = 1;
    idx_pi_err = 2;
    idx_r_err = 3;
   
    kappa = (1-para.omega)*(1-para.omega*para.beta)/ para.omega;
    
    
    A_1 = zeros(13, 13);
    A_2 = zeros(13, 13);
    A_3 = zeros(13, 2);  %shock mat
    A_4 = zeros(13, 3);  %err mat

    % equation 1 -- 4.1
    A_1(1, idx_pi) = -1/para.sigma;
    A_1(1, idx_c) = -1;
    
    A_2(1, idx_c) = -1;
    A_2(1, idx_i) = -1/para.sigma;
    
    A_4(1, idx_c_err) = 1;
    A_4(1, idx_pi_err) = 1/para.sigma;
    
    % equation 2 -- 4.2 
    A_1(2, idx_c) = para.sigma;
    A_1(2, idx_m) = -para.b;
    A_1(2, idx_i) = -1/ss.i;
    
    % equation 3 -- 4.3
    A_1(3, idx_n) = para.eta;
    A_1(3, idx_c) = para.sigma;
    A_1(3, idx_w) = -1;
    
    % equation 4 -- 4.4
    A_1(4, idx_c) =  para.sigma;
    A_1(4, idx_r) = -para.beta;
    
    A_2(4, idx_c) = para.sigma;
    
    A_4(4, idx_c_err) = -para.sigma;
    A_4(4, idx_r_err) = para.beta;
    
    % equation 5 -- Phillips
    A_1(5, idx_pi) = -para.beta;
   
    A_2(5, idx_pi) = -1;
    A_2(5, idx_phi) = kappa; 
    
    A_4(5, idx_pi_err) = para.beta;
    
    %equation 6  -- unit cost
    A_1(6, idx_phi) = -1;
    A_1(6, idx_z) = ss.l-1;
    A_1(6, idx_w) = 1-ss.l;
    A_1(6, idx_r) = ss.l;
    
    %equation 7 -- labor
    A_1(7, idx_n) = -1; 
    A_1(7, idx_z) = -1-ss.l/(para.sigma1-1);
    A_1(7, idx_w) = ss.l/(para.sigma1-1);
    A_1(7, idx_r) = -ss.l/(para.sigma1-1);
    A_1(7, idx_y) = 1;
    %A_1(7, idx_c) = -1;
    
    %equation 8 -- capital
    A_1(8, idx_y ) = 1;
    %A_1(8, idx_c ) = 1;
    A_1(8, idx_z ) = (1-ss.l)/(para.sigma1-1);
    A_1(8, idx_w ) = -(1-ss.l)/(para.sigma1-1);
    A_1(8, idx_r ) = (1-ss.l)/(para.sigma1-1);
    
    A_2(8, idx_k ) = 1;
    
    %equation 9 -- y = c+s
    A_1(9, idx_y) = ss.y;
    A_1(9, idx_c) = -ss.c;
    A_1(9, idx_s) = -ss.s;
    
    % equation 10
    A_1(10, idx_k) = 1;
    A_1(10, idx_s) = -para.delta;
    
    A_2(10, idx_k) =1-para.delta;
    
    % equation 11
    A_1(11, idx_z ) = 1;
    
    A_2(11, idx_z) = para.rho_z;
    
    A_3(11, idx_z_shock) = 1;
    
    % equation 12 -- Taylor rule
    A_1(12, idx_i) = -1; 
    A_1(12, idx_y) = para.phi_y;
    A_1(12, idx_pi) = para.phi_pi;
    A_1(12, idx_v ) = 1;
   
    % equation 13
    A_1(13, idx_v) = 1;
    
    A_2(13, idx_v) =para.rho_v;
    
    A_3(13, idx_v_shock) = 1;
    
end

