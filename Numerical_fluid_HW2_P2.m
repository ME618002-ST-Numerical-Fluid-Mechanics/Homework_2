%% Question 2
% Maclaurin series expansion for cosx for estimate cos(pi/3)
% with stopping error criterion 
clc; clear; close all


% Inputs: x - angle in radians, Sigfigs - Stopping criterion sig figs
x = input('Enter the angle in radians: ');
SigFigs = input('Enter the number of significant figures: ');

% true value of cos(x)
TrueValue = cos(x);

% Initializing 
CurrentApproximation = 0;
PreviousApproximation = 0;
n = 0; % term number - 1

% 2 significant figure error stopping criterion
Estop = 0.5 * 10^(2 - SigFigs);

while true 
    term  = ((-1)^n * x^(2*n))  / factorial(2*n);

    % Update approximation
    CurrentApproximation = CurrentApproximation + term;

    % Computation of Errors 
    TrueError = abs((TrueValue -  CurrentApproximation) / TrueValue) *  100;
    if n > 0 
        ApproximateError = abs((CurrentApproximation - PreviousApproximation) / CurrentApproximation) * 100;
    else
        ApproximateError = NaN; % Since there no previous term when n =  0
    end

    % Stopping condition which determines if stopping criterion is met  
    if n > 0 && ApproximateError < Estop
        break
    end

    % Storing previous approximation and increasing term number
    PreviousApproximation = CurrentApproximation;
    n = n + 1;
end

% Outputs:
% CurrentApproximation - final computed approximate value
% Iterations - number of terms before stopping
Iterations = n + 1; % Storing Iteration Number
fprintf('\nFinal Approximation: %.6f\n', CurrentApproximation);
fprintf('Approximate Error: %.6f\n', ApproximateError);
fprintf('Stopping Criterion Error: %.6f\n', Estop);
fprintf('Total Iterations: %d\n', Iterations);
