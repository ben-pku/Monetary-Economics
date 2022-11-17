% Code for simple model
clear;

%% Parameters
para.alpha = 0.36;
para.delta = 0.019;
para.beta = 0.989;
para.ces_a = 0.997;
para.ces_b = 3;
para.rho_z = 0.9;
para.rho_theta = 0.69;
para.ss_theta = 0.014;
para.ss_z = 1;
para.sigma_z = 0.34;
para.sigma_theta = 0.85;
para.phi = 0;

%% Solve model
[G1, impact] = solve_simple_model(para);

%% Obtain impulse response function for technology and money shocks
% baseline technology shock
shock_z = [1; 0];
irf_z_1 = simple_model_irf(G1, impact, para, shock_z); %1
% baseline money shock
shock_m = [0; 1]; 
irf_m_1 = simple_model_irf(G1, impact, para, shock_m); %2

%% Other settings
% change rho_z = 0.95
para.rho_z = 0.95;
% resolve model
[G1, impact] = solve_simple_model(para);
irf_z_2 = simple_model_irf(G1, impact, para, shock_z); %3

% change rho_z = 0.5
para.rho_z = 0.6;
[G1, impact] = solve_simple_model(para);
irf_z_3 = simple_model_irf(G1, impact, para, shock_z); %4

% set rho_z back to 0.9 but set phi = 0.5
para.rho_z = 0.9;
para.phi = 0.5;
[G1, impact] = solve_simple_model(para);
irf_z_4 = simple_model_irf(G1, impact, para, shock_z); %5

para.phi = -0.5;
[G1, impact] = solve_simple_model(para);
irf_z_5 = simple_model_irf(G1, impact, para, shock_z); %6

%% Plots
figure(1)
subplot(3, 2, 1)
plot(0:60, irf_m_1(9, 2:62), 'LineWidth', 1)
title('产出')
ylim([-0.005 0.045])
yline(0,'-.', 'LineWidth', 0.6)
subplot(3, 2, 2)
plot(0:60, irf_m_1(1, 2:62), 'LineWidth', 1)
title('消费')
ylim([-0.6 0.3])
yline(0,'-.', 'LineWidth', 0.6)
subplot(3, 2, 3)
plot(0:60, irf_m_1(8, 2:62), 'LineWidth', 1)
title('实际利率')
ylim([-2e-3 0.5e-3])
yline(0,'-.', 'LineWidth', 0.6)
subplot(3, 2, 4)
plot(0:60, irf_m_1(4, 2:62), 'LineWidth', 1)
title('名义利率')
ylim([-0.005 0.05])
yline(0,'-.', 'LineWidth', 0.6)
subplot(3, 2, 5)
plot(0:60, irf_m_1(5, 2:62), 'LineWidth', 1)
title('通货膨胀')
ylim([-0.005 0.05])
yline(0,'-.', 'LineWidth', 0.6)
subplot(3, 2, 6)
plot(0:60, irf_m_1(2, 2:62), 'LineWidth', 1)
title('实际货币余额')
ylim([-1.2 0.2])
yline(0,'-.', 'LineWidth', 0.6)
saveas(gcf, './plots/simple_model_m_shock.eps', 'epsc')


figure(2)
subplot(3, 2, 1)
plot(0:60, irf_z_1(9, 2:62), '-', ...
    0:60, irf_z_2(9, 2:62), '-.', ...
    0:60, irf_z_3(9, 2:62), '--', 'LineWidth', 1)
title('产出')
ylim([-0.05 0.45])
yline(0,'-.', 'LineWidth', 0.6)
legend({'\rho_z = 0.9', '\rho_z = 0.95', '\rho_z = 0.6'}, 'FontSize', 8)
legend('boxoff')
subplot(3, 2, 2)
plot(0:60, irf_z_1(1, 2:62), '-', ...
    0:60, irf_z_2(1, 2:62), '-.', ...
    0:60, irf_z_3(1, 2:62), '--', 'LineWidth', 1)
title('消费')
ylim([-0.6 0.5])
yline(0,'-.', 'LineWidth', 0.6)
subplot(3, 2, 3)
plot(0:60, irf_z_1(8, 2:62), ...
    0:60, irf_z_2(8, 2:62), '-.', ...
    0:60, irf_z_3(8, 2:62), '--', 'LineWidth', 1)
title('实际利率')
ylim([-1e-3 7e-3])
yline(0,'-.', 'LineWidth', 0.6)
subplot(3, 2, 4)
plot(0:60, irf_z_1(4, 2:62), ...
    0:60, irf_z_2(4, 2:62), '-.', ...
    0:60, irf_z_3(4, 2:62), '--', 'LineWidth', 1)
title('名义利率')
ylim([-0.06 0.02])
yline(0,'-.', 'LineWidth', 0.6)
subplot(3, 2, 5)
plot(0:60, irf_z_1(5, 2:62), ...
    0:60, irf_z_2(5, 2:62), '-.', ...
    0:60, irf_z_3(5, 2:62), '--', 'LineWidth', 1)
title('通货膨胀')
ylim([-0.09 0.02])
yline(0,'-.', 'LineWidth', 0.6)
subplot(3, 2, 6)
plot(0:60, irf_z_1(2, 2:62), ...
    0:60, irf_z_2(2, 2:62), '-.', ...
    0:60, irf_z_3(2, 2:62), '--', 'LineWidth', 1)
title('实际货币余额')
ylim([-0.05 0.35])
yline(0,'-.', 'LineWidth', 0.6)
saveas(gcf, './plots/simple_model_z_shock_rho.eps', 'epsc')


figure(3)
subplot(3, 2, 1)
plot(0:60, irf_z_1(9, 2:62), '-', ...
    0:60, irf_z_4(9, 2:62), '-.', ...
    0:60, irf_z_5(9, 2:62), '--', 'LineWidth', 1)
title('产出')
ylim([-0.05 0.45])
yline(0,'-.', 'LineWidth', 0.6)
legend({'\phi = 0', '\phi = 0.5', '\phi = -0.5'}, 'FontSize', 8)
legend('boxoff')
subplot(3, 2, 2)
plot(0:60, irf_z_1(1, 2:62), '-', ...
    0:60, irf_z_4(1, 2:62), '-.', ...
    0:60, irf_z_5(1, 2:62), '--', 'LineWidth', 1)
title('消费')
ylim([-1.2 0.8])
yline(0,'-.', 'LineWidth', 0.6)
subplot(3, 2, 3)
plot(0:60, irf_z_1(8, 2:62), ...
    0:60, irf_z_4(8, 2:62), '-.', ...
    0:60, irf_z_5(8, 2:62), '--', 'LineWidth', 1)
title('实际利率')
ylim([-4e-3 8e-3])
yline(0,'-.', 'LineWidth', 0.6)
subplot(3, 2, 4)
plot(0:60, irf_z_1(4, 2:62), ...
    0:60, irf_z_4(4, 2:62), '-.', ...
    0:60, irf_z_5(4, 2:62), '--', 'LineWidth', 1)
title('名义利率')
ylim([-0.25 0.2])
yline(0,'-.', 'LineWidth', 0.6)
subplot(3, 2, 5)
plot(0:60, irf_z_1(5, 2:62), ...
    0:60, irf_z_4(5, 2:62), '-.', ...
    0:60, irf_z_5(5, 2:62), '--', 'LineWidth', 1)
title('通货膨胀')
ylim([-0.25 0.2])
yline(0,'-.', 'LineWidth', 0.6)
subplot(3, 2, 6)
plot(0:60, irf_z_1(2, 2:62), ...
    0:60, irf_z_4(2, 2:62), '-.', ...
    0:60, irf_z_5(2, 2:62), '--', 'LineWidth', 1)
title('实际货币余额')
ylim([-3.5 4])
yline(0,'-.', 'LineWidth', 0.6)
saveas(gcf, './plots/simple_model_z_shock_phi.eps', 'epsc')



