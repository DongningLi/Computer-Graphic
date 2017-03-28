%%%%%%%%%%%%%%%%%%%%%%%
%                                                                            %
%   Acknowledgement :                                     %
%   Thanks the help from Professor Ribeiro.  %
%                                                                            %
%%%%%%%%%%%%%%%%%%%%%%%

clc;
clear all;
close all;

%constances
n_side = 20;
n_cube = 25;
CONST_R = 1;
lambda = 0.2*CONST_R ;

% This program demonstrates a simple 
% path-planning approach based on 
% minimizing a cost function.
% Particle's initial position
StartPosition = [ -2 -10 0];

% Particle's current position
CurrentPosition = StartPosition;

% This is the goal position.  
GoalPosition = [42 15 0];

% (x,y) coordinates of the centroid of obstacles 
[ObsX,ObsY,ObsZ] = IniGoal();
%Calcualte the position of edges
oedg = [];
for i = 1:n_cube
    for j = 1:n_side
        oedgplus= [ObsX(i, j, 1) ObsY(i,j,1) ObsZ(i,j,1)];
        oedg = [oedg; oedgplus];
    end
end

% Termination condition
GoalReached = false;

% Initialize variables for locations
x = StartPosition;
g = GoalPosition;

%plot END Point
hold on;
plot3(GoalPosition(1),GoalPosition(2),GoalPosition(3),'r.','markersize',20);

% This loop calculates the new position of the particle.  
% It repeats until goal is reached 
i = 1;
multi = 1;
while ~GoalReached; 
    % Calculate next step using gradient descent 
    [multi, G] = Grad(multi, x, g, oedg);
    x = x - multi* lambda * G;
  
    % Plot particle at new location 
    hold on;
    h= plot3( x(1), x(2), x(3) ,'g.' );   % trajectory points

    % Pause for a moment so we can see the motion
    pause( .1 );               
    
    % prepare for avi file
    drawnow;
    M(i) = getframe(1);
    i=i+1;
    
    % Check if goal has been reached, i.e., distance 
    % between current and goal locations is less than a 
    % pre-defined threshold. 
    if ( norm( x - g ) <= lambda) 
        GoalReached = true;
    end
end

% Save in AVI format
movie2avi(M,'CG_asg2_1_DL.avi','FPS',15,'COMPRESSION', 'None','quality',10);