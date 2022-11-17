function  state =  drawer1(irf1,irf2,irf3, num, T,T1)
% 0214 edited drawing function
    f1 = figure(num);
    f1.Position(3:4) = [600, 500];

    subplot(4,2,1);
    plot(T, irf1(3, T1), 'LineWidth', 1.5);
    hold on
    plot(T, irf2(3, T1),'-.', 'LineWidth', 1.5);
    hold on
    plot(T, irf3(3, T1),'--', 'LineWidth', 1.5);
    title('产出缺口')  %x
    ma = max(irf3(3,:));
    mi = min(irf3(3,:));
    r = ma - mi;
    ylim([mi-r/10  ma+r/10  ]);
    yline(0,'-.','LineWidth',1);
    legend('baseline', '\alpha =2/3', '\phi_x = 0', 'Location', 'southeast' );
    
    subplot(4,2,2);
    plot(T, irf1(1, T1), 'LineWidth', 1.5);
    hold on
    plot(T, irf2(1, T1),'-.', 'LineWidth', 1.5);
    hold on
    plot(T, irf3(1, T1),'--', 'LineWidth', 1.5);
    ma = max([irf1(1,:), irf2(1, :), irf3(1, :)]);
    mi = min([irf1(1,:), irf2(1, :), irf3(1, :)]);
    r = ma - mi;
    ylim([mi-r/10  ma+r/10  ]);
    yline(0,'-.','LineWidth',1);
    title('通货膨胀');
    
    subplot(4,2,3);
    plot(T, irf1(8, T1), 'LineWidth', 1.5);
    hold on
    plot(T, irf2(8, T1),'-.', 'LineWidth', 1.5);
    hold on
    plot(T, irf3(8, T1),'--', 'LineWidth', 1.5);
    ma = max(irf1(8,:));
    mi = min(irf3(8,:));
    r = ma - mi;
    ylim([mi-r/10  ma+r/10  ]);
    yline(0,'-.','LineWidth',1);
    title('产出');
        
    subplot(4,2,4);
    plot(T, irf1(9,T1),'LineWidth', 1.5);
    hold on
    plot(T, irf2(9,T1),'-.','LineWidth', 1.5);
    hold on
    plot(T, irf3(9,T1),'--','LineWidth', 1.5);
    ma = max(irf2(9,:));
    mi = min(irf2(9,:));
    r = ma - mi;
    ylim([mi-r/10  ma+r/10  ]);
    yline(0,'-.','LineWidth',1);
    title('就业');
    
    subplot(4,2,5);
    plot(T, irf1(5, T1),'LineWidth', 1.5);
    hold on
    plot(T, irf2(5, T1),'-.','LineWidth', 1.5);
    hold on
    plot(T, irf3(5, T1),'--','LineWidth', 1.5);
    ma = max([irf1(5,:), irf2(5,:), irf3(5,:)]);
    mi = min([irf1(5,:), irf2(5,:), irf3(5,:)]);
    r = ma - mi;
    ylim([mi-r/10  ma+r/10  ]);
    yline(0,'-.','LineWidth',1);
    title('名义利率');
    
    subplot(4,2,6);
    plot(T, irf1(10,T1),'LineWidth', 1.5);
    hold on
    plot(T, irf2(10,T1),'-.','LineWidth', 1.5);
    hold on
    plot(T, irf3(10,T1),'--','LineWidth', 1.5);
    ma = max(irf3(10,:));
    mi = min(irf1(10,:));
    r = ma - mi;
    ylim([mi-r/10  ma+r/10  ]);
    yline(0,'-.','LineWidth',1);
    title('实际利率');
    

    
    subplot(4,2,7);
    plot(T, irf1(11,T1), 'LineWidth', 1.5);
    hold on
    plot(T, irf2(11,T1),'-.', 'LineWidth', 1.5);
    hold on
    plot(T, irf3(11,T1),'--', 'LineWidth', 1.5);
    ma = max(irf3(11,:));
    mi = min(irf2(11,:));
    r = ma - mi;
    ylim([mi-r/10  ma+r/10  ]);
    yline(0,'-.','LineWidth',1);
    title('实际货币余额');
    
    subplot(4,2,8);
    plot(T, irf1(6,T1), 'LineWidth', 1.5);
    hold on
    plot(T, irf2(6,T1),'-.', 'LineWidth', 1.5);
    hold on
    plot(T, irf3(6,T1),'--', 'LineWidth', 1.5);
    ma = max([irf1(6,:),irf2(6,:),irf3(6,:)]);
    mi = min([irf1(6,:),irf2(6,:),irf3(6,:)]);
    r = ma - mi;
    ylim([mi-r/10  ma+r/10  ]);
    yline(0,'-.','LineWidth',1);
    title('技术水平');
    
    %name = ;
    print(f1, './NK_without_K_MP_eight_plots.eps', '-depsc');
    state = 0;
end

