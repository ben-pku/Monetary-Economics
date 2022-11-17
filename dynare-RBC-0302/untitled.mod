

// RBC example
// panda10232

// Declare the endogenous variables
var c y lab k a r;

// Declare the exogenous variables
varexo eps_a;

// Declare the parameters of the model
parameters beta, rho, theta, delta, alpha, yk_ss, r_ss, ck_ss, sig_a;

// Declare the parameter values
beta = 0.99;
alpha = 0.33;
rho = 0.7;
theta = 0.5;
delta = 0.05;
r_ss  = 1/beta;
yk_ss = (r_ss - (1-delta))/alpha;
ck_ss = yk_ss - delta;
sig_a = 1;

model(linear);

0 = theta*(c - c(+1)) + r(+1) ; //Euler equation

0 = -theta*c + y - lab; //Labour supply

r_ss* r = alpha * yk_ss * (y - k(-1)) ; //Interest rates

y = a + alpha * k + (1-alpha)*lab ; //Production function

k = yk_ss * y - ck_ss * c + (1-delta) * k(-1) ; //Resource constraint

a = rho * a(-1) + eps_a ; // TFP shock

end;

initval;
eps_a = 0;
a = 0;
y = 0;
lab = 0;
k = 0;
c = 0;
r = 0;
end;

steady;

check;

shocks;
var eps_a = sig_a^2;
end;

stoch_simul(irf=16);