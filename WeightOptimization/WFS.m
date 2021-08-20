function FS_W = WFS (Qtot , Qint , NTANK , NENG)
% This function calculates the Fuel System Weight

%Qtot = total fuel quantity in gallons
%Qtot = total fuel quantity in integral fuel tanks in gallons
%NTANK = number of fuel tanks
%NENG = number of engines

FS_W = 2.49 * (Qtot^0.726) * (((Qtot)/(Qtot+Qint))^0.363) * (NTANK^0.242) * (NENG^0.157);

% FS_W = Fuel System Weight
end
