figure; box on; hold on;
error_x = 2.^(linspace(0,length(error)-1,length(error))');
plot(error_x,error(:,2),'-o','LineWidth',1.5,'DisplayName','Prior Error')
set(gca,'XScale','log','YScale','log')
order = log(error(end,2)/error(end-1,2))/log(error_x(end)/error_x(end-1))
plot(error_x,error(end,2)*(error_x/error_x(end)).^-1,'--','DisplayName','1st order')
xlabel('1/h')
ylabel('Error in L_2')
legend show
legend('Location','best')

%%

figure; box on; hold on;
error_x = error(:,1);
plot(error_x,error(:,2),'-o','LineWidth',1.5,'DisplayName','Prior Error')
set(gca,'XScale','log','YScale','log')
order = log(error(end,2)/error(end-1,2))/log(error_x(end)/error_x(end-1))
plot(error_x,error(end,2)*(error_x/error_x(end)).^-0.5,'--','DisplayName','1/2 order')
xlabel('# of elements')
ylabel('Error in L_2')
legend show
legend('Location','best')

%%

figure; box on; hold on;
set(gca,'XScale','log','YScale','log')
for i=1:length(indicator_rec)
    plot(indicator_rec{i},'-o','LineWidth',1.5,'DisplayName','Posteior Error')
end
% xlabel('# of elements')
% ylabel('Error in each')
title('Posterior Error in each Element, sorted descend')
% legend show
% legend('Location','best')