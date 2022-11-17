function  state =  drawer(irf, num, T,T1)
    f1 = figure(num);
    subplot(3,2,1);
    plot(T, irf(1, T1), 'LineWidth', 1);
    title('产出')  %x
    ma = max(irf(1,:));
    mi = min(irf(1,:));
    r = ma - mi;
    ylim([mi-r/10  ma+r/10  ]);
    yline(0,'-.','LineWidth',1);
   
    subplot(3,2,2);
    plot(T, irf(10, T1), 'LineWidth', 1);
    ma = max(irf(10,:));
    mi = min(irf(10,:));
    r = ma - mi;
    ylim([mi-r/10  ma+r/10  ]);
    yline(0,'-.','LineWidth',1);
    title('通货膨胀');
    
    subplot(3,2,3);
    plot(T, irf(9, T1),'LineWidth', 1);
    ma = max(irf(9,:));
    mi = min(irf(9,:));
    r = ma - mi;
    ylim([mi-r/10  ma+r/10  ]);
    yline(0,'-.','LineWidth',1);
    title('名义利率');
    
    subplot(3,2,4);
    plot(T, irf(8,T1),'LineWidth', 1);
    ma = max(irf(8,:));
    mi = min(irf(8,:));
    r = ma - mi;
    ylim([mi-r/10  ma+r/10  ]);
    yline(0,'-.','LineWidth',1);
    title('实际利率');
    
    subplot(3,2,5);
    plot(T, irf(5,T1),'LineWidth', 1);
    ma = max(irf(5,:));
    mi = min(irf(5,:));
    r = ma - mi;
    ylim([mi-r/10  ma+r/10  ]);
    yline(0,'-.','LineWidth',1);
    title('就业');
    
    subplot(3,2,6);
    plot(T, irf(6,T1), 'LineWidth', 1);
    ma = max(irf(6,:));
    mi = min(irf(6,:));
    r = ma - mi;
    ylim([mi-r/10  ma+r/10  ]);
    yline(0,'-.','LineWidth',1);
    title('实际货币余额');
    
    %name = ;
    print(f1, ['figure',num2str(num)], '-depsc');
    state = 0;
end

