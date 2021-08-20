function W_W = WW(SW , WFW , AR , WS , q , TR , TtC , nZ , WO)
% This function calculates the Wing weight

% SW = input('Trapezoidal wing area in ft^2 \n');      % SW = trapezoidal wing area in ft2
% WFW = input('Weight of fuel in wing in lbf \n');     % WFW = weight of fuel in wing in lbf (If WFW = 0 then, let WFW^0035 = 1)
%if WFW ==0
%     WFW = 1;
%end
%AR = input('Aspect Ratio \n');                       % AR = Aspect Ratio of wing, HT, or VT, per the appropriate subscripts
%WS = input('Wing sweep at 25% MGC\n');               % WS = wing sweep at 25% MGC
%q = input('Dynamic pressure at cruise\n');           % q = dynamic pressure at cruise
%TR = input('Wing taper ratio\n');                    % TR = wing taper ratio
%TtC = input('Wing thickness to chord ratio\n');      % TtC = wing thickness to chord ratio
%nZ = input('Ultimate load factor\n');                % nZ = ultimate load factor
%WO = input('Design gross weight in lbf\n');          % W0 = design gross weight in lbf

W_W = 0.0036 * (SW^0.758) * (WFW^0.0035) * ((AR)/((cosd(WS))^2))^0.6 * (q^0.006) * (TR^0.04) * ((100*TtC)/cosd(WS))^(-0.3) * (nZ * WO)^0.49;

% WW = predicted weight of wing in lbf

end



