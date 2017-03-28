function EndEffector = IniGoal ( part, theta2x, theta2y, theta2z, theta3x, theta3y, theta3z, target)


clf;
hold on;
plot3( target(1), target( 2 ), target( 3), 'ro', 'LineWidth', 2 );
text( target( 1 ) + 1, target( 2 ) + 1, target( 3 ) + 1,'Target', 'FontSize', 13 );


T1 = trans(0);
TransformedPart = part;
TransformedPart.p1.Pts = part.Pts*T1;
TransformedPart.p1.joint = part.joint *T1;
draw(TransformedPart.p1);


[R2x, R2y, R2z] = Rot(theta2x, theta2y, theta2z);
T2 = trans(5);
TransformedPart.p2. Pts = part.Pts* R2x* R2y*R2z*T2* T1;
TransformedPart.p2. joint = part.joint* R2x* R2y* R2z*T2* T1;
draw(TransformedPart.p2);


[R3x, R3y, R3z] = Rot(theta3x, theta3y, theta3z);
T3 = trans(5);
TransformedPart.p3. Pts = part.Pts* R3x*R3y* R3z*T3* R2x* R2y* R2z*T2* T1;
TransformedPart.p3. joint= part.joint *R3x*R3y *R3z*T3* R2x* R2y* R2z*T2* T1;
draw(TransformedPart.p3);

EndEffector = TransformedPart.joint(1, 1:3);

% Axes settings
xlabel('x','FontSize',14);
ylabel('y','FontSize',14);
zlabel('z','FontSize',14);
set(gca,'FontSize',14);
axis vis3d equal;
view(3);
camlight;
grid on;
xlim([-20,20]);
ylim([-20, 20]);
zlim([0,25]);

hold off;

end
