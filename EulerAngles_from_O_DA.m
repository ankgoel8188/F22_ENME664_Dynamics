clc
clear all
close all

% Phi = 1*30;
% Theta = 0*10;
% Psi = 0*35;

% Randomly generate Euler angles
Phi = 10*randn;
Theta = 10*randn;
Psi = 10*randn;

% Orientation matrix for the 3-2-1 Euler angle sequence
O_DA = O_mat(Phi,1)*O_mat(Theta,2)*O_mat(Psi,3);

% Euler angles from Orientation matix
Theta1 = asind(-O_DA(1,3));
Theta2 = -Theta1+180;
sinTheta = [sind(Theta) sind(Theta1) sind(Theta2)]; 


Psi1 = atan2(O_DA(1,2)/cosd(Theta1), O_DA(1,1)/cosd(Theta1))*180/pi;
Psi2 = atan2(O_DA(1,2)/cosd(Theta2), O_DA(1,1)/cosd(Theta2))*180/pi;

Phi1 = atan2(O_DA(2,3)/cosd(Theta1), O_DA(3,3)/cosd(Theta1))*180/pi;
Phi2 = atan2(O_DA(2,3)/cosd(Theta2), O_DA(3,3)/cosd(Theta2))*180/pi;

EulerAngles = [Phi Phi1 Phi2
 Theta Theta1 Theta2
 Psi Psi1 Psi2]


O_DA1 = O_mat(Phi1,1)*O_mat(Theta1,2)*O_mat(Psi1,3);
O_DA1-O_DA

O_DA2 = O_mat(Phi2,1)*O_mat(Theta2,2)*O_mat(Psi2,3);
O_DA2-O_DA

subplot(2,2,1); Animate_attitude(0, [Phi Theta Psi],'deg')
subplot(2,2,3); Animate_attitude(0, [Phi1 Theta1 Psi1],'deg')
subplot(2,2,4); Animate_attitude(0, [Phi2 Theta2 Psi2],'deg')

figure
Animate_attitude(0, [Phi Theta Psi],'deg')
hold on
Animate_attitude(0, [Phi1 Theta1 Psi1],'deg')
hold on
Animate_attitude(0, [Phi2 Theta2 Psi2],'deg')

% sin(Phi2)*sin(Theta2)*(cosd)


%%
close all
t = 0:0.1:1;
% Animate_attitude(t, [Phi*0 Theta*0 Psi].*t','deg')
% Animate_attitude(t, [Phi*0 Theta*0 Psi]+[Phi*0 Theta*1 0*Psi].*t','deg')
% Animate_attitude(t, [Phi*0 Theta Psi]+[Phi*1 Theta*0 0*Psi].*t','deg')

Animate321(t,[Phi Theta Psi])
figure
% Theta2 = Theta2-360

Animate321(t,[Phi2 Theta2 Psi2])

%%
close all
Animate_attitude(t, [Phi*t' Theta+0*t' Psi+0*t'],'deg')


%%



