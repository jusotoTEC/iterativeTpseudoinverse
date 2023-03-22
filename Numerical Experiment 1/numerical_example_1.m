% Numerical Experiment 1

% Reference: 
%   Paper   = Convergence analysis of iterative methods for computing the 
%             T-pseudoinverse of complete full-rank third-order tensors 
%             based on the T-product. (Submitted paper - 2023)
%   Authors = Soto-Quiros, Pablo

clc; clear; close all

% Part 1: Initial Values

m=250; n=250; p=10; s=2;
A=randn(m,n,p)+1i*randn(m,n,p);

iterMax=1000; tol=1e-8;

% Part 2: Itertaive Methods

if m==n

    % Initial Value
    At=tCTranspose(A);
    alpha=tNorm2(At); X=(1/alpha^2)*At;
    er=[]; 
    % Iterative Methods
    tic
    for k=1:iterMax
        X=formulaIterative(X,A,s);
        er=tNorm2(tprod(tprod(A,X),A)-A);
        if er<tol
            break
        end
    end
    t=toc;
    % Results
    disp(['Iterative method of order s = ', num2str(s)])
    disp(['Iterations k = ', num2str(k)])
    disp(['Error = ', num2str(er)])
    disp(['Time (s) = ', num2str(t)])

elseif m>n
    
    % Initial Value
    At=tCTranspose(A); AAt=tprod(A,At);
    alpha=tNorm2(AAt); X=(1/alpha^2)*AAt;
    er=[]; 
    % Iterative Methods
    tic
    for k=1:iterMax
        X=formulaIterative(X,AAt,s);
        S=tprod(At,X);    
        er=tNorm2(tprod(tprod(A,S),A)-A);
        if er<tol
            break
        end
    end
    t=toc;
    % Results
    disp(['Iterative method of order s = ', num2str(s)])
    disp(['Iterations k = ', num2str(k)])
    disp(['Error = ', num2str(er)])
    disp(['Time (s) = ', num2str(t)])

elseif m<n  
    
    % Initial Value
    At=tCTranspose(A); AtA=tprod(At,A);
    alpha=tNorm2(AtA); X=(1/alpha^2)*AtA;
    er=[]; 
    % Iterative Methods
    tic
    for k=1:iterMax
        X=formulaIterative(X,AtA,s);
        S=tprod(X,At);    
        er=tNorm2(tprod(tprod(A,S),A)-A);
        if er<tol
            break
        end
    end
    t=toc;
    % Results
    disp(['Iterative method of order s = ', num2str(s)])
    disp(['Iterations k = ', num2str(k)])
    disp(['Error = ', num2str(er)])
    disp(['Time (s) = ', num2str(t)])
    
end