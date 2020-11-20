data_lettucegroup_lettuce = 3.75 - [3.72,3.03,2.36,3.47];
data_lettucegroup_cucumber = 3.75 - [3.60,2.43,2.72,2.67];
data_cucumbergroup_lettuce = 3.75 - [2.83,1.97,0.95,1.91];
data_cucumbergroup_cucumber = 3.75 - [2.47,2.85,3.44,3.03];
data_mixedgroup_lettuce = 3.75 - [2.85,3.67,2.49];
data_mixedgroup_cucumber = 3.75 - [3.05,2.56,2.95,1.21];

mean_data_lettucegroup_lettuce = mean (data_lettucegroup_lettuce);
mean_data_lettucegroup_cucumber = mean(data_lettucegroup_cucumber);

mean_data_cucumbergroup_lettuce = mean (data_cucumbergroup_lettuce);
mean_data_cucumbergroup_cucumber = mean(data_cucumbergroup_cucumber);

mean_data_mixedgroup_lettuce = std (data_mixedgroup_lettuce);
mean_data_mixedgroup_cucumber = std (data_mixedgroup_cucumber);



error_data_lettucegroup_lettuce = std (data_lettucegroup_lettuce)/sqrt(numel(data_lettucegroup_lettuce));
error_data_lettucegroup_cucumber = std(data_lettucegroup_cucumber)/sqrt(numel(data_lettucegroup_cucumber));

error_data_cucumbergroup_lettuce = std (data_cucumbergroup_lettuce)/sqrt(numel(data_cucumbergroup_lettuce));
error_data_cucumbergroup_cucumber = std(data_cucumbergroup_cucumber)/sqrt(numel(data_cucumbergroup_cucumber));

error_data_mixedgroup_lettuce = std (data_mixedgroup_lettuce)/sqrt(numel(data_mixedgroup_lettuce));
error_data_mixedgroup_cucumber = std (data_mixedgroup_cucumber)/sqrt(numel(data_mixedgroup_cucumber));

% %Lettuce group
% errorbar([2,4],[mean_data_lettucegroup_lettuce,mean_data_lettucegroup_cucumber], ...
%     [ error_data_lettucegroup_lettuce,error_data_lettucegroup_cucumber],'vertical','o');
% 
% xlim([0 6]);
% ylim([0 2.5]);
% 
% title('Lettuce group');
% xlabel('Food source (left: lettuce, right:cucumbers)')
% ylabel('Amount consumed (gram)')
% 
% %Cucumber group
% 
% figure
% 
% errorbar([2,4],[mean_data_cucumbergroup_lettuce,mean_data_cucumbergroup_cucumber], ...
%     [ error_data_cucumbergroup_lettuce,error_data_cucumbergroup_cucumber],'vertical','o');
% 
% xlim([0 6]);
% ylim([0 2.5]);
% 
% title('Cucumber group');
% 
% title('Cucumber group');
% xlabel('Food source (left: lettuce, right:cucumbers)')
% ylabel('Amount consumed (gram)')
% 
% %Mixed group
% 
% figure
% 
% errorbar([2,4],[mean_data_mixedgroup_lettuce,mean_data_mixedgroup_cucumber], ...
%     [ error_data_mixedgroup_lettuce,error_data_mixedgroup_cucumber],'vertical','o');
% 
% xlim([0 6]);
% ylim([0 2.5]);
% 
% title('Mixed group'); 
% 
% title('Mixed group');
% xlabel('Food source (left: lettuce, right:cucumbers)')
% ylabel('Amount consumed (gram)')

figure
boxplot([data_lettucegroup_lettuce.',data_lettucegroup_cucumber.'],'Labels',{'Lettuce','Cucumbers'})
title('Consumption of vegetables for a 24 hour period for Lettuce Group')
xlabel('Food type')
ylabel('Amount consumed (gram)')

figure
boxplot([data_cucumbergroup_lettuce.',data_cucumbergroup_cucumber.'],'Labels',{'Lettuce','Cucumbers'})
title('Consumption of vegetables for a 24 hour period for Cucumber Group')
xlabel('Food type')
ylabel('Amount consumed (gram)')

figure
x = [data_mixedgroup_lettuce.';data_mixedgroup_cucumber.'];
g1 = repmat({'Lettuce'},3,1);
g2 = repmat({'Cucumbers'},4,1);
g = [g1; g2];

boxplot(x, g)

title('Consumption of vegetables for a 24 hour period for Mixed Diet Group')
xlabel('Food type')
ylabel('Amount consumed (gram)')

[h_l,sig_l,ci_l] = ttest2(data_lettucegroup_lettuce,data_lettucegroup_cucumber);
[h_c,sig_c,ci_c] = ttest2(data_cucumbergroup_lettuce,data_cucumbergroup_cucumber);
[h_m,sig_m,ci_m] = ttest2(data_mixedgroup_lettuce,data_mixedgroup_cucumber);


