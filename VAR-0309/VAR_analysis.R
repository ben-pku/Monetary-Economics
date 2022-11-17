library(vars)
library(tseries)
library(mFilter)

# data preprocessing
us_data = na.omit(read.csv(file = 'C:/Users/Benjamin Hwang/Documents/大三_上/新结构货币经济学/data/US_9_vars.csv'))
data_vals = us_data[, 2:ncol(us_data)]
num_vars = ncol(data_vals) #num of variables
ts_data = ts(data_vals, start = c(1981, 1), frequency = 4)
var_names = colnames(ts_data)

# plot data
par(mfrow = c(3, 3), mar=c(3, 3, 2, 2))
for(i in 1:9){
  plot(ts_data[, i], type = "l")
  title(var_names[i])
}

### need to HP filter some variables
#filtered_data = hpfilter(ts_data[,1], freq = 1600, type = "lambda")$cycle

# VAR estimation
var_est = VAR(ts_data, p = 4, type = "none")

# SVAR estimation
b = diag(1, num_vars)
b[lower.tri(b)] = NA
svar_est = SVAR(var_est, Bmat = b, max.iter = 1000)

# impulse response
irf_result = irf(svar_est, impulse = "Fed.rate", n.ahead = 20, boot = FALSE)

# impulse response plot
par(mfrow = c(3, 3), mar=c(3, 3, 2, 2))
for(i in 1:9){
  plot(0:20, irf_result$irf$Fed.rate[, i], type = "l")
  title(var_names[i])
}

# monetary shock
resid = residuals(var_est)
struct_shock = resid %*% t(svar_est$B)
par(mfrow = c(1, 1))
plot(struct_shock[, 7], type = "l")

# ADF test -- test for stationary
for(i in 1:9){
  print(adf.test(ts_data[, i])$p.value)
}
# all variables are not reject for unit root except for the last
# but still decide to keep Fed.rate as stationary

# difference data -- 差分后再观察
diff_data = ts_data[2:nrow(ts_data),]
diff_data[, c(1:6, 8)] = diff(ts_data[, c(1:6, 8)])

# plot difference data
par(mfrow = c(3, 3), mar=c(3, 3, 2, 2))
for(i in 1:9){
  plot(diff_data[, i], type = "l")
  title(var_names[i])
}

# ADF test for differenced series
for(i in 1:9){
  print(adf.test(diff_data[, i])$p.value)
}
# except for Fed.rate, GDP deflator is not rejected for unit root
# however, since it is already inflation rate, we keep it as stationary

# reconduct the SVAR exercise with difference series
# VAR estimation
var_est_diff = VAR(diff_data[1:156,], p = 4, type = "none")
# SVAR estimation
b = diag(1, num_vars)
b[lower.tri(b)] = NA
svar_est_diff = SVAR(var_est_diff, Bmat = b, max.iter = 1000)
# impulse response
irf_result_diff = irf(svar_est_diff, impulse = "Fed.rate", n.ahead = 20, boot = FALSE)
# impulse response plot
par(mfrow = c(3, 3), mar=c(3, 3, 2, 2))
for(i in 1:9){
  plot(0:20, irf_result_diff$irf$Fed.rate[, i], type = "l")
  title(var_names[i])
}

