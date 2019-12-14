function u_hat = Newton_update(u,A1,A2,lambda)
LHS = A1 + lambda * A2 * diag(exp(u));
RHS = -A1*u-lambda * A2*exp(u);
u_hat = LHS \ RHS;
end


