function y = F1(x)
%F1 function to get  n k c m
% y(1) = ss.w/(para.chi* (x(1) )^para.eta ) - x(3)^para.sigma;
% y(2) = ss.i/(1+ss.i) - para.gamma* x(3)^para.sigma/x(4)^para.b;
% y(3) = x(1) - (para.delta*x(2) + x(3) )* ( ss.w/ss.r * para.alpha/(1-para.alpha) )^(-para.alpha);
% y(4) = x(2) - (para.delta*x(2) + x(3) )* ( ss.w/ss.r * para.alpha/(1-para.alpha) )^(1-para.alpha);
global ss para
y(1,1) = ss.w/(para.chi* (x(1) )^para.eta ) - x(3)^para.sigma;
y(2,1) = ss.i/(1+ss.i) - para.gamma* x(3)^para.sigma/x(4)^para.b;
y(3,1) = x(1) - (para.delta*x(2) + x(3) )* ( ss.w/ss.r * para.alpha/(1-para.alpha) )^(-para.alpha);
y(4,1) = x(2) - (para.delta*x(2) + x(3) )* ( ss.w/ss.r * para.alpha/(1-para.alpha) )^(1-para.alpha);
end

