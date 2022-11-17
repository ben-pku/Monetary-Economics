function  state =  drawer(irf, num, T,T1)
    f1 = figure(num);
    subplot(3,2,1);
    plot(T, irf(10, T1), 'LineWidth', 1);
    title('����')
    ma = max(irf(10,:));
    mi = min(irf(10,:));
    r = ma - mi;
    ylim([mi-r/10  ma+r/10  ]);
    yline(0,'-.','LineWidth',1);
   
    subplot(3,2,2);
    plot(T, irf(8, T1), 'LineWidth', 1);
    ma = max(irf(8,:));
    mi = min(irf(8,:));
    r = ma - mi;
    ylim([mi-r/10  ma+r/10  ]);
    yline(0,'-.','LineWidth',1);
    title('��ҵ');
    
    subplot(3,2,3);
    plot(T, irf(9, T1),'LineWidth', 1);
    ma = max(irf(9,:));
    mi = min(irf(9,:));
    r = ma - mi;
    ylim([mi-r/10  ma+r/10  ]);
    yline(0,'-.','LineWidth',1);
    title('ʵ������');
    
    subplot(3,2,4);
    plot(T, irf(4,T1),'LineWidth', 1);
    ma = max(irf(4,:));
    mi = min(irf(4,:));
    r = ma - mi;
    ylim([mi-r/10  ma+r/10  ]);
    yline(0,'-.','LineWidth',1);
    title('��������');
    
    subplot(3,2,5);
    plot(T, irf(5,T1),'LineWidth', 1);
    ma = max(irf(5,:));
    mi = min(irf(5,:));
    r = ma - mi;
    ylim([mi-r/10  ma+r/10  ]);
    yline(0,'-.','LineWidth',1);
    title('ͨ��������');
    
    subplot(3,2,6);
    plot(T, irf(2,T1), 'LineWidth', 1);
    ma = max(irf(2,:));
    mi = min(irf(2,:));
    r = ma - mi;
    ylim([mi-r/10  ma+r/10  ]);
    yline(0,'-.','LineWidth',1);
    title('ʵ�ʻ��Ҵ���');
    
    %name = ;
    print(f1, ['figure',num2str(num)], '-depsc');
    state = 0;
end

