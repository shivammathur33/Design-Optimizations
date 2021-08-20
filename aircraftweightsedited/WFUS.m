function FUS_W = WFUS (SFUS , nZ , WO , lHT , lFS , dFS , q , VP , DP)
% This function calculates the Fuselage Weight

%SFUS = input('Fuselage wetted area in ft2\n');                             % SFUS = fuselage wetted area in ft2
%nZ = input('Ultimate load factor\n');                                      % nZ = ultimate load factor
%WO = input('Design gross weight in lbf\n');                                % W0 = design gross weight in lbf
%lHT = input('Horizontal tail arm, from wing C/4 to HT C/4 in ft\n'); 
%lFS = input('Length of fuselage structure in ft\n');                       % lFS = length of fuselage structure (forward bulkhead to aft frame) in ft
%dFS = input('Depth of fuselage structure in ft\n');                        % dFS = depth of fuselage structure in ft
%q = input('Dynamic pressure at cruise\n');                                 % q = dynamic pressure at cruise
%VP = input('Volume of pressurized cabin section in ft^3\n');               % VP = volume of pressurized cabin section in ft3
%DP = input('Cabin pressure differential, in psi\n');                       % DP = cabin pressure differential, in psi (typically 8 psi)

FUS_W = 0.052 * (SFUS^1.086) * ((nZ*WO)^0.177) * (lHT^(-0.051)) * ((lFS/dFS)^(-0.072)) * (q^0.241) + (11.9*(VP*DP)^0.271);

% FUS_W = Fuselage Weight

end