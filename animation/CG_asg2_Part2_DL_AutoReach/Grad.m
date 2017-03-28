%%%%%%%%%%%%%%%%%%%%%%%
%                                                                            %
%   Acknowledgement :                                     %
%   Thanks the help from Professor Ribeiro.  %
%                                                                            %
%%%%%%%%%%%%%%%%%%%%%%%

function G = Grad( Part, p, target) 

% p:  1x3 vector with the current position 
% g:  1x3 vector with goal position

%constances
Step = 1;

% Calculate the cost of moving to locations of a 8-size neighborhood (anti-clockwise)
%
%                      ^ 
%                       |
%                  node3
%                       |
%  -- node5 --- p --- node1 --> 
%                       |
%                  node7
%                       |
%

%node matrix
node=zeros(12,9);
node(1,:) = p + [  0 0 0 Step 0 0 0 0 0 ];
node(2,:) = p + [0 0 0 -Step, 0 0 0,0 0];
node(3,:) = p + [0 0 0,0 Step, 0 0 0 0];
node(4,:) = p + [0 0 0,0 -Step, 0 0 0 0];
node(5,:) = p + [0 0 0,0 0 Step, 0 0 0];
node(6,:) = p + [0 0 0,0 0, -Step 0 0 0];
node(7,:) = p + [0 0 0,0 0 0 Step 0 0];
node(8,:) = p + [0 0 0,0 0 0 -Step 0 0];
node(9,:) = p + [0 0 0,0 0 0 0 Step 0];
node(10,:) = p + [0 0 0,0 0 0 0 -Step 0];
node(11,:) = p + [0 0 0,0 0 0 0 0 Step];
node(12,:) = p + [0 0 0,0 0 0 0 0 -Step];



weight = zeros(8,1);
for i= 1:12
    weight(i) = Cpathplan(Part, node(i,:),target);
end


% Calculate the components of the gradient vector
theta21 = weight(1) - weight(2);
theta22 =weight(3) - weight(4);
theta23 =weight(5) - weight(6);
    
theta31 = weight(7)- weight(8) ;
theta32 = weight(9) - weight(10);
theta33 = weight(11)- weight(12) ;


theta1 = 0;

% Resultant vector formed by cost's x and y components
r = [ theta1 theta1 theta1 theta21 theta22 theta23 theta31 theta32 theta33]; 

% Calculate the direction vector, i.e., direction of the gradient vector
G = r / norm( r ); 
end