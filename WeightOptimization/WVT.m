function VT_W = WVT (FT , nZ , WO , q , SVT , TtC , VS , AR , TR)
% This function calculates the Vertical Tail(VT) Weight

% Ftail = 0 for conventional tail, = 1 for T-tail
% nZ = ultimate load factor
% W0 = design gross weight in lbf
% q = dynamic pressure at cruise
% TtC = wing thickness to chord ratio
% SVT = trapezoidal VT area in ft2
% VS = VT sweep at 25% MGC
% AR = Aspect Ratio of wing, HT, or VT, per the appropriate subscripts
% TR = wing taper ratio


VT_W = 0.073 * (1+0.2*FT) * ((nZ*WO)^0.376) * (q^0.122) * (SVT^0.873) * (((100*TtC)/cosd(VS))^(-0.49)) * ((AR/cosd(VS))^0.357) * (TR^0.039);
end