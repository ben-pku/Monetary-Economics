function [G1, impact] = solve_simple_model(para)
    %% Steady state
    ss = steadystate(para);
    
    %% Dynamics
    [A_1, A_2, A_3, A_4] = simple_model_setup(para, ss);
    
    %% Solving RE model
    [G1,C,impact,fmat,fwt,ywt,gev,eu,loose]=gensys(...
        A_1,A_2,zeros(8, 0),A_3,A_4);
    if isequal(eu, [1; 1])
        fprintf('Solution exists and is unique \n')
    else
        disp(eu);
    end    
end