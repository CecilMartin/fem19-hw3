function [u1,u2] = analytic_sol(x)
omega1 = 2.3575510538774020425939799885899;
omega2 = 8.5071995707130261295811297868289;
f = @(x,omega) -2*log(cosh((x-0.5)*omega/2)/cosh(omega/4));
u1 = f(x,omega1);
u2 = f(x,omega2);
end
