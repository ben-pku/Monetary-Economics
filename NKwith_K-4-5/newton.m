function x=newton(ix,f,df, ss, para)
    maxit=1500;
    x=ix;
    tol=10^(-10);
    for it=1:maxit
        fval = f(x,ss,para);
        fjac = df(x,ss,para);
        x = x - fjac\fval;
        if abs(fval) < tol, return, end
    end
end