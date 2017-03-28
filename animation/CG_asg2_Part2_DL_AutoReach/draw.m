function f = draw (part)
% Patches
Index_Patch = ...
    [1,2,5,3;
    1,3,6,4;
    1,4,7,2;
    4,7,8,6;
    2,5,8,7;
    3,6,8,5];

n_pat = 6;

for i_pat=1:n_pat
    
    % Patches data
    part.Pts_X(:,i_pat) = part.Pts(Index_Patch(i_pat,:),1);
    part.Pts_Y(:,i_pat) = part.Pts(Index_Patch(i_pat,:),2);
    part.Pts_Z(:,i_pat) = part.Pts(Index_Patch(i_pat,:),3);
end

% Draw patches
figure(1);
h = patch(part.Pts_X, part.Pts_Y, part.Pts_Z,'y');
set(h,'FaceLighting','phong','EdgeLighting','phong');
[x y z] = sphere;
h2 = patch(surf2patch(x+part.joint(1), y+part.joint(2), z+part.joint(3)));
set(h2,'FaceLighting','phong','EdgeLighting','phong','facecolor','yellow', 'edgecolor','none');
end