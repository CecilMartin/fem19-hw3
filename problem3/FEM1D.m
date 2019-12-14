%FEM1D
clear all
close all
clc
set(0,'defaulttextinterpreter','latex')
set(0,'defaultAxesFontName', 'Times New Roman')
set(0,'DefaultAxesFontSize',22)
set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
set(groot, 'defaultLegendInterpreter','latex');
figure(1);
box on
hold on
line_spec = {'-.',':','--','-'};
color_spec=get(gca,'colororder');

% Initialisation
lambda = 2;
miu = 1;
eps = 1e-12;
max_iter=1000;
u0_fun=@(x) zeros(size(x));
% u0_fun=@(x) 14*x.*(1-x);
N_rec=[8,16,32];
error=zeros(1,length(N_rec));
for i=1:length(N_rec)
    N=N_rec(i);L=1;h=L/N;
    coordinates = coordinates_gen(N,h);
    u0 = u0_fun(coordinates);
    % Assembly
    A1 = stiffmat_A1(N,h);
    A2 = stiffmat_A2(N,h);
    
    % Newton Method
    [u,iter,u_hat]=Newton_solver(u0,A1,A2,lambda,miu,eps,max_iter);
    u = -u;
    iter
    norm(u_hat)*sqrt(1/(2*N))
    
    % graphic representation
    plot(coordinates,u,line_spec{i},'Color',color_spec(i,:),'DisplayName',['N=',num2str(N)]);
    
    % error
    [u_real_1,u_real_2] = analytic_sol(coordinates);
    error(i)=norm(u-u_real_1)/norm(analytic_sol(coordinates));
end
[u_real_1,u_real_2] = analytic_sol(coordinates);
plot(coordinates,u_real_1,line_spec{i+1},'Color',color_spec(i+1,:),'LineWidth',1,'DisplayName','Analytic soln 1');
plot(coordinates,u_real_2,line_spec{i+1},'Color',color_spec(i+2,:),'LineWidth',1,'DisplayName','Analytic soln 2');
legend show
legend('Location','best')

% figure(2)
% box on;
% hold on;
% plot(N_rec,error,[line_spec{1},'o'],'linewidth',2,'Color',color_spec(1,:))
% % plot(periodic_rec(1:end-1),(periodic_rec(1:end-1)/periodic_rec(end-1)).^(-4)*error(end),...
% %     [line_spec{2}],'linewidth',1,'Color',color_spec(2,:))
% % plot(periodic_rec(1:end-1),(periodic_rec(1:end-1)/periodic_rec(end-1)).^(-3)*error(end),...
% %     [line_spec{3}],'linewidth',1,'Color',color_spec(3,:))
% set(gca,'XScale','log','YScale','log')
% xlabel('Periodic boxes')
% ylabel('Relative Error in $L_2$')
% legend('Emphirical error','4th order','3rd order','Location','best')
