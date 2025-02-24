function final_sol = Chap3_4(num,iter)

%Input(num) - Number we're approximating square root of

%Input(iter) - Number of Iterations 

%----------------
%Homework 2
%----------------

%Date: 2/23/25

%Problem 4

% Square Root Approximation: x = (x+(a/x)) /2

count = iter; % Initial Count

sol = 10 ; %Initial Guess

final_sol = sol; %Initializing Final Solution

sol_results = zeros(1,iter); %Initilizing Array for Solution Results

sol_results(1) = sol; %Initializing First Solution

n = 2; % Significant Figures

es = (0.5*10^(2-n)); % Stopping Criteria

for i=1:iter
    sol_old = sol;
    
    sol = (sol_old + (num/sol_old))/2;
    if sol ~= 0
        sol_results(i+1) = sol; 
        ea = abs((sol-sol_old)/sol) * 100;
        if ea <= es
            count = (i+1);
            final_sol = sol;
            break
        end
    end
end

sol_results = sol_results(1:count); %Adjusting array based on number of iterative calculations

figure()

plot(linspace(1,count,count),sol_results)
xlabel('Number of Iterations','FontSize',15)
ylabel(sprintf('Approximation for Square Root of: %d', (num)), 'FontSize',15)
title("Divide and Average Method to Find Approximation of Square Root",'FontSize',15)

hold on
plot(linspace(1,count,count),ones(1,count)*sqrt(num),'--')
legend("Approximation of Square Root", "True Value of Square Root",'FontSize',15)
hold off



end

