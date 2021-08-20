function [IE_W,WENG,NENG] = WIEIps
%This function calculates the Installed Engine Weight

WENG = input('Uninstalled engine weight in lbf\n');                        %WENG = uninstalled engine weight in lbf
NENG = input('Number of engines\n');                                       %NENG = number of engines

IE_W = 2.575 * (WENG^0.922) * NENG;

% IE_W = Installed Engine Weight

end

