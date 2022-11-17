function [A_1, A_2, A_3, A_4] = model_setup(para,ss)
%MODEL_SETUP 
%input diff equations 

    idx_c = 1;
    idx_m = 2;
    idx_k = 3;
    idx_i = 4;
    idx_pi = 5;
    idx_z = 6;
    idx_theta = 7;
    idx_n = 8;
    idx_r = 9;
    
    idx_c_err = 1;
    idx_m_err = 2;
    idx_pi_err = 3;
    idx_z_err = 4;
    idx_n_err = 5;
    
    ss_Q = para.ces_a*ss.c^(1-para.ces_b) + (1-para.ces_a)*ss.m^(1-para.ces_b); %Qss
    ss_Q_coef = (1-para.ces_a)*ss.m^(1-para.ces_b)/ss_Q; %coefficient with Qss
    f1ss = ss.z * para.alpha * ss.k^(para.alpha-1) * ss.n^(1-para.alpha);
    f2ss = ss.z * (1-para.alpha) * ss.k^para.alpha * ss.n^(-para.alpha);
    fss = ss.z * ss.k^para.alpha * ss.n^(1-para.alpha);
    
    A_1 = zeros(9, 9);
    A_2 = zeros(9, 9);
    A_3 = zeros(9, 2);
    A_4 = zeros(9, 5);

    % equation 1
    A_1(1, idx_c) = (para.ces_b - para.phi)*(1-ss_Q_coef) - para.ces_b;
    A_1(1, idx_m) = (para.ces_b - para.phi)*ss_Q_coef;
    A_1(1, idx_z) = f1ss/(f1ss +1-para.delta );
    A_1(1, idx_n) = f1ss/(f1ss +1-para.delta )*(1-para.alpha);
    
    A_2(1, idx_c) = (para.ces_b - para.phi)*(1-ss_Q_coef) - para.ces_b;
    A_2(1, idx_m) = (para.ces_b - para.phi)*ss_Q_coef;
    A_2(1, idx_k) = -f1ss/(f1ss+1-para.delta) *(para.alpha-1);
    
    A_4(1, idx_c_err) = (para.ces_b - para.phi)*(1-ss_Q_coef) - para.ces_b;
    A_4(1, idx_m_err) = (para.ces_b - para.phi)*ss_Q_coef;
    A_4(1, idx_z_err) = f1ss/(f1ss+1-para.delta);
    A_4(1, idx_n_err) =  f1ss/(f1ss +1-para.delta )*(1-para.alpha);
    
    % equation 2
    A_1(2, idx_c) = (para.ces_b - para.phi)*(1-ss_Q_coef) - para.ces_b;
    A_1(2, idx_m) = (para.ces_b - para.phi)*ss_Q_coef;
    A_1(2, idx_pi) = -1/(1+para.ss_theta);
    
    A_2(2, idx_i) = -1/(1+ss.i);
    A_2(2, idx_c) = (para.ces_b - para.phi)*(1-ss_Q_coef) - para.ces_b;
    A_2(2, idx_m) = (para.ces_b - para.phi)*ss_Q_coef;
    
    A_4(2, idx_c_err) = (para.ces_b - para.phi)*(1-ss_Q_coef) - para.ces_b;
    A_4(2, idx_m_err) =  (para.ces_b - para.phi)*ss_Q_coef;
    A_4(2, idx_pi_err) = -1/(1+para.ss_theta);
    
   
    % equation 3
    A_1(3, idx_c) = para.ces_b;
    A_1(3, idx_m) = -para.ces_b;
    A_1(3, idx_i) = -1/((1+ss.i) * ss.i);
    
    % equation 4
    A_1(4, idx_c) =  (para.ces_b - para.phi)*(1-ss_Q_coef) - para.ces_b;
    A_1(4, idx_m) = (para.ces_b - para.phi)*ss_Q_coef;
    A_1(4, idx_z) = 1;
    A_1(4, idx_n) = -( para.eta* ss.n/(1-ss.n) + para.alpha );
    
    A_2(4, idx_k) = -para.alpha;
    
    % equation 5
    A_1(5, idx_k) = ss.k/(ss.k + ss.c);
    A_1(5, idx_c) = ss.c/(ss.k + ss.c);
    A_1(5, idx_z) = -fss/(fss+( 1 - para.delta)*ss.k );
    A_1(5, idx_n) = -(1-para.alpha)*fss/(fss + (1-para.delta)*ss.k);
    
    A_2(5, idx_k) = (para.alpha*fss + (1-para.delta)*ss.k )/(fss + (1-para.delta)*ss.k);
    
    % equation 6
    A_1(6, idx_z) = 1;
    A_2(6, idx_z) = para.rho_z;
    
    A_3(6, 1) = para.sigma_z;
    
    % equation 7
    A_1(7, idx_theta) = 1;
    
    A_2(7, idx_theta) = para.rho_theta;
    A_2(7, idx_z) = para.phi;
    
    A_3(7, 2) = para.sigma_theta;
    
    % equation 8
    A_1(8, idx_m) = 1;
    A_1(8, idx_theta) = -1/(1+para.ss_theta);
    A_1(8, idx_pi) = 1/(1+para.ss_theta);
    
    A_2(8, idx_m) = 1;
    
    % equation 9
    A_1(9, idx_pi) = 1;
    
    A_2(9, idx_i) = 1;
    A_2(9, idx_r) = -1;
    
    A_4(9, idx_pi_err) = 1;
    
    
end

