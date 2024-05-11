function printMatrices(A, B, decimal)

    if nargin < 3
        decimal = 8; 
    end

    fprintf('Matrix A to %d decimal places: \n', decimal)
    fprintf('\n');
    [n_rows_A, n_cols_A] = size(A);
    for i = 1:n_rows_A
        for j = 1:n_cols_A
            fprintf('%*.*f ', decimal+3, decimal, A(i,j));
        end
        fprintf('\n');
    end
    fprintf('\n');

    fprintf('Matrix B to %d decimal places: \n', decimal)
    fprintf('\n');
    [n_rows_B, n_cols_B] = size(B);
    for i = 1:n_rows_B
        for j = 1:n_cols_B
            fprintf('%*.*f ', decimal+3, decimal, B(i,j));
        end
        fprintf('\n');
    end
end
