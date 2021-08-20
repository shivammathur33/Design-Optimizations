function FCS_W = WFCS (lFS , b ,  nZ , WO)
% This function calculates the Flight Control-System Weight

% lFS = length of fuselage structure (forward bulkhead to aft frame) in ft
% nZ = ultimate load factor
% W0 = design gross weight in lbf
% b = span

FCS_W = 0.053 * (lFS^1.563) * (b^0.371) * ((nZ*WO*(10^-4))^0.80);

% FCS_W = Flight Control-System Weight

end