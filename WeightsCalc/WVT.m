function VT_W = WVT
% This function calculates the Vertical Tail(VT) Weight

FT = input('Ftail ; Ftail = 0 for conventional tail, = 1 for T-tail\n');   % Ftail = 0 for conventional tail, = 1 for T-tail
nZ = input('Ultimate load factor\n');                                      % nZ = ultimate load factor
WO = input('Design gross weight in lbf\n');                                % W0 = design gross weight in lbf
q = input('Dynamic pressure at cruise\n');                                 % q = dynamic pressure at cruise
TtC = input('Wing thickness to chord ratio\n');                            % TtC = wing thickness to chord ratio
SVT = input('Trapezoidal VT area in ft2\n');                               % SVT = trapezoidal VT area in ft2
VS = input('VT sweep at 25% MGC\n');                                       % VS = VT sweep at 25% MGC
AR = input('Aspect Ratio \n');                                             % AR = Aspect Ratio of wing, HT, or VT, per the appropriate subscripts
TR = input('Wing taper ratio\n');                                          % TR = wing taper ratio

VT_W = 0.073 * (1+0.2*FT) * ((nZ*WO)^0.376) * (q^0.122) * (SVT^0.873) * (((100*TtC)/cosd(VS))^(-0.49)) * ((AR/cosd(VS))^0.357) * (TR^0.039);

% VT_W = predicted weight of VT in lbf

end
