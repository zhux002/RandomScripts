close all
figure

n = 100;
times = zeros(1, n); 
times(1) = 0; 

state_vector = zeros(3, n); 
initial_state = [99, 10, 0];
state_vector(:,1) =  initial_state';

beta = 0.01; 
gamma = 0.1; 

a_0 = beta*state_vector(1, 1)*state_vector(2, 1)+ gamma*state_vector(2, 1); 

for i = 2 : n 
    
    times(i) = times(i-1) - log(rand)/(a_0);
    
    if beta*state_vector(1, i-1)*state_vector(2, i-1) > rand*a_0
        
        state_vector(:,i) = state_vector(:,i-1) + [-1, 1, 0]'; 
        
    else 
        
        state_vector(:,i) = state_vector(:,i-1) + [0, -1, 1]'; 
    end
    
    a_0 = beta*state_vector(1, i)*state_vector(2, i) + gamma*state_vector(2, i); 
    
    if state_vector(1, i) == 0 
        break 
    end 
    
    if state_vector(1, i) == 0 
        break 
    end 
    
    
end


time = [0, times(n)]; 

[t,state] = ode45(@(t,state) DeterministicODEs(t,state), time, initial_state); 

plot(times, state_vector(1,:), 'Linewidth', 2,'color','red') 

hold on

plot(times, state_vector(2,:), 'Linewidth', 2, 'color','blue') 

hold on

plot(times, state_vector(3,:), 'Linewidth', 2, 'color','yellow') 
 
hold on

plot(t, state(:,1),'--', 'Linewidth', 2, 'color','red') 

hold on 

plot(t, state(:,2), '--', 'Linewidth', 2, 'color','blue') 

hold on 

plot(t, state(:,3), '--', 'Linewidth', 2, 'color','yellow') 

xlabel('Time(days)', 'Fontsize', 18);
ylabel('Population Size', 'Fontsize', 18);
str = ['Population Evolution as a Function of Time for \beta = ',num2str(beta), ...
    ', \gamma = ', num2str(gamma), ', S = ', num2str(initial_state(1))];
title(str, 'Fontsize', 18);
legend('Susceptible (stochastic)', 'Infected (stochastic)', 'Recovered (stochastic)', ...
    'Susceptible (Deterministic)', 'Infected (Deterministic)', 'Recovered (Deterministic)');
 
 
function d_state_dt = DeterministicODEs(t, state) 

beta = 0.01;  
gamma = 0.1; 

d_state_dt = zeros(3,1); 
d_state_dt(1) = -beta*state(2)*state(1); 
d_state_dt(2) = beta*state(2)*state(1) - gamma*state(2); 
d_state_dt(3) = gamma*state(2);

end



