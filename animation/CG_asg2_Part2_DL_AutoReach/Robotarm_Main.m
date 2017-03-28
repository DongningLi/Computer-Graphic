clc;
clear all;
close all;

hold on;

%target setting
 randnum1=-5+10*rand(); 
 randnum2=-10+10*rand(); 
 randnum3=15+5*rand(); 

target = [randnum1,randnum2,randnum3];
lambda = 1;
Part = arm ();

% Draw the kinematic chain at an initial position
theta = [0 0 0 0 0 0 0 0 0];
figure (1);
base(2);

IniGoal( Part, theta(4), theta(5), theta(6), theta(7), theta(8), theta(9), target);

GoalReached = false;

while ~GoalReached; 
    % Calculate next step using gradient descent 
    
    theta = theta - lambda * Grad( Part, theta, target);
  
    % Plot particle at new location 
    endpoint = IniGoal( Part, theta(4), theta(5), theta(6), theta(7), theta(8), theta(9), target);
    
    % Pause for a moment so we can see the motion
    pause( .1 );               
    
    % prepare for avi file
    drawnow;
    
    % Check if goal has been reached, i.e., distance 
    % between current and goal locations is less than a 
    % pre-defined threshold. 
    if ( norm( endpoint - target ) <= 1) 
        GoalReached = true;
    end
end

hold off;