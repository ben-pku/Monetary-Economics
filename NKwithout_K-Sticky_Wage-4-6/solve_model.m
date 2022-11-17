function [G1, impact] = solve_model(para)
    %SOLVE_MODEL 
    %obtain G1, impact

    %% AR(1)
    %% Rational Expectations dynamics --
    [A_1, A_2, A_3, A_4] = model_setup(para);
    
    % solve it
    [G1,C,impact,fmat,fwt,ywt,gev,eu,loose]=gensys(A_1,A_2,zeros(7, 0),A_3,A_4);
    fprintf('MODEL AR: \n')
    if isequal(eu,[1;1])
        fprintf('Solution exists and is unique. \n')
    else
        disp(eu);
    end

    
end

