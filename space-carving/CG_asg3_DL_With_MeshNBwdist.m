% clean up memory and close all figures
clc;
close all;
clear all;
 
tic;
for j = 1:8
    iTime = 1;
    for k = 0: 174 :174
        Cam(j).time(iTime).im = rgb2gray(imread(strcat('silhouettes/Silhouette',num2str(j), '_', num2str(k,'%.4d') , '.png')));
        iTime = iTime +1;
    end
end
[Cam_X, Cam_Y] = size (Cam(1).time(1).im);
 
 
 
for iTime = 1:2
    
    % Sample 3-D points within a cube shape centered at the origin
    [ Xi Yi Zi ] = meshgrid( -3:.05:3, -3:.05:3, -3:.05:3);
    % Number of points
    M = size( Xi(:), 1 );
    % Convert points to homogeneous coordinates. Transpose result so points are
    % column vectors.
    X =  [ Xi(:) Yi(:) Zi(:) ones( M, 1 ) ]' ;
    
    for iCam = 1 :8
        
        D = bwdist( ~Cam(iCam).time(iTime).im );
        
        Pixcub = [];
        
        % Obtain projection matrix for camera iCam
        P = getProjMatrix( iCam );
        x = P * X;
        
        % Convert homogeneous coords back to cartesian. Notice that division is
        % elementwise using ./ instead of /
        u = floor(x(1, :)./x(3, :));
        v = floor(x(2, :)./x(3, :));
        
        for iX = 1:size (X, 2)
            
            %limit range inside the pics
            if ((u(1, iX) < Cam_Y)  &&  (u(1, iX) > 0) && (v(1, iX) <Cam_X)  && (v(1, iX)> 0))
                % if white and distance to outside > 70
                if  (Cam( iCam ).time(iTime).im (v(1, iX), u(1, iX)) >= 227 && D(v(1, iX), u(1, iX) ) <=70 && D(v(1, iX), u(1, iX) ) > 0)
                    Pixcub = [Pixcub; X(1, iX) X(2, iX) X(3, iX)];
                end
            end
            
        end
        
         %Add the counted of for one camera point  pixel cube to Martirx
         %prepare for matrix replacement
        X = [Pixcub ones( size(Pixcub, 1), 1) ]';
    end
    
    % Display image
    plot3( X(1, :), X(2, :), X(3, :) ,'b.','LineWidth',3 );   % trajectory points
    hold on;
       
    % Axes settings
    xlabel('x','FontSize',14);
    ylabel('y','FontSize',14);
    zlabel('z','FontSize',14);
    view(3);
    xlim([-3,3]);
    ylim([-3,3]);
    zlim([-3,3]);
    
end
 
toc;