# Summary of 4 Equivalent Forms and Matrices in 4th Page of Slides

## 1. summary of 4 forms

denote 4 conditions: (1) Phillips;  (2)Dynamics IS; (3)Taylor rule; (4)Real interest rate

(1)(2)(3)(4):

``` matlab
alpha=1/3
MODEL 1234:
     0
     1


 alpha=2/3
MODEL 1234:
     0
     1


 alpha=1/3   phi_x=0
Indeterminacy.  2 loose endog errors.
MODEL 1234:
     0
     0
```

(1)(2)(3):

``` matlab
alpha=1/3
MODEL 123:
Solution exists and is unique. 

 alpha=2/3
MODEL 123:
Solution exists and is unique. 

 alpha=1/3   phi_x=0
Indeterminacy.  2 loose endog errors.
MODEL 123:
     1
     0
```

(1)(2)(4)

```matlab
 alpha=1/3
Indeterminacy.  1 loose endog errors.
Indeterminacy.  0 loose endog errors.
MODEL 124:
     0
     0


 alpha=2/3
Indeterminacy.  1 loose endog errors.
Indeterminacy.  0 loose endog errors.
MODEL 124:
     0
     0


 alpha=1/3   phi_x=0
Indeterminacy.  1 loose endog errors.
Indeterminacy.  0 loose endog errors.
MODEL 124:
     0
     0
```

(1)(2)

``` matlab
alpha=1/3
Indeterminacy.  1 loose endog errors.
Indeterminacy.  0 loose endog errors.
MODEL 12:
     1
     0


 alpha=2/3
Indeterminacy.  1 loose endog errors.
Indeterminacy.  0 loose endog errors.
MODEL 12:
     1
     0


 alpha=1/3   phi_x=0
Indeterminacy.  1 loose endog errors.
Indeterminacy.  0 loose endog errors.
MODEL 12:
     1
     0
```

Thus, through my second checking in detail, the results are not the same as previous. But the problem is still here, which means the four forms are actually equivalent, yet with different results. The (1)(2)(3) model performs best, but not completely perfect. 

## 2 

As your guide, I manage to get those matrices in page 4. At first, I try to understand the SIMS' code to get the matrices, but his methods might be not as good as my methods-- by function $ordqz$-- and then the function $gensys$ now return the $Q_1$ and $Q_2$. 

```matlab
%% get and check the p4 of slides -- Huang Zhuokai
[aa bb qq zz vv]=ordqz(a,b,q,z,'udi');
eigenvalue = eig(aa,bb);
for i=1:n
    if abs(eigenvalue(i)) > 1
        break
    end
end
note = i-1; % non-explosive dim
if note ~=0
    Q1 = q(note,:);
else
    Q1 = 0;
end
if note ~=n
    Q2 = q(n-note,:);
else
    Q2 = 0;
end
```

For the time being, I have no idea about the next step, to verify the subset relationship between range spaces of these matrices. I am looking forward to your guide and the next analysis. 