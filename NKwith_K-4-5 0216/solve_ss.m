function [ss, para] = solve_ss(para)
    %% SOLVE_SS CD production function
    ss.z = para.ss_z;  
    ss.i = 1/para.beta -1;
    ss.n = para.ss_n;
    ss.r = ss.i+para.sigma; % ss real interest rate
    ss.phi = (para.theta-1)/para.theta;
    ss.w = (ss.phi* para.alpha^para.alpha * (1-para.alpha)^(1-para.alpha) /ss.r^para.alpha )^ (1/(1-para.alpha));
    
    ss.y = ( ss.w/ss.r * para.alpha/(1-para.alpha) )^para.alpha;
    ss.k =  ss.w/ss.r * para.alpha/(1-para.alpha);
    ss.s = para.delta* ss.k;
    ss.c = ss.y-ss.s;
    para.chi = ss.w/ ss.c^para.sigma;
    
end

