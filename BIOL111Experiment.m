
%{
%% Raffles 

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
boxplot([data_lettucegroup_lettuce.',data_lettucegroup_cucumber.'],'Labels',{'Cabbage','Cucumber'})
title('Consumption of vegetables for a 24 hour period for Cabbage Group','FontSize', 18)
xlabel('Food type')
ylabel('Amount consumed (gram)')

ax = gca
ax.XAxis.FontSize = 18;
ax.YAxis.FontSize = 18;

figure
boxplot([data_cucumbergroup_lettuce.',data_cucumbergroup_cucumber.'],'Labels',{'Cabbage','Cucumber'})
title('Consumption of vegetables for a 24 hour period for Cucumber Group','FontSize', 18)
xlabel('Food type')
ylabel('Amount consumed (gram)')

figure
x = [data_mixedgroup_lettuce.';data_mixedgroup_cucumber.'];
g1 = repmat({'Cabbage'},3,1);
g2 = repmat({'Cucumber'},4,1);
g = [g1; g2];

boxplot(x, g)

ax = gca
ax.XAxis.FontSize = 18;
ax.YAxis.FontSize = 18;

title('Consumption of vegetables for a 24 hour period for Mixed Diet Group','FontSize', 18)
xlabel('Food type')
ylabel('Amount consumed (gram)')

[h_l,sig_l,ci_l] = ttest2(data_lettucegroup_lettuce,data_lettucegroup_cucumber,'Vartype','unequal');
[h_c,sig_c,ci_c] = ttest2(data_cucumbergroup_lettuce,data_cucumbergroup_cucumber,'Vartype','unequal');
[h_m,sig_m,ci_m] = ttest2(data_mixedgroup_lettuce,data_mixedgroup_cucumber,'Vartype','unequal');

ax = gca
ax.XAxis.FontSize = 18;
ax.YAxis.FontSize = 18;

%}

%
%% Camille 

data_lettucegroup_lettuce = 3.75 - [0.39,0.47,0.51,0.45];
data_lettucegroup_cucumber = 3.75 - [0,0.12,0,0];
data_cucumbergroup_lettuce = 3.75 - [0.30,0.45,0.40,0.34];
data_cucumbergroup_cucumber = 3.75 - [0.66,0.76,0.97,0.65];
data_mixedgroup_lettuce = 3.75 - [0.47,0.52,0.56,0.71];
data_mixedgroup_cucumber = 3.75 - [0.49,0.48,0.70,0.60];

mean_data_lettucegroup_lettuce = mean (data_lettucegroup_lettuce);
mean_data_lettucegroup_cucumber = mean(data_lettucegroup_cucumber);

mean_data_cucumbergroup_lettuce = mean (data_cucumbergroup_lettuce);
mean_data_cucumbergroup_cucumber = mean(data_cucumbergroup_cucumber);

mean_data_mixedgroup_lettuce = mean (data_mixedgroup_lettuce);
mean_data_mixedgroup_cucumber = mean (data_mixedgroup_cucumber);


error_data_lettucegroup_lettuce = std (data_lettucegroup_lettuce)/sqrt(numel(data_lettucegroup_lettuce));
error_data_lettucegroup_cucumber = std(data_lettucegroup_cucumber)/sqrt(numel(data_lettucegroup_cucumber));

error_data_cucumbergroup_lettuce = std (data_cucumbergroup_lettuce)/sqrt(numel(data_cucumbergroup_lettuce));
error_data_cucumbergroup_cucumber = std(data_cucumbergroup_cucumber)/sqrt(numel(data_cucumbergroup_cucumber));

error_data_mixedgroup_lettuce = std (data_mixedgroup_lettuce)/sqrt(numel(data_mixedgroup_lettuce));
error_data_mixedgroup_cucumber = std (data_mixedgroup_cucumber)/sqrt(numel(data_mixedgroup_cucumber));

figure
boxplot([data_lettucegroup_lettuce.',data_lettucegroup_cucumber.'],'Labels',{'Cabbage','Cucumber'})
title('Consumption of vegetables for a 24 hour period for Cabbage Group','FontSize', 18)
xlabel('Food type')
ylabel('Amount consumed (gram)')

ax = gca
ax.XAxis.FontSize = 18;
ax.YAxis.FontSize = 18;

figure
boxplot([data_cucumbergroup_lettuce.',data_cucumbergroup_cucumber.'],'Labels',{'Cabbage','Cucumber'})
title('Consumption of vegetables for a 24 hour period for Cucumber Group','FontSize', 18)
xlabel('Food type')
ylabel('Amount consumed (gram)')

ax = gca
ax.XAxis.FontSize = 18;
ax.YAxis.FontSize = 18;

figure
boxplot([data_mixedgroup_lettuce.',data_mixedgroup_cucumber.'],'Labels',{'Cabbage','Cucumber'})
title('Consumption of vegetables for a 24 hour period for Mixed Diet Group','FontSize', 18)
xlabel('Food type')
ylabel('Amount consumed (gram)')

ax = gca
ax.XAxis.FontSize = 18;
ax.YAxis.FontSize = 18;

[h_l,sig_l,ci_l] = ttest2(data_lettucegroup_lettuce,data_lettucegroup_cucumber);
[h_c,sig_c,ci_c] = ttest2(data_cucumbergroup_lettuce,data_cucumbergroup_cucumber);
[h_m,sig_m,ci_m] = ttest2(data_mixedgroup_lettuce,data_mixedgroup_cucumber);


%}
%{
%% Cassia

data_lettucegroup_lettuce = zeros(1,3);
data_lettucegroup_cucumber = [0.9,0.36,1.58];
data_cucumbergroup_lettuce =  zeros(1,3);
data_cucumbergroup_cucumber = [1.38,0.78,1.67];
data_mixedgroup_lettuce = zeros(1,3);
data_mixedgroup_cucumber =  [1.57,0.86,1.84];

mean_data_lettucegroup_lettuce = mean (data_lettucegroup_lettuce);
mean_data_lettucegroup_cucumber = mean(data_lettucegroup_cucumber);

mean_data_cucumbergroup_lettuce = mean (data_cucumbergroup_lettuce);
mean_data_cucumbergroup_cucumber = mean(data_cucumbergroup_cucumber);

mean_data_mixedgroup_lettuce = mean (data_mixedgroup_lettuce);
mean_data_mixedgroup_cucumber = mean (data_mixedgroup_cucumber);


error_data_lettucegroup_lettuce = std (data_lettucegroup_lettuce)/sqrt(numel(data_lettucegroup_lettuce));
error_data_lettucegroup_cucumber = std(data_lettucegroup_cucumber)/sqrt(numel(data_lettucegroup_cucumber));

error_data_cucumbergroup_lettuce = std (data_cucumbergroup_lettuce)/sqrt(numel(data_cucumbergroup_lettuce));
error_data_cucumbergroup_cucumber = std(data_cucumbergroup_cucumber)/sqrt(numel(data_cucumbergroup_cucumber));

error_data_mixedgroup_lettuce = std (data_mixedgroup_lettuce)/sqrt(numel(data_mixedgroup_lettuce));
error_data_mixedgroup_cucumber = std (data_mixedgroup_cucumber)/sqrt(numel(data_mixedgroup_cucumber));

figure
boxplot([data_lettucegroup_lettuce.',data_lettucegroup_cucumber.'],'Labels',{'Carrot','Cucumber'})
title('Consumption of vegetables for a 24 hour period for Carrot Group','FontSize', 18)
xlabel('Food type')
ylabel('Amount consumed (gram)')

ax = gca
ax.XAxis.FontSize = 18;
ax.YAxis.FontSize = 18;

figure
boxplot([data_cucumbergroup_lettuce.',data_cucumbergroup_cucumber.'],'Labels',{'Carrot','Cucumber'})
title('Consumption of vegetables for a 24 hour period for Cucumber Group','FontSize', 18)
xlabel('Food type')
ylabel('Amount consumed (gram)')

ax = gca
ax.XAxis.FontSize = 18;
ax.YAxis.FontSize = 18;

figure
boxplot([data_mixedgroup_lettuce.',data_mixedgroup_cucumber.'],'Labels',{'Carrot','Cucumber'})
title('Consumption of vegetables for a 24 hour period for Mixed Diet Group','FontSize', 18)
xlabel('Food type')
ylabel('Amount consumed (gram)')

ax = gca
ax.XAxis.FontSize = 18;
ax.YAxis.FontSize = 18;

[h_l,sig_l,ci_l] = ttest2(data_lettucegroup_lettuce,data_lettucegroup_cucumber);
[h_c,sig_c,ci_c] = ttest2(data_cucumbergroup_lettuce,data_cucumbergroup_cucumber);
[h_m,sig_m,ci_m] = ttest2(data_mixedgroup_lettuce,data_mixedgroup_cucumber);


%}


