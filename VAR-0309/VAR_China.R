# Vector Autoregression of CHinese data 
# edited on 3/18/2022 by Zhuokai Huang 
library(vars)
library(tseries)
library(mFilter)
library(ggplot2)

#1. 4 variables VAR
# data process
cn_data = na.omit(read.csv("C:/Users/Benjamin Hwang/Documents/大三_上/新结构货币经济学/data/cn.csv",encoding = 'UTF-8' ) )
data_vals = cn_data[,2:ncol(cn_data)]
num_vars = ncol(data_vals)
ts_data = ts(data_vals,start = c(1993,1), frequency=4 )
var_names = colnames(ts_data)

# plot data
par(mfrow = c(2, 2),mar = c(2, 1.8, 1.7, 1),
    mex = 0.9,cex.axis=0.6,cex.main=0.8,lwd = 0.5)
for(i in 1:4){
  plot(ts_data[, i], type = "l" ,
       ylab="",xlab="",bty="l",xaxt="n", yaxt="n",
       col = "cornflowerblue")
  if (i==1){
    axis(side = 2,at=c(0,10000,20000),labels=c(0,10000,20000),tck=-0.01,lwd=0.5)
  }
  if (i==2){
    axis(side=2,at=seq(from=40,to=90,by=10),labels=seq(from=40,to=90,by=10),tck=-0.01,lwd=0.5)
  }
  if (i==3){
    axis(side=2,at=seq(from=2000,to=14000,by=4000),labels =seq(from=2000,to=14000,by=4000),tck=-0.01,lwd=0.5)
  }
  if (i==4){
    axis(side=2,at=seq(from=20000,to=80000,by=20000),labels =seq(from=20000,to=80000,by=20000),tck=-0.01,lwd=0.5 )
  }
  
  axis(side = 1,at=c(1993:2012),labels=c(1993:2012) , 
       tck=-0.01 ,lwd=0.5)
  title(var_names[i])
}
# 1st order difference
diff_data = ts_data[2:nrow(ts_data),]
diff_data = diff(ts_data,differences = 1) 

# plot difference data
par(mfrow = c(2, 2),mar = c(2, 1.8, 1.7, 1),
    mex = 0.9,cex.axis=0.6,cex.main=0.8,lwd = 0.5)
for(i in 1:4){
  plot(diff_data[, i], type = "l" ,
       ylab="",xlab="",bty="l",xaxt="n", yaxt="n",
       col = "cornflowerblue")

  axis(side = 2,tck=-0.01,lwd=0.5)
  axis(side = 1,at=c(1993:2012),labels=c(1993:2012) , 
       tck=-0.01 ,lwd=0.5)
  title(var_names[i])
}
# 2nd diff M2 
diff_m2 = diff(cn_data$m2, differences =2)
diff_m2 = c(0,diff_m2)
diff_data = cbind(diff_data,diff_m2)
diff_names = colnames(diff_data)
par(mfrow = c(2, 2),mar = c(2, 1.8, 1.7, 1),
    mex = 0.9,cex.axis=0.6,cex.main=0.8,lwd = 0.5)
for(i in 1:4){
  if(i!=4){
    plot(diff_data[, i], type = "l" ,
       ylab="",xlab="",bty="l",xaxt="n", yaxt="n",
       col = "cornflowerblue")
  
  axis(side = 2,tck=-0.01,lwd=0.5)
  axis(side = 1,at=c(1993:2012),labels=c(1993:2012) , 
       tck=-0.01 ,lwd=0.5)
  title(diff_names[i])
  }
  else{
    plot(diff_data[, 5], type = "l" ,
         ylab="",xlab="",bty="l",xaxt="n", yaxt="n",
         col = "cornflowerblue")
    
    axis(side = 2,tck=-0.01,lwd=0.5)
    axis(side = 1,at=c(1993:2012),labels=c(1993:2012) , 
         tck=-0.01 ,lwd=0.5)
    title(diff_names[5])
  }
  
}

# 1. with industry output
data1 <- diff_data[,c(1,2,5)]
num_vars <- 3
data1_names <- colnames(data1)
# var estimation
var_est = VAR(data1, p = 3, type='none')

# SVAR estimation
b = diag(1, num_vars)
b[lower.tri(b)] = NA
svar_est = SVAR(var_est, Bmat = b, max.iter = 1000) #? Convergence not achieved after 1000 iterations

# impulse response
irf_result = irf(svar_est,impulse = "diff_m2", n.ahead = 100, boot = FALSE)

# irf plot
par(mfrow = c(2, 2),mar = c(2, 1.8, 1.7, 1),
    mex = 0.9,cex.axis=0.6,cex.main=0.8,lwd = 0.5)
for (i in 1:3){
  plot(0:100, irf_result$irf$diff_m2[, i], type = "l",
       ylab="",xlab="",bty="l",xaxt="n", yaxt="n",
       col = "cornflowerblue")
  axis(side = 2,tck=-0.01,lwd=0.5)
  axis(side = 1,tck=-0.01 ,lwd=0.5)
  title(data1_names[i])
}

# 2.with gdp
data2 <- diff_data[,c(2,3,5)]
data2_names <- colnames(data2)
numvars <- 3
# var est
var_est <- VAR(data2, p=3,type="none")
# svar est
svar_est <- SVAR(var_est,Bmat = b, max.iter = 1000 )
irf_result <- irf(svar_est,impulse = "diff_m2", n.ahead = 100, boot = FALSE)
# irf plot
par(mfrow = c(2, 2),mar = c(2, 1.8, 1.7, 1),
    mex = 0.9,cex.axis=0.6,cex.main=0.8,lwd = 0.5)
for (i in 1:3){
  plot(0:100, irf_result$irf$diff_m2[, i], type = "l",
       ylab="",xlab="",bty="l",xaxt="n", yaxt="n",
       col = "cornflowerblue")
  axis(side = 2,tck=-0.01,lwd=0.5)
  axis(side = 1,tck=-0.01 ,lwd=0.5)
  title(data2_names[i])
}

# monetary shock -- ??? 
resid = residuals(var_est) 
struct_shock = resid %*% t(svar_est$B)
par(mfrow = c(1, 1))
plot(struct_shock[, 4], type = "l")

# ADF test
for (i in 1:4){
  print(adf.test(diff_data[,i])$p.value)
}




