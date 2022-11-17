%% code for with K 4-5 Cobb-Douglas production fucntion -- Huang Zhuokai
% edited 2022 0210
clear;
format long
%% parameter
% DESCRIPTIVE TEXT
global para
para.alpha = 1/3;
para.beta = 0.99;
para.sigma = 1;  % intertemporary elasticity
para.eta = 1;
para.b = 10;
para.theta = 6;
para.omega = 2/3;
para.phi_pi = 1.5;
para.phi_x = 1/8;
para.rho_v = 0.5;
para.rho_z = 0.5;
para.delta = 0.1 %set by Huang Zhuokai
para.ss_z = 1; %set by Huang Zhuokai
para.chi = 1; %set by Huang Zhuokai
para.gamma =1; %set by Huang Zhuokai



%% obtain the impulse response functions with tech and MP shock
%% Part I  interest rate shock
shock_v = [1;0];
fprintf("v-shock   alpha = 1/3\n")
%get the G1, impact to solve the dynamics process
[G1, impact] = solve_model(para);
irf1 = model_irf(G1, impact, para, shock_v);

fprintf("v-shock   alpha = 2/3 \n")
para.alpha = 2/3;
%get the G1, impact to solve the dynamics process
[G1, impact] = solve_model(para);
irf2 = model_irf(G1, impact, para, shock_v);

%% Part II tech shock
shock_z = [0;1]; 
fprintf("z-shock   alpha = 1/3\n")
%get the G1, impact to solve the dynamics process
[G1, impact] = solve_model(para);
irf3 = model_irf(G1, impact, para, shock_z);

fprintf("z-shock   alpha = 2/3\n")
para.alpha = 2/3;
%get the G1, impact to solve the dynamics process
[G1, impact] = solve_model(para);
irf4 = model_irf(G1, impact, para, shock_z);

%% plots
% v-shock
T = 0: 19;
T1 = 1:20;
drawer1(irf1,irf2, 1, T, T1);

% z-shock
T = 0: 19;
T1 = 1:20;
drawer1(irf3,irf4, 2, T, T1);





