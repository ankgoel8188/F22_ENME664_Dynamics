function Animate_attitude(t,y, ang)

if strcmp(ang,'rad')
    y = y*180/pi; % convert rads to degrees
end

for ii = 1:length(t)
    Phi     = y(ii,1);
    Theta   = y(ii,2);
    Psi     = y(ii,3);
    %O_DA = O_mat(y(ii,1),1)'*O_mat(y(ii,2),2)'*O_mat(y(ii,3),3)';

    plot_F_BA(Phi, Theta, Psi)
    
    pause(1e-1)

end

end

function plot_F_BA(Phi, Theta, Psi)
O_DA = O_mat(Phi,1)*O_mat(Theta,2)*O_mat(Psi,3);
    O_AD = O_DA';

    quiver3(0,0,0, O_AD(1,1), O_AD(2,1),O_AD(3,1),'r')
    hold on
    quiver3(0,0,0, O_AD(1,2), O_AD(2,2),O_AD(3,2),'g')
    quiver3(0,0,0, O_AD(1,3), O_AD(2,3),O_AD(3,3),'b')
    view(135,45)
    hold off
    axis([-1 1 -1 1 -1 1])
    axis square
    
    title(['\Phi=' num2str(Phi) ', \Theta=' num2str(Theta) ', \Psi=' num2str(Psi)])
end