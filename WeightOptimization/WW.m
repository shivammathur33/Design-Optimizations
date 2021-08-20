function W_W = WW(SW , WFW , AR , WS , q , TR , TtC , nZ , WO)
% This function calculates the Wing weight

% SW = trapezoidal wing area in ft2
% WFW = weight of fuel in wing in lbf (If WFW = 0 then, let WFW^0035 = 1)
% AR = Aspect Ratio of wing, HT, or VT, per the appropriate subscripts
% WS = wing sweep at 25% MGC
% q = dynamic pressure at cruise
% TR = wing taper ratio
% TtC = wing thickness to chord ratio
% nZ = ultimate load factor
% W0 = design gross weight in lbf

W_W = 0.0036 * (double(SW)^0.758) * (WFW^0.0035) * ((AR)/((cosd(WS))^2))^0.6 * (q^0.006) * (TR^0.04) * ((100*TtC)/cosd(WS))^(-0.3) * (nZ * WO)^0.49;
end



