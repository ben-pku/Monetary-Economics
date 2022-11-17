%code for task1 -- Huang Zhuokai
clear;
format long
%% parameter
% DESCRIPTIVE TEXT
para.alpha = 0.36;
para.delta = 0.019;
para.beta = 0.989;
para.ces_a = 0.997;
para.ces_b = 2;
para.rho_z = 0.9;
para.rho_theta = 0.69;
para.ss_theta = 0.014;
para.ss_z = 1;
para.ss_n = 1/3; %new para
para.sigma_z = 1 %0.34;
para.sigma_theta = 1 %0.85;
para.phi = 2; %different (the parameter in MP)  
para.eta = 1; %new para

%% Part I 
%%solve model
%get the G1, impact to solve the dynamics process
[G1, impact] = solve_model(para);

%% obtain the impulse response functions with tech and MP shock
%baseline tech shock
shock_z = [1;0];
irf_z = model_irf(G1, impact, para, shock_z);
%baseline MP shock
shock_theta = [0;1];
irf_theta = model_irf(G1, impact, para, shock_theta);


%% Part II
%%Differient CES_b
%change my para.ces_b to 1
para.ces_b = 1;
%% solve model
%get the G1, impact to solve the dynamics process
[G11, impact_1] = solve_model(para);

%% obtain the impulse response functions with tech and MP shock
%baseline tech shock
shock_z = [1;0];
irf_z_1 = model_irf(G11, impact_1, para, shock_z);
%baseline MP shock
shock_theta = [0;1];
irf_theta_1 = model_irf(G11, impact_1, para, shock_theta);

%% plots
T = 0: 99;
T1 = 1:100;

drawer(irf_z, 1, T, T1);
drawer(irf_theta, 2, T, T1);

T = 0: 99;
T1 = 1:100;
drawer(irf_z_1, 3, T, T1);
drawer(irf_theta_1, 4, T, T1);


