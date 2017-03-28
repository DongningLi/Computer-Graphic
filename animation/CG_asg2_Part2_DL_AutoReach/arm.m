% make_cylinder_special.m
function part = arm( )

Lx = 2;
Ly = 2;
Lz = 5;

%base position
ones81 = ones(8,1);

% Vertices
part.Pts = [Lx*ones81,Ly*ones81,Lz*ones81]...
    .*[0,0,0;
    1,0,0;
    0,1,0;
    0,0,1;
    1,1,0;
    0,1,1;
    1,0,1;
    1,1,1] ;
ptsones = [part.Pts ones81];

part.delta = [Lx*ones(2,1),Ly*ones(2,1),Lz*ones(2,1)]...
    .*[ 1/2 1/2 0; 
    1/2 1/2 1] ;
deltaones = [part.delta ones(2,1)];

t = -part.delta( 1, 1:3 ) ;

T = [ 1 0  0 0;...
      0 1  0 0;...
      0  0   1 0;...
      t(1) t(2) t(3) 1]; 

part.Pts  = ptsones * T ;
part.delta = deltaones * T ;
part.Ptsp = part.Pts';
part.deltap = part.delta';

part.d = norm( part.deltap( 1:3, 2 ) - part.deltap( 1:3, 1 ) );

part.joint = [0 0 6 1];
end