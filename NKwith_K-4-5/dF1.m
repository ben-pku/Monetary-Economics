function y = dF1(x,ss,para)
%jacob mat of F1 function to get  n k c m
% y(1) = ss.w/(para.chi* (x(1) )^para.eta ) - x(3)^para.sigma;
% y(2) = ss.i/(1+ss.i) - para.gamma* x(3)^para.sigma/x(4)^para.b;
% y(3) = x(1) - (para.sigma*x(2) + x(3) )* ( ss.w/ss.r * para.alpha/(1-para.alpha) )^(-para.alpha);
% y(4) = x(2) - (para.sigma*x(2) + x(3) )* ( ss.w/ss.r * para.alpha/(1-para.alpha) )^(1-para.alpha);
y(1,1) = ss.w/para.chi* x(1)^(-para.eta-1);
y(1,2) = 0;
y(1,3) = -para.sigma*x(3)^(para.sigma-1);
y(1,4) = 0;

y(2,1) = 0;
y(2,2) = 0;
y(2,3) = -para.gamma*para.sigma*x(3)^(para.sigma-1) /x(4)^para.b;
y(2,4) = para.gamma*para.b *x(3)^para.sigma / (x(4)^(para.b+1) );

y(3,1) = 1;
y(3,2) = -para.sigma* ( ss.w/ss.r * para.alpha/(1-para.alpha) )^(-para.alpha);
y(3,3) = - ( ss.w/ss.r * para.alpha/(1-para.alpha) )^(-para.alpha);
y(3,4) = 0;

y(4,1) = 0;
y(4,2) = 1-para.sigma* ( ss.w/ss.r * para.alpha/(1-para.alpha) )^(1-para.alpha);
y(4,3) = -( ss.w/ss.r * para.alpha/(1-para.alpha) )^(1-para.alpha);
y(4,4) = 0;

end

