function DirichletBoundaryValue = u_d(x)
%U_D   Data on the Dirichlet boundary
%   Y = U_D(X) returns function values at N discrete points  
%   on the Dirichlet boundary. This input data has to be choosen  
%   by the user. X has dimension N x 2 and Y has dimension N x 1.
%
%
%   See also FEM2D, F, and G.
%

%    J. Alberty, C. Carstensen and S. A. Funken  02-11-99
%    File <u_d.m> in $(HOME)/acf/fem2d/
%    This Dirichlet boundary data is used to compute Fig. 3 in 
%    "Remarks around 50 lines of Matlab: Short finite element 
%    implementation"

npt = length(x);
index_1 = (x(:,1)>=-1 & x(:,1)<=0) & x(:,2)==0;
index_2 = (x(:,2)>=0 & x(:,2)<=1) & x(:,1)==1;
assert((length(find(index_1))+length(find(index_2)))==npt);
DirichletBoundaryValue =  zeros(size(x,1),1);
DirichletBoundaryValue(index_1,1)=0;
DirichletBoundaryValue(index_2,1)=500;
end
