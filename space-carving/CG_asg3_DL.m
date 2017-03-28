% Demonstrates the projection of a set of 3-D points onto an image. The
% projection matrix was obtained from camera calibration.

tic;
% clean up memory and close all figures
clc;
close all;
clear all;

% These are the first frames on Cameras 1 and 2
for j = 1:8
    Cam(j).im = rgb2gray(imread(strcat('silhouettes/Silhouette',num2str(j),'_0000.png')));
end
[Cam_X, Cam_Y] = size (Cam(1).im);

Pixcub =[];
% Sample 3-D points within a cube shape centered at the origin
for X = -3:.05:3
    for Y = -3:.05:3
        for Z = -3:.05:3
            
            pixcount = 0;
            for iCam = 1 : 8
                % Obtain projection matrix for camera iCam
                P = getProjMatrix( iCam );
                % Project 3-D points to image points
                x = P * [ X Y Z 1 ]';
                % Transform homogeneous coords into cartesian
                u = floor (x(1)/x(3));
                v = floor (x(2)/x(3));
                % update index for image-point list
                
                if ((u < Cam_Y)  &&  (u > 0) && (v < Cam_X)  && (v > 0) )
                    if  (Cam( iCam ).im (v, u) >=  227)
                        pixcount = pixcount+1; % count the time hit by one camera
                    end
                end
            end
            
            if (pixcount == 8)
                Pixcub = [Pixcub; X Y Z]; %if hit time == 8, then count it as available
            end
            
        end
    end
end


% Display image
[Pixcub_X, NULL] = size (Pixcub);
for i = 1:Pixcub_X
    plot3( Pixcub(i, 1), Pixcub(i, 2), Pixcub(i, 3) ,'bo','LineWidth',3 );   % trajectory points
    hold on;
end

% Axes settings
xlabel('x','FontSize',14);
ylabel('y','FontSize',14);
zlabel('z','FontSize',14);
view(3);
xlim([-3,3]);
ylim([-3,3]);
zlim([-3,3]);

toc;