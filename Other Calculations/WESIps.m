function [ES_W,WUAV,WO] = WESIps
%This function calculates the Electrical system Weight 

% FS_W = Fuel system weight (calculated by the function WFS)               #value from main
% AS_W = Avionics System Weight (calculated by the function WAS)           #value from main

WO = input('Design gross weight in lbf\n');  
F_W = (0.0582 * WO) - 65;

WUAV = input('Weight of the uninstalled avionics in lbf\n');
AS_W = 2.117 * (WUAV^0.933);

ES_W = 12.57 * ((F_W + AS_W)^0.51);

% ES_W = Electrical system Weight 

end