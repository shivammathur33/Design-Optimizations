function [FS_W,Qtot,Qint,NTANK,NENG] = WFSIps
% This function calculates the Fuel System Weight

Qtot = input('Total fuel quantity in gallons\n');                          %Qtot = total fuel quantity in gallons
Qint = input('Fuel quantity in integral fuel tanks in gallons\n');         %Qint = fuel quantity in integral fuel tanks in gallons
NTANK = input('Number of fuel tanks\n');                                   %NTANK = number of fuel tanks
NENG = input('Number of engines\n');                                       %NENG = number of engines

FS_W = 2.49 * (Qtot^0.726) * (((Qtot)/(Qtot+Qint))^0.363) * (NTANK^0.242) * (NENG^0.157);

% FS_W = Fuel System Weight
end

