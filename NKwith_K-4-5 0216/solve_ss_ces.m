function [ss, para] = solve_ss_ces(para)
    %% SOLVE_SS with CES product function
    
    ss.z = para.ss_z;  
    ss.i = 1/para.beta -1;
    ss.n = para.ss_n; 
    ss.r = ss.i+para.sigma; % ss real interest rate
    ss.phi = (para.theta-1)/para.theta;
    in = para.sigma1/(para.sigma1 - 1);
    ss.w =   ( (ss.phi^in - para.alpha^(1/(1-para.sigma1))*ss.r^in ) / (1-para.alpha)^(1/(1-para.sigma1)) ) ^(1/in);
    ou = (para.alpha/(1-para.alpha) )^(1/(para.sigma1-1)) * ( ss.w/(ss.z*ss.r) )^in;
    ss.l = 1/(1+ ou);
    
    ss.y = ( (1-para.alpha)/(1-ss.l) )^(1/para.sigma1);
    ss.k = ss.y*(ss.l/para.alpha)^(1/para.sigma1);
    ss.s = para.delta* ss.k;
    ss.c= ss.y-ss.s;
    
    para.chi = ss.w/ss.c^para.sigma;

    
end

