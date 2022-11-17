function [ss] = solve_ss(para)
    %% SOLVE_SS CD production function
    global ss
    global para
    ss.z = para.ss_z;  
    ss.i = 1/para.beta -1;
    ss.r = ss.i+para.sigma; % ss real interest rate
    ss.phi = (para.theta-1)/para.theta;
    ss.w = ss.phi* para.alpha^para.alpha * (1-para.alpha)^(1-para.alpha);
    

    ix=[1;1;1;1];
    solu = fsolve(@F1,ix);
    
    ss.n = solu(1);
    ss.k = solu(2);
    ss.c = solu(3);
    ss.m = solu(4);
%     fprintf("newton method fails!\n try the next method \n")
    
    %% 
%     l = ss.w*para.alpha/(ss.r*(1-para.alpha) );
%     ss.n = ( ss.w/para.chi * (ss.z*l^para.alpha)^(-para.sigma)   )^(1/(para.eta+para.sigma)); %7 & 4.3
%     ss.c = (ss.w/(para.chi*ss.n^para.eta)   )^(1/para.sigma); %4.3
%     ss.k = ss.c/ss.z*l^(1-para.alpha) ;% 8
%     ss.m = ( para.gamma*ss.c^para.sigma*(1+ss.i)/ss.i) ^para.b;%4.2
   
    ss.s = para.delta* ss.k;
    ss.y = ss.c+ss.s;
       
%     %% display some parametes
%     fprintf('Steady state real interest rate is %.3f \n', ss.r)
%     fprintf('Steady state employment rate is %.3f\n', ss.n)
%     fprintf('Steady state output-capital ratio is %.3f \n', ss.y/ss.k)
%     fprintf('Steady state consumption-capital ratio is %.3f \n', ss.c/ss.k)
%     fprintf('Steady state money-capital ratio is %.3f \n', ss.m/ss.k)
%     fprintf('Steady state saving rate is %.3f \n', ss.s/ss.y)
%     fprintf('Steady state marginal cost, /phi, is %.3f\n', ss.phi)
    
end

