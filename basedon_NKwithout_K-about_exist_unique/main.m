%% code for task0111--iid edition with 2 fomulas -- Huang Zhuokai
clear;
format long
%% parameter
% DESCRIPTIVE TEXT
para.alpha = 1/3;
para.beta = 0.99;
para.sigma = 1;
para.eta = 1;
para.b = 1/4;
para.theta = 6;
para.omega = 2/3;
para.phi_pi = 1.5;
para.phi_x = 1/8;
para.rho_v = 0.5;
para.rho_z = 0.5;

%% Part I 
%%solve model
%get the G1, impact to solve the dynamics process
fprintf(" alpha=1/3\n")
[G1, impact] = solve_model(para);

%% obtain the impulse response functions with tech and MP shock
%
shock1 = [1;0];

%irf_psi1 = model_irf(G1, impact, para, shock1);
fprintf("\n alpha=2/3\n")
para.alpha = 2/3;   % 
[G1, impact] = solve_model(para);
%irf_psi2 = model_irf(G1, impact, para, shock1);

fprintf("\n alpha=1/3   phi_x=0\n")
para.alpha = 1/3;
para.phi_x = 0;
[G1, impact] = solve_model(para);
%irf_psi3 = model_irf(G1, impact, para,shock1);

%% plots
% T = 0: 9;
% T1 = 1:10;
% drawer1(irf_psi1,irf_psi2,irf_psi3, 1, T, T1);
