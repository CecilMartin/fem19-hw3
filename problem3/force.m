function b = force(N,h)
if mod(N,2)~=0
    error('N must be even!');
end
b=zeros(2*N-1,1);
even_index=linspace(2,2*N-2,N-1)';
odd_index=linspace(1,2*N-1,N)';

b(even_index(1:(end-1)/2))=1/3*h;
b(even_index((end+1)/2))=0;
b(even_index((end+3)/2:end))=-1/3*h;
b(odd_index(1:end/2))=-2/3*h;
b(odd_index(end/2+1:end))=2/3*h;
b=b*3;
end