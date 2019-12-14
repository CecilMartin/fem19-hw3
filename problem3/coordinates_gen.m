function coor=coordinates_gen(N,h)
if mod(N,2)~=0
    error('N must be even!');
end
coor=zeros(2*N-1,1);
even_index=linspace(2,2*N-2,N-1)';
odd_index=linspace(1,2*N-1,N)';
coor(even_index)=linspace(1,N-1,N-1)'*h;
coor(odd_index)=(linspace(0,N-1,N)'+1/2)*h;
end
