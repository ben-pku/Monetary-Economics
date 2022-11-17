%code for 4-5 with K-- CES production function -- Huang Zhuokai
clear;
format long
%% parameter
% DESCRIPTIVE TEXT
global para
para.alpha = 1/3;
para.beta = 0.99;
para.sigma = 1; % intertemporary substitution elastisity
para.sigma1 = 0.8; % CES production function -- substitution elasticity //set by Huang Zhuokai
para.eta = 1;
para.b = 10;
para.theta = 6;
para.omega = 2/3;
para.phi_pi = 1.5;
para.phi_x = 1/8;
para.rho_v = 0.5;
para.rho_z = 0.5;
para.delta = 0.1; % set by Huang Zhuokai
para.ss_z = 1; % set by Huang Zhuokai
para.chi = 1; % set by Huang Zhuokai
para.gamma =1; % set by Huang Zhuokai



%% obtain the impulse response functions with tech and MP shock
%% Part I  interest rate shock
shock_v = [1;0];
fprintf("v-shock   alpha = 1/3\n")
%get the G1, impact to solve the dynamics process
[G1, impact] = solve_model_ces(para);
irf1 = model_irf_ces(G1, impact, para, shock_v);

fprintf("v-shock   alpha = 2/3 \n")
para.alpha = 2/3;
%get the G1, impact to solve the dynamics process
[G1, impact] = solve_model_ces(para);
irf2 = model_irf_ces(G1, impact, para, shock_v);

%% Part II tech shock
shock_z = [0;1]; 
fprintf("z-shock   alpha = 1/3\n")
%get the G1, impact to solve the dynamics process
[G1, impact] = solve_model_ces(para);
irf3 = model_irf_ces(G1, impact, para, shock_z);

fprintf("z-shock   alpha = 2/3\n")
para.alpha = 2/3;
%get the G1, impact to solve the dynamics process
[G1, impact] = solve_model_ces(para);
irf4 = model_irf_ces(G1, impact, para, shock_z);

%% plots
% v-shock
T = 0: 19;
T1 = 1:20;
drawer1(irf1,irf2, 3, T, T1);

% z-shock
T = 0: 19;
T1 = 1:20;
drawer1(irf3,irf4, 4, T, T1);





