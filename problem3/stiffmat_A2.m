function A = stiffmat_A2(N,h)
q = 1;
if mod(N,2)~=0
    error('N must be even!');
end
A=zeros(2*N-1,2*N-1);
even_index=linspace(2,2*N-2,N-1)';
odd_index=linspace(1,2*N-1,N)';
for j = 1:N-1
    i=even_index(j);
    A(i,i+1)=1/15*h*q;
    A(i,i)=16/15*h*q;
    if i+2<=2*N-2
        A(i,i+2)=-1/30*q*h;
    end
end
for j = 1:N
    i=odd_index(j);
    A(i,i)=8/15*q*h;
    if i+1<=2*N-1
        A(i,i+1)=1/15*q*h;
    end
end
A=sparse(A+triu(A,1)');
end
