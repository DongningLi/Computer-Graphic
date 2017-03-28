%%%%%%%%%%%%%%%%%%%%%%%
%                                                                            %
%   Acknowledgement :                                     %
%   Thanks the help from Professor Ribeiro.  %
%                                                                            %
%%%%%%%%%%%%%%%%%%%%%%%

function c= Cpathplan( part, p,  target)

T1 = trans(0);
[R2x, R2y, R2z] = Rot(p(4), p(5), p(6));
T2 = trans(5);
[R3x, R3y, R3z] = Rot(p(7), p(8), p(9));
T3 = trans(5);
TransformedPart.p3. Pts = part.Pts* R3x*R3y*R3z*T3*R2x* R2y* R2z*T2* T1;
TransformedPart.p3. joint= part.joint *R3x*R3y*R3z*T3*R2x*R2y* R2z*T2* T1;

EndEffector = TransformedPart.p3.joint(1, 1:3);

normpg =norm(EndEffector-target);
c = normpg^2;
 
end