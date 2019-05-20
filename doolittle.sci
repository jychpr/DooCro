function [x]=doolittle(a,b)
    n=size(a,1)
    l=eye(n,n)
    u=zeros(n,n)
    
    for i=1:n,
        u(1,i)=a(1,i);
    end
    for i=2:n,
        l(i,1)=a(i,1)/u(1,1);
    end
    for j=2:n-1,
        for k=j:n,
            y=0;
            for s=1:j-1,
                y=y+l(j,s)*u(s,k);
            end
            u(j,k)=a(j,k)-y;
            for q=j:n-1,
                z=0;
                for p=q+1:n,
                    z=z+l(p,s)*u(s,q);
                    l(p,q)=1/u(q,q)*(a(p,q)-z);
                end
            end
        end
    end
    w=0;
    for s=1:n-1,
        w=w+l(n,s)*u(s,n);
    end
    u(n,n)=a(n,n)-w;
    y=l\b;
    x=u\y;
endfunction
