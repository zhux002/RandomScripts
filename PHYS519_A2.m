% initialization 
n = 200;
times = zeros(1, n); 
times(1) = 0; 

state_vector = zeros(3, n); 
initial_state = [90, 10, 0];
state_vector(:,1) =  initial_state';

%beta = 0.01; 
%beta = 0.5; 
beta = 0.005; 

gamma = 0.1; 

a_0 = beta*state_vector(1, 1)*state_vector(2, 1)+ gamma*state_vector(2, 1); 

for i = 2 : n 
    
    % generate a wait time from a uniform pdf
    times(i) = times(i-1) - log(rand)/(a_0);
    
    % pick which reaction to do 
    if beta*state_vector(1, i-1)*state_vector(2, i-1) < rand*a_0
        
        state_vector(:,i) = state_vector(:,i-1) + [0, -1, 1]'; 
        
    else 
        state_vector(:,i) = state_vector(:,i-1) + [-1, 1, 0]'; 
    end
    
    % update the sum of propensities
    a_0 = beta*state_vector(1, i)*state_vector(2, i) + gamma*state_vector(2, i); 
    
    % all susceptible individuals got infected and 
    % all infected individuals recovered
    if state_vector(3, i) == sum(initial_state)
        break 
    end   
end

non_zero_time_indices = find(times);

time = [0 times(non_zero_time_indices(end))]; 

% numerically solve the system of ODEs

[t,state] = ode45(@(t,state) DeterministicODEs(t,state), time, initial_state); 

plot(times(1:non_zero_time_indices(end)), state_vector(1,1:non_zero_time_indices(end))/sum(initial_state), ...
    'Linewidth', 2,'color','red') 

hold on

plot(times(1:non_zero_time_indices(end)), state_vector(2,1:non_zero_time_indices(end))/sum(initial_state), ...
    'Linewidth', 2,'color','blue') 

hold on

plot(times(1:non_zero_time_indices(end)), state_vector(3,1:non_zero_time_indices(end))/sum(initial_state), ...
    'Linewidth', 2,'color','black') 

hold on

plot(t, state(:,1)/sum(initial_state),'--', 'Linewidth', 2, 'color','red') 

hold on 

plot(t, state(:,2)/sum(initial_state), '--', 'Linewidth', 2, 'color','blue') 

hold on 

plot(t, state(:,3)/sum(initial_state), '--', 'Linewidth', 2, 'color','black') 

% plot(log10(times), state_vector(1,:), 'Linewidth', 2,'color','red') 
% 
% hold on
% 
% plot(log(times), state_vector(2,:), 'Linewidth', 2, 'color','blue') 
% 
% hold on
% 
% plot(log10(times), state_vector(3,:), 'Linewidth', 2, 'color','black') 
%  
% hold on
% 
% plot(log10(t), state(:,1),'--', 'Linewidth', 2, 'color','red') 
% 
% hold on 
% 
% plot(log10(t), state(:,2), '--', 'Linewidth', 2, 'color','blue') 
% 
% hold on 
% 
% plot(log10(t), state(:,3), '--', 'Linewidth', 2, 'color','black') 

xlabel('Time (days)', 'Fontsize', 18);
ylabel('Fraction of the Total Population', 'Fontsize', 18);
str = 'Fraction of the Total Population as a Function of Time';
sub_str = [' \beta = ',num2str(beta), ...
    ', \gamma = ', num2str(gamma), ', S = ', num2str(initial_state(1))];
title({str;sub_str}, 'Fontsize', 18);
legend('Susceptible (stochastic)', 'Infected (stochastic)', 'Recovered (stochastic)', ...
    'Susceptible (Deterministic)', 'Infected (Deterministic)', 'Recovered (Deterministic)');

% Define the system of ODEs outside the solver

function d_state_dt = DeterministicODEs(t, state) 

%beta = 0.01;  
%beta = 0.5; 
beta = 0.005; 

gamma = 0.1; 

d_state_dt = zeros(3,1); 
d_state_dt(1) = -beta*state(2)*state(1); 
d_state_dt(2) = beta*state(2)*state(1) - gamma*state(2); 
d_state_dt(3) = gamma*state(2);

end



