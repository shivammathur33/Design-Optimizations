function FUS_W = WFUS (SFUS , nZ , WO , lHT , lFS , dFS , q , VP , DP)
% This function calculates the Fuselage Weight

% SFUS = fuselage wetted area in ft2
% nZ = ultimate load factor
% W0 = design gross weight in lbf
% lHT-Horizontal tail arm, from wing C/4 to HT C/4 in ft
% lFS = length of fuselage structure (forward bulkhead to aft frame) in ft
% dFS = depth of fuselage structure in ft
% q = dynamic pressure at cruise
% VP = volume of pressurized cabin section in ft3
% DP = cabin pressure differential, in psi (typically 8 psi)

FUS_W = 0.052 * (SFUS^1.086) * ((nZ*WO)^0.177) * (lHT^(-0.051)) * ((lFS/dFS)^(-0.072)) * (q^0.241) + (11.9*(VP*DP)^0.271);

% FUS_W = Fuselage Weight

end