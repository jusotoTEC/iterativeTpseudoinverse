function x=tFrobNorm(A)

    s=size(A,3);
    x=0;
    for k=1:s
        x=x+norm(A(:,:,k),'fro')^2;
    end
    x=sqrt(x);

end