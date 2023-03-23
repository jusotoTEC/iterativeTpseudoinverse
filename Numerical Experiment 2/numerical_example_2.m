% Numerical Experiment 2

% Reference: 
%   Paper   = Convergence analysis of iterative methods for computing the 
%             T-pseudoinverse of complete full-rank third-order tensors 
%             based on the T-product. (Submitted paper - 2023)
%   Authors = Soto-Quiros, Pablo

clc; clear; close all

%%% Part 1: Load source and noisy image %%%

% Load source image
A=im2double(imread('source_image.jpg'));
subplot(1,4,1)
imshow(A)
title('Source Image')
% Load nosiy image
B=im2double(imread('noisy_image.jpg'));
subplot(1,4,2)
imshow(B)
title('Noisy image')


%%% Part 2: Clean noisy image using t-pseudoinverse

[m,n,p]=size(A);

% Compute t-pseudoinverse using TPINV
Bp=tpinv(B);

% Reconstruction of image
F1=tprod(A,Bp);
A_rec1=tprod(F1,B);
errorTPINV=(1/(m*n*p))*tFrobNorm(A-A_rec1)^2;
subplot(1,4,3)
imshow(im2uint8(A_rec1))
title('Reconstruction with TPINV')
xlabel(['MSE = ',num2str(errorTPINV)])

%%% Part 2: Clean noisy image using iterative method

% Compute t-pseudoinverse using iterative method

iterMax=1000; tol=1e-1;
Bt=tCTranspose(B);
BBt=tprod(B,Bt);
alpha=tNorm2(BBt);
X=(1/alpha^2)*BBt;
I=tEye(m,p);
er=[];

for k=1:iterMax            
    P1=tprod(BBt,X);    
    P2=tprod(P1,P1);    
    X=tprod(X,3*I-3*P1+P2); 
    Sp=tprod(Bt,X);
    
    %Compute Error 
    e1=tNorm2(tprod(tprod(B,Sp),B)-B); 
    
    disp(['Iteration = ', num2str(k), ' and error = ', num2str(e1)]);
    
    er=[er e1];
    if e1<tol
        break
    end
end

% Reconstruction of image
F2=tprod(A,Sp);
A_rec2=tprod(F2,B);
errorITERATIVE=(1/(m*n*p))*tFrobNorm(A-A_rec2)^2;
subplot(1,4,4)
imshow(im2uint8(A_rec2))
title('Reconstruction with Iterative Method')
xlabel(['MSE = ',num2str(errorITERATIVE)])