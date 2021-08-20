function AC_W = WAC (WO , NOCC , AS_W , M)
%This function calculates the Air-conditioning and Anti-icing weight

% W0 = design gross weight in lbf
% NOCC = number of occupants (crew and passengers)
% M = Mach number

% AS_W = Avionics System Weight (calculated by the function WAS)           
AC_W = 0.265 * (WO^0.52) * (NOCC^0.68) * (AS_W^0.17) * (M^0.08);

% AC_W = Air-conditioning and Anti-icing weight

end