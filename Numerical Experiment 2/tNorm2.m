function maxi=tNorm2(A)

    p=size(A,3);
    maxi=-1;
    At=fft(A,[],3);
    for k=1:p
        Sk=svd(At(:,:,k));
        SkMax=max(Sk);
        if SkMax>maxi
            maxi=SkMax;
        end
    end 
    
end
