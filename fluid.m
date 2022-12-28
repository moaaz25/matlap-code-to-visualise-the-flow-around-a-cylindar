%uniform flow velocity

U_inf = input('Enter the uniform flow velocity[m\s]=  ');  

%vortex strength which control the cylinder rotation(if it’s positive it is clockwise direction)

gama= input(' Enter the value of vortex strength(positive-clockwise) =  '); 

Rc =input('Enter the radius of the cylinder[m]= ') ;   %RADIUS of the culiner
XYmax = 100;
X = linspace(-XYmax,XYmax,100);
Y = linspace(-XYmax,XYmax,100);
[x,y]=meshgrid(X,Y);
% creating the cycle coordinates
t=0:0.1:2*pi;
m=Rc*cos(t);
n=Rc*sin(t);
%polar variables
R=sqrt(x.^2+y.^2);
theta=atan2(y,x);
% Creation of the streamline function
z=U_inf.*sin(theta).*R.*(1-(Rc^2./(R.^2)))+gama*log(R)/(2*pi);
% Creation of the velocity on the cyliner (V_theta)
v_theta=-2*U_inf*sin(theta)-gama./(2*pi*Rc);
%stream line Plot
contour(x,y,z,200,'-p');
hold on
patch(m,n,'r');
% indicating when v_theta=0
if v_theta==0
  plot(v_theta,'*');
end
title('Stream Lines around a rotating cylibder');
