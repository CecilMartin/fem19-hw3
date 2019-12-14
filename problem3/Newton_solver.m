function [u0,iter,u_hat]=Newton_solver(u0,A1,A2,lambda,miu,eps,max_iter)
N = round((length(u0)+1)/2);
u_hat = Newton_update(u0,A1,A2,lambda);
u0 = u0 + miu*u_hat;
iter = 1;
while norm(u_hat)*sqrt(1/(2*N))>eps && iter<max_iter
    u_hat = Newton_update(u0,A1,A2,lambda);
    u0 = u0 + miu*u_hat;
    iter = iter + 1;
end
    

