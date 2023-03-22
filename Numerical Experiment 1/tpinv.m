function Xp=tpinv(X)

    % Xp=tpinv(X) computes the tensor pseudoinverse of third-order tensor X
    %
    % Input:
    %       X       -   m*n*p tensor
    % Ouput:
    %       Y       -   n*m*p tensor Y=tensor pseudoinverse of X
    %
    % References:
    % Jin, H., Bai, M., Benítez, J., & Liu, X. (2017). 
    % The generalized inverses of tensors and an application to linear models. 
    % Computers & Mathematics with Applications, 74(3), 385-397.
    %
    % Written by Pablo Soto-Quiros (jusoto@tec.ac.cr)

    [m,n,s]=size(X);
    A=fft(X,[],3);
    B=zeros(n,m,s);
    for j=1:s
        B(:,:,j)=pinv(A(:,:,j));        
    end
    Xp=ifft(B,[],3);

end
