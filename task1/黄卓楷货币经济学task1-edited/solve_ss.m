function [ss] = solve_ss(para)
    %% SOLVE_SS
    ss.n = para.ss_n;
    ss.z = para.ss_z;
    ss.theta = para.ss_theta;
    ss.i = (1+ss.theta)/para.beta -1;
    ss.k = ( (1/para.beta+para.delta-1)^(1/(para.alpha-1)))   / (  (para.alpha*ss.z)^(1/(para.alpha-1))  )*ss.n;    
    ss.c = ss.z* ss.k^para.alpha * ss.n^(1-para.alpha) - para.delta*ss.k;
    ss.m = ss.c * ((1-para.ces_a)/para.ces_a * (1+ss.i)/ss.i)^(1/para.ces_b);
    ss.psi = para.ces_a*(1-para.alpha) * (1-ss.n)^para.eta /(ss.n^para.alpha) * ss.c^(-para.ces_b) * ss.z * ss.k^para.alpha...
        * ( para.ces_a*ss.c^(1-para.ces_b) + (1-para.ces_a)*ss.m^(1-para.ces_b)  )^( (para.ces_b-para.phi)/(1-para.ces_b)  )  % the parameter in Utility Func
    ss.pi = ss.theta;
    ss.r = 1/para.beta-1; % ss real interest rate
    ss.y = para.ss_z*ss.k^para.alpha*ss.n^(1-para.alpha); %ss output
       
    %% display some parametes
    fprintf('Steady state real interest rate is %.3f \n', ss.r)
    fprintf('Steady state employment rate is %.3f\n', ss.n)
    fprintf('Steady state output-capital ratio is %.3f \n', ss.y/ss.k)
    fprintf('Steady state consumption-capital ratio is %.3f \n', ss.c/ss.k)
    fprintf('Steady state money-capital ratio is %.3f \n', ss.m/ss.k)
    fprintf('/psi is %.3f\n', ss.psi)
    
end

