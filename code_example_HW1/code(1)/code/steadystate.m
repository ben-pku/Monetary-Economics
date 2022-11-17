function ss = steadystate(para)
    ss.pi = para.ss_theta;
    ss.i = 1/para.beta*(1+para.ss_theta)-1;
    ss.k = (((1+ss.i)/(1+para.ss_theta)+para.delta-1)/...
        para.alpha/para.ss_z)^(1/(para.alpha-1));
    ss.y = para.ss_z*ss.k^para.alpha;     % ss output
    ss.c = ss.y-para.delta*ss.k;
    ss.m = (ss.i/(1+ss.i)*para.ces_a/(1-para.ces_a))^(-1/para.ces_b)*ss.c;
    ss.r = 1/para.beta-1;            % ss real interest rate

    fprintf('Steady state real interest rate is %.3f \n', ss.r)
    fprintf('Steady state output-capital ratio is %.3f \n', ss.y/ss.k)
    fprintf('Steady state consumption-capital ratio is %.3f \n', ss.c/ss.k)
    fprintf('Steady state money-capital ratio is %.3f \n', ss.m/ss.k)

end