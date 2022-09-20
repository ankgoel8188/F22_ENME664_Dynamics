function Animate321(t,EulerAngle)
Phi = EulerAngle(1);
Theta = EulerAngle(2);
Psi = EulerAngle(3);

Animate_attitude(t, [Phi*0 Theta*0 Psi].*t','deg')
Animate_attitude(t, [Phi*0 Theta*0 Psi]+[Phi*0 Theta*1 0*Psi].*t','deg')
Animate_attitude(t, [Phi*0 Theta Psi]+[Phi*1 Theta*0 0*Psi].*t','deg')
title(['\Phi=' num2str(Phi) ', \Theta=' num2str(Theta) ', \Psi=' num2str(Psi)])
end