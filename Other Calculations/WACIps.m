function [WAC,WO,NOCC,M,WUAV] = WACIps
%This function calculates the Air-conditioning and Anti-icing weight

WO = input('Design gross weight in lbf\n');                                % W0 = design gross weight in lbf
NOCC = input('Number of occupants\n');                                     % NOCC = number of occupants (crew and passengers)
M = input('Mach number\n');                                                % M = Mach number
WUAV = input('Weight of the uninstalled avionics in lbf\n'); % AS_W = Avionics System Weight (calculated by the function WAS)           #value from main
AS_W = 2.117 * (WUAV^0.933);

WAC = 0.265 * (WO^0.52) * (NOCC^0.68) * (AS_W^0.17) * (M^0.08); 

% AC_W = Air-conditioning and Anti-icing weight

end