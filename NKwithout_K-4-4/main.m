%% code for task--4.4 NK without K -- Huang Zhuokai
% edited 20220210
clear;
format long
%% parameter
% DESCRIPTIVE TEXT
para.alpha = 1/3;
para.beta = 0.99;
para.sigma = 1;
para.eta = 1;
para.b = 10;
para.theta = 6;
para.omega = 2/3;
para.phi_pi = 1.5;
para.phi_x = 1/8;
para.rho_v = 0.5;
para.rho_z = 0.5;

%% Part I  -- alpha = 1/3
%% solve model
% get the G1, impact to solve the dynamics process
fprintf(" alpha=1/3\n")
[G1, impact] = solve_model(para);
% obtain the impulse response functions with tech and MP shock
shock1 = [0;1];
irf1 = model_irf(G1, impact, para, shock1);

%% Part II -- alpha = 2/3
%% solve model
% get the G1, impact to solve the dynamics process
fprintf("\n alpha=2/3\n")
para.alpha = 2/3;   % 
[G1, impact] = solve_model(para);
% obtain the impulse response functions with tech and MP shock
irf2 = model_irf(G1, impact, para, shock1);

%% Part II -- alpha = 1/3, phi_x = 0
%% solve model
% get the G1, impact to solve the dynamics process
fprintf("\n alpha=1/3   phi_x=0\n")
para.alpha = 1/3;
para.phi_x = 0;
[G1, impact] = solve_model(para);
irf3 = model_irf(G1, impact, para,shock1);

%% plots
 T = 0: 15;
 T1 = 1:16;
 drawer1(irf1,irf2,irf3, 1, T, T1);
