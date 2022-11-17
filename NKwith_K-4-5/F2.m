function y = F2(x)
%% F2 CES product function .. obtain the steady state  
% 1 2 3 4
% n k c m
global ss para
y(1,1) = -x(2) + (para.delta*x(2) + x(3) ) * (ss.l/para.alpha)^(1/para.sigma1);
y(1,2) = -x(1) + (para.delta*x(2) + x(3) ) * ((1-ss.l)/(1-para.alpha))^(1/para.sigma1);
y(1,3) = para.chi * x(1)^para.eta * x(3)^para.sigma -ss.w;
y(1,4) = para.gamma* x(3)^para.sigma / x(4)^para.b - ss.i/(1+ss.i);
end

