function A = stiffmat_A1(N,h)
p = 1;
if mod(N,2)~=0
    error('N must be even!');
end
A=zeros(2*N-1,2*N-1);
even_index=linspace(2,2*N-2,N-1)';
odd_index=linspace(1,2*N-1,N)';
for j = 1:N-1
    i=even_index(j);
    A(i,i+1)=-8*p/(3*h);
    A(i,i)=14*p/(3*h);
    if i+2<=2*N-2
        A(i,i+2)=p/(3*h);
    end
end
for j = 1:N
    i=odd_index(j);
    A(i,i)=16*p/(3*h);
    if i+1<=2*N-1
        A(i,i+1)=-8*p/(3*h);
    end
end
A=sparse(A+triu(A,1)');
end
