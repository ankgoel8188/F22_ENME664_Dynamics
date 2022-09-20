%	This script computes the 3-2-1 Euler angle sequence for a given 
%   oritentaion matrix and animates the orientation matrix for the 
%   computed Euler angle sequence.
%
%   Inputs:     Euler angles
%               
%   Outputs:    plots and animation window
%
%   Author:     Ankit Goel,
%               Assistant Professor, 
%               Mechanical Engineering Depratment, 
%               University of Maryland, Baltimore County. 
%
%   Version:    1.0     2022/09/20  
%   
%   License:    Some license.

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

Psi1 = atan2(O_DA(1,2)/cosd(Theta1), O_DA(1,1)/cosd(Theta1))*180/pi;
Psi2 = atan2(O_DA(1,2)/cosd(Theta2), O_DA(1,1)/cosd(Theta2))*180/pi;

Phi1 = atan2(O_DA(2,3)/cosd(Theta1), O_DA(3,3)/cosd(Theta1))*180/pi;
Phi2 = atan2(O_DA(2,3)/cosd(Theta2), O_DA(3,3)/cosd(Theta2))*180/pi;

% Display true and computed Euler angles
display(['Euler Angles:            ' num2str(Phi) ', ' num2str(Theta) ', ' num2str(Psi)])
display(['Computed Euler Angles 1: ' num2str(Phi1) ', ' num2str(Theta1) ', ' num2str(Psi1)])
display(['Computed Euler Angles 2: ' num2str(Phi2) ', ' num2str(Theta2) ', ' num2str(Psi2)])

% Compute oritentation matrices corresponding to the computed Euler angles
O_DA1 = O_mat(Phi1,1)*O_mat(Theta1,2)*O_mat(Psi1,3);
O_DA2 = O_mat(Phi2,1)*O_mat(Theta2,2)*O_mat(Psi2,3);

% Display computed orientation matrix error
Error_EA_1 = norm(O_DA1-O_DA)
Error_EA_2 = norm(O_DA2-O_DA)

% Plot final orientations with all three sets of Euler angles
subplot(2,2,1); Animate_attitude(0, [Phi Theta Psi],'deg')
subplot(2,2,3); Animate_attitude(0, [Phi1 Theta1 Psi1],'deg')
subplot(2,2,4); Animate_attitude(0, [Phi2 Theta2 Psi2],'deg')

% Animate final orientations with all three sets of Euler angles
figure
t = 0:0.1:1;
subplot(2,2,1)
Animate321(t,[Phi Theta Psi])
subplot(2,2,3)
Animate321(t,[Phi1 Theta1 Psi1])
subplot(2,2,4)
Animate321(t,[Phi2 Theta2 Psi2])




