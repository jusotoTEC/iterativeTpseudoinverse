function Z=formulaIterative(X,A,s)

    m=size(A,1); p=size(A,3);
    Aux=tEye(m,p);
    S=nchoosek(s,1)*Aux;
    ApX=tprod(A,X);
    for r=2:s
        const=(-1)^(r-1)*nchoosek(s,r);
        Aux=tprod(Aux,ApX);
        S=S+const*Aux;
    end
    Z=tprod(X,S);

end