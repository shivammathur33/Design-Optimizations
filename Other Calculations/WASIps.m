function [AS_W,WUAV] = WASIps
%This function calculates the Avionics Systems Weight

WUAV = input('Weight of the uninstalled avionics in lbf\n');   %WUAV = Weight of the uninstalled avionics in lbf

AS_W = 2.117 * (WUAV^0.933);

% AS_W = Avionics Systems Weight

end