function [x]=crout(a,b)
    n=size(a,1)
    l=zeros(n,n)
    u=eye(n,n)
    
    for i=1:n,
        l(i,1)=a(i,1);
    end
    for i=2:n,
        u(1,i)=a(1,i)/l(1,1);
    end
    for k=2:n-1,
        for j=k:n,
            y=0;
            for s=1:k-1,
                y=y+l(j,s)*u(s,k);
            end
            l(j,k)=a(j,k)-y;
            for p=k:n-1,
                z=0;
                for q=p+1:n,
                    z=z+l(p,s)*u(s,q);
                    u(p,q)=1/l(p,p)*(a(p,q)-z);
                end
            end
        end
    end
    w=0;
    for s=1:n-1,
        w=w+l(n,s)*u(s,n);
    end
    l(n,n)=a(n,n)-w;
    y=l\b;
    x=u\y;
endfunction
