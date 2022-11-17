function  state =  drawer1(irf1,irf2, num, T,T1)
    f1 = figure(num);
    subplot(3,2,1);
    plot(T, irf1(14, T1), 'LineWidth', 1);
    hold on
    plot(T, irf2(14, T1),'--', 'LineWidth', 1);
    title('产出缺口')  %x
    ma = max([irf1(14,:), irf2(14,:)]);
    mi = min([irf1(14,:), irf2(14,:)]);
    r = ma - mi;
    ylim([mi-r/10  ma+r/10  ]);
    yline(0,'-.','LineWidth',1);
    legend('\alpha=1/3', '\alpha =2/3' );
   
    subplot(3,2,2);
    plot(T, irf1(10, T1), 'LineWidth', 1);
    hold on
    plot(T, irf2(10, T1),'--', 'LineWidth', 1);
    ma = max([irf1(10,:), irf2(10,:)]);
    mi = min([irf1(10,:), irf2(10,:)]);
    r = ma - mi;
    ylim([mi-r/10  ma+r/10  ]);
    yline(0,'-.','LineWidth',1);
    title('通货膨胀');
    
    subplot(3,2,3);
    plot(T, irf1(9, T1),'LineWidth', 1);
    hold on
    plot(T, irf2(9, T1),'--','LineWidth', 1);
    ma = max([irf1(9,:), irf2(9,:)]);
    mi = min([irf1(9,:), irf2(9,:)]);
    r = ma - mi;
    ylim([mi-r/10  ma+r/10  ]);
    yline(0,'-.','LineWidth',1);
    title('名义利率');
    
    subplot(3,2,4);
    plot(T, irf1(8,T1),'LineWidth', 1);
    hold on
    plot(T, irf2(8,T1),'--','LineWidth', 1);
    ma = max([irf1(8,:), irf2(8,:)]);
    mi = min([irf1(8,:), irf2(8,:)]);
    r = ma - mi;
    ylim([mi-r/10  ma+r/10  ]);
    yline(0,'-.','LineWidth',1);
    title('实际利率');
    
    subplot(3,2,5);
    plot(T, irf1(5,T1),'LineWidth', 1);
    hold on
    plot(T, irf2(5,T1),'--','LineWidth', 1);
    ma = max([irf1(5,:), irf2(5,:)]);
    mi = min([irf1(5,:), irf2(5,:)]);
    r = ma - mi;
    ylim([mi-r/10  ma+r/10  ]);
    yline(0,'-.','LineWidth',1);
    title('就业');
    
    subplot(3,2,6);
    plot(T, irf1(6,T1), 'LineWidth', 1);
    hold on
    plot(T, irf2(6,T1),'--', 'LineWidth', 1);
    ma = max([irf1(6,:), irf2(6,:)]);
    mi = min([irf1(6,:), irf2(6,:)]);
    r = ma - mi;
    ylim([mi-r/10  ma+r/10  ]);
    yline(0,'-.','LineWidth',1);
    title('实际货币余额');


    %name = ;
    print(f1, ['figure',num2str(num)], '-depsc');
    state = 0;
end

