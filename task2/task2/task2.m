%code for task2 -- Huang Zhuokai
clear;
format long
%% parameter
% DESCRIPTIVE TEXT
para.alpha = 1.5;
para.beta = 0.99;
para.sigma = 1;
para.eta = 1;
para.b = 1;
para.omega = 0.8;
para.rho_v = 0.5;
para.rho_z = 0.5;
para.rho_psi = 0.9;   % set by myself
para.ss_pi = 0;
para.ss_i = 1/para.beta -1;

%% Part I 
%%solve model
%get the G1, impact to solve the dynamics process
[G1, impact] = solve_model(para);

%% obtain the impulse response functions with tech and MP shock
%baseline preference shock
shock_psi = [0;0;1];
irf_psi = model_irf(G1, impact, para, shock_psi);

para.rho_psi = 0.5;   % set by myself
[G1, impact] = solve_model(para);
irf_psi2 = model_irf(G1, impact, para, shock_psi);



%% plots
T = 0: 59;
T1 = 1:60;

drawer(irf_psi, 1, T, T1);

% T = 0: 29;
% T1 = 1:30;
% 
% drawer(irf_psi2, 1, T, T1);




