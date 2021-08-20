function HT_W = WHT (nZ , WO , q , SHT , TtC , HS , AR , TR)
% This function calculates the Horizontal Tail(HT) Weight

% nZ = ultimate load factor
% W0 = design gross weight in lbf
% q = dynamic pressure at cruise
% SHT = trapezoidal HT area in ft2
% TtC = wing thickness to chord ratio
% HS = HT sweep at 25% MGC
% AR = Aspect Ratio of wing, HT, or VT, per the appropriate subscripts
% TR = wing taper ratio


nZ = double(nZ);
WO = double(WO);
q = double(q);
SHT = double(SHT);
TtC = double(TtC);
HS = double(HS);
AR = double(AR);
TR = double(TR);

HT_W = 0.016 * ((nZ*WO)^0.414) * (q^0.168) * (SHT^0.896) * (((100*TtC)/cosd(HS))^(-0.12)) * (((AR)/(cosd(HS))^2)^0.043) * TR^(-0.02);

end
