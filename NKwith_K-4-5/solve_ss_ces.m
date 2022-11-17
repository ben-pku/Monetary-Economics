function [ss] = solve_ss_ces(para)
    %% SOLVE_SS with CES product function
    global ss
    global para
    ss.z = para.ss_z;  
    ss.i = 1/para.beta -1;
    ss.r = ss.i+para.sigma; % ss real interest rate
    ss.phi = (para.theta-1)/para.theta;
    in = para.sigma1/(para.sigma1 - 1);
    ss.w =   ( (ss.phi^in - para.alpha^(1/(1-para.sigma1))*ss.r^in ) / (1-para.alpha)^(1/(1-para.sigma1)) ) ^(1/in);
    ou = (para.alpha/(1-para.alpha) )^(1/(para.sigma1-1)) * ( ss.w/(ss.z*ss.r) )^in;
    ss.l = 1/(1+ ou);
    

    ix=[1.2;1.9;2;1.8];
    solu = fsolve(@F2,ix);
    
    % newton method    
%     solu = newton(ix, @F1, @dF1, ss, para );
    
    ss.n = solu(1);
    ss.k = solu(2);
    ss.c = solu(3);
    ss.m = solu(4);
    
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

