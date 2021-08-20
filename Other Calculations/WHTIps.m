function[HT_W,nZ,WO,q,SHT,TtC,HS,AR,TR] = WHTIps

nZ = input('Ultimate load factor\n');                                % nZ = ultimate load factor
WO = input('Design gross weight in lbf\n');                          % W0 = design gross weight in lbf
q = input('Dynamic pressure at cruise\n');                           % q = dynamic pressure at cruise
SHT = input('Trapezoidal HT area in ft2\n');                         % SHT = trapezoidal HT area in ft2
TtC = input('Wing thickness to chord ratio\n');                      % TtC = wing thickness to chord ratio
HS = input('HT sweep at 25% MGC\n');                                 % HS = HT sweep at 25% MGC
AR = input('Aspect Ratio \n');                                       % AR = Aspect Ratio of wing, HT, or VT, per the appropriate subscripts
TR = input('Wing taper ratio\n');                                    % TR = wing taper ratio

HT_W = 0.016 * ((nZ*WO)^0.414) * (q^0.168) * (SHT^0.896) * (((100*TtC)/cosd(HS))^(-0.12)) * (((AR)/(cosd(HS))^2)^0.043) * TR^(-0.02);


end