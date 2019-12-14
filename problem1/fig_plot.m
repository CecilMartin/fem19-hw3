figure; box on; hold on;
error_x = 2.^(linspace(0,length(error)-1,length(error))');
plot(error_x,error(:,2),'-o','LineWidth',1.5,'DisplayName','Prior Error')
set(gca,'XScale','log','YScale','log')
order = log(error(end,2)/error(end-1,2))/log(error_x(end)/error_x(end-1))
plot(error_x,error(end,2)*(error_x/error_x(end)).^-2,'--','DisplayName','2nd order')
xlabel('1/h')
ylabel('Error in L_2')
legend show
legend('Location','best')