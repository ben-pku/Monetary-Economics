function [A_1, A_2, A_3, A_4] = simple_model_setup(para, ss)
    % set up input matrices for gensis
    
    idx_c = 1;
    idx_m = 2;
    idx_k = 3;
    idx_i = 4;
    idx_pi = 5;
    idx_z = 6;
    idx_theta = 7;
    idx_r = 8;

    idx_c_err = 1;
    idx_m_err = 2;
    idx_pi_err = 3;
    idx_z_err = 4;

    ss_Q = para.ces_a*ss.c^(1-para.ces_b) + ...
        (1-para.ces_a)*ss.m^(1-para.ces_b);
    
    ss_Q_coef = (1-para.ces_a)*ss.m^(1-para.ces_b)/ss_Q;

    A_1 = zeros(8, 8);
    A_2 = zeros(8, 8);
    A_3 = zeros(8, 2);
    A_4 = zeros(8, 4);

    % equation 1
    A_1(1, idx_m) = para.ces_b *ss_Q_coef;
    A_1(1, idx_c) = -para.ces_b *ss_Q_coef;
    A_1(1, idx_z) = (1/para.beta+para.delta-1)*para.beta;

    A_2(1, idx_m) = para.ces_b *ss_Q_coef;
    A_2(1, idx_c) = -para.ces_b *ss_Q_coef;
    A_2(1, idx_k) = -(1/para.beta+para.delta-1)*para.beta*(para.alpha-1);

    A_4(1, idx_m_err) = para.ces_b *ss_Q_coef;
    A_4(1, idx_c_err) = -para.ces_b *ss_Q_coef;
    A_4(1, idx_z_err) = (1/para.beta+para.delta-1)*para.beta;

    % equation 2
    A_1(2, idx_m) = -para.ces_b;
    A_1(2, idx_c) = para.ces_b;
    A_1(2, idx_i) = -1/ss.i/(1+ss.i);

    % equation 3
    A_1(3, idx_m) = para.ces_b *ss_Q_coef;
    A_1(3, idx_c) = -para.ces_b *ss_Q_coef;
    A_1(3, idx_pi) = -1/(1+ss.pi);

    A_2(3, idx_m) = para.ces_b *ss_Q_coef;
    A_2(3, idx_c) = -para.ces_b *ss_Q_coef;
    A_2(3, idx_i) = -1/(1+ss.i);

    A_4(3, idx_m_err) = para.ces_b *ss_Q_coef;
    A_4(3, idx_c_err) = -para.ces_b *ss_Q_coef;
    A_4(3, idx_pi_err) = -1/(1+ss.pi);

    % equation 4
    A_1(4, idx_z) = ss.y/(ss.y + (1-para.delta)*ss.k);
    A_1(4, idx_c) = -ss.c/(ss.c + ss.k);
    A_1(4, idx_k) = -ss.k/(ss.c+ ss.k);

    A_2(4, idx_k) = -(ss.y*para.alpha + (1-para.delta)*ss.k)/...
        (ss.y +(1-para.delta)*ss.k);

    % equation 5
    A_1(5, idx_m) = 1;
    A_1(5, idx_theta) = -1/(1+para.ss_theta);
    A_1(5, idx_pi) = 1/(1+ss.pi);

    A_2(5, idx_m) = 1;

    % equation 6
    A_1(6, idx_z) = 1;

    A_2(6, idx_z) = para.rho_z;

    A_3(6, 1) = para.sigma_z;

    % eauation 7
    A_1(7, idx_theta) = 1;

    A_2(7, idx_theta) = para.rho_theta;
    A_2(7, idx_z) = para.phi;

    A_3(7, 2) = para.sigma_theta;

    % equation 8
    A_1(8, idx_pi) = 1;

    A_2(8, idx_r) = -1;
    A_2(8, idx_i) = 1;

    A_4(8, idx_pi_err) = 1;
end