function FCS_W = WFCS
% This function calculates the Flight Control-System Weight

lFS = input('Length of fuselage structure in ft\n');                       % lFS = length of fuselage structure (forward bulkhead to aft frame) in ft
nZ = input('Ultimate load factor\n');                                      % nZ = ultimate load factor
WO = input('Design gross weight in lbf\n');                                % W0 = design gross weight in lbf
b = input('Wingspan in ft\n');                                             % b = span

FCS_W = 0.053 * (lFS^1.563) * (b^0.371) * ((nZ*WO*(10^-4))^0.80);

% FCS_W = Flight Control-System Weight

end
