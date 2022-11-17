function [G1, impact] = solve_model(para)
    %SOLVE_MODEL 
    %obtain G1, impact
    %% steady state
    %ss = solve_ss(para);
%     %% Rational Expectations dynamics --1234
%     [A_1, A_2, A_3, A_4] = model_setup1234(para);
%     
%     % solve it
%     [G1,C,impact,fmat,fwt,ywt,gev,eu,loose,Q1,Q2]=gensys(A_1,A_2,zeros(4, 0),A_3,A_4);
%     fprintf('MODEL 1234:\n')
%     if isequal(eu,[1;1])
%         fprintf('Solution exists and is unique. \n')
%     else
%         disp(eu);
%     end

%     %% Rational Expectations dynamics --123
%     [A_1, A_2, A_3, A_4] = model_setup123(para);
%     
%     % solve it
%     [G1,C,impact,fmat,fwt,ywt,gev,eu,loose]=gensys(A_1,A_2,zeros(3, 0),A_3,A_4);
%     fprintf('MODEL 123 iid:\n')
%     if isequal(eu,[1;1])
%         fprintf('Solution exists and is unique. \n')
%     else
%         disp(eu);
%     end
%         %% Rational Expectations dynamics --124
%     [A_1, A_2, A_3, A_4] = model_setup124(para);
%     
%     % solve it
%     [G1,C,impact,fmat,fwt,ywt,gev,eu,loose]=gensys(A_1,A_2,zeros(3, 0),A_3,A_4);
%     fprintf('MODEL 124:\n')
%     if isequal(eu,[1;1])
%         fprintf('Solution exists and is unique. \n')
%     else
%         disp(eu);
%     end
%        %% Rational Expectations dynamics --12
%     [A_1, A_2, A_3, A_4] = model_setup12(para);
%     
%     % solve it
%     [G1,C,impact,fmat,fwt,ywt,gev,eu,loose]=gensys(A_1,A_2,zeros(2, 0),A_3,A_4);
%     fprintf('MODEL 12 iid:\n')
%     if isequal(eu,[1;1])
%         fprintf('Solution exists and is unique. \n')
%     else
%         disp(eu);
%     end
    %% AR(1)
    %% Rational Expectations dynamics --123
    [A_1, A_2, A_3, A_4] = model_setup123AR(para);
    
    % solve it
    [G1,C,impact,fmat,fwt,ywt,gev,eu,loose]=gensys(A_1,A_2,zeros(5, 0),A_3,A_4);
    fprintf('MODEL 123 AR:\n')
    if isequal(eu,[1;1])
        fprintf('Solution exists and is unique. \n')
    else
        disp(eu);
    end
%        %% Rational Expectations dynamics --12
%     [A_1, A_2, A_3, A_4] = model_setup12AR(para);
%     
%     % solve it
%     [G1,C,impact,fmat,fwt,ywt,gev,eu,loose]=gensys(A_1,A_2,zeros(4, 0),A_3,A_4);
%     fprintf('MODEL 12 AR:\n')
%     if isequal(eu,[1;1])
%         fprintf('Solution exists and is unique. \n')
%     else
%         disp(eu);
%     end
    
end

