function [G1, impact,ss] = solve_model_ces(para)
    %SOLVE_MODEL  with CES production function
    %obtain G1, impact
    %% steady state
    [ss,para] = solve_ss_ces(para);

    %% Rational Expectations dynamics
    [A_1, A_2, A_3, A_4] = model_setup_ces(para, ss);
    
    %% solve it
    [G1,C,impact,fmat,fwt,ywt,gev,eu,loose]=gensys(A_1,A_2,zeros(13, 0),A_3,A_4);
    if isequal(eu,[1;1])
        fprintf('Solution exists and is unique. \n')
    else
        disp(eu);
    end
end

