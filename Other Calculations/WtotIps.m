function [wtot,WO,NOCC,M,WUAV,nZ,b,Qtot,Qint,NTANK,NENG,SFUS,lHT,lFS,dFS,q,VP,DP,SHT,TtC,HS,AR,TR,WENG,nl,Wl,Lm,Ln,FT,VS,SVT,SW,WFW,WS] = WtotIps

WO = input('Design gross weight in lbf\n');                                % W0 = design gross weight in lbf
NOCC = input('Number of occupants\n');                                     % NOCC = number of occupants (crew and passengers)
M = input('Mach number\n');                                                % M = Mach number
WUAV = input('Weight of the uninstalled avionics in lbf\n'); % AS_W = Avionics System Weight (calculated by the function WAS)           #value from main

lFS = input('Length of fuselage structure in ft\n');                       % lFS = length of fuselage structure (forward bulkhead to aft frame) in ft
nZ = input('Ultimate load factor\n'); 
b = input('Wingspan in ft\n');                                             % b = span



Qtot = input('Total fuel quantity in gallons\n');                          %Qtot = total fuel quantity in gallons
Qint = input('Fuel quantity in integral fuel tanks in gallons\n');         %Qint = fuel quantity in integral fuel tanks in gallons
NTANK = input('Number of fuel tanks\n');                                   %NTANK = number of fuel tanks
NENG = input('Number of engines\n');                                       %NENG = number of engines


SFUS = input('Fuselage wetted area in ft2\n');                             % SFUS = fuselage wetted area in ft2
lHT = input('Horizontal tail arm, from wing C/4 to HT C/4 in ft\n'); 
dFS = input('Depth of fuselage structure in ft\n');                        % dFS = depth of fuselage structure in ft
q = input('Dynamic pressure at cruise\n');                                 % q = dynamic pressure at cruise
VP = input('Volume of pressurized cabin section in ft^3\n');               % VP = volume of pressurized cabin section in ft3
DP = input('Cabin pressure differential, in psi\n');                       % DP = cabin pressure differential, in psi (typically 8 psi)

SHT = input('Trapezoidal HT area in ft2\n');                         % SHT = trapezoidal HT area in ft2
TtC = input('Wing thickness to chord ratio\n');                      % TtC = wing thickness to chord ratio
HS = input('HT sweep at 25% MGC\n');                                 % HS = HT sweep at 25% MGC
AR = input('Aspect Ratio \n');                                       % AR = Aspect Ratio of wing, HT, or VT, per the appropriate subscripts
TR = input('Wing taper ratio\n');                                    % TR = wing taper ratio
WENG = input('Uninstalled engine weight in lbf\n');                        %WENG = uninstalled engine weight in lbf


nl = input('Ultimate landing load factor\n');                              %nl = ultimate landing load factor
Wl = input('Design landing weight in lbf\n');                              %Wl = design landing weight in lbf
Lm = input('Length of the main landing gear strut in inches\n');           %Lm = length of the main landing gear strut in inches
Ln = input('Length of the nose landing gear strut in inches\n');           %Ln = length of the nose landing gear strut in inches

FT = input('Ftail ; Ftail = 0 for conventional tail, = 1 for T-tail\n');   % Ftail = 0 for conventional tail, = 1 for T-tail
VS = input('VT sweep at 25% MGC\n');                                       % VS = VT sweep at 25% MGC
SVT = input('Trapezoidal VT area in ft2\n');                               % SVT = trapezoidal VT area in ft2

SW = input('Trapezoidal wing area in ft^2 \n');      % SW = trapezoidal wing area in ft2
WFW = input('Weight of fuel in wing in lbf \n');     % WFW = weight of fuel in wing in lbf (If WFW = 0 then, let WFW^0035 = 1)
if WFW ==0
    WFW = 1;
end
WS = input('Wing sweep at 25% MGC\n');   % WS = wing sweep at 25% MGC

WW = 0.0036 * (SW^0.758) * (WFW^0.0035) * ((AR)/((cosd(WS))^2))^0.6 * (q^0.006) * (TR^0.04) * ((100*TtC)/cosd(WS))^(-0.3) * (nZ * WO)^0.49;
WHT = 0.016 * ((nZ*WO)^0.414) * (q^0.168) * (SHT^0.896) * (((100*TtC)/cosd(HS))^(-0.12)) * (((AR)/(cosd(HS))^2)^0.043) * TR^(-0.02);
WFUS = 0.052 * (SFUS^1.086) * ((nZ*WO)^0.177) * (lHT^(-0.051)) * ((lFS/dFS)^(-0.072)) * (q^0.241) + (11.9*(VP*DP)^0.271);
WVT = 0.073 * (1+0.2*FT) * ((nZ*WO)^0.376) * (q^0.122) * (SVT^0.873) * (((100*TtC)/cosd(VS))^(-0.49)) * ((AR/cosd(VS))^0.357) * (TR^0.039);
WMLG = 0.095 * ((nl*Wl)^0.768) * ((Lm/12)^0.409);
WNLG = 0.125 * ((nl*Wl)^0.566) * ((Ln/12)^0.845);
WIE = 2.575 * (WENG^0.922) * NENG;
WAS = 2.117 * (WUAV^0.933);
WAC = 0.265 * (WO^0.52) * (NOCC^0.68) * (WAS^0.17) * (M^0.08);
WFS = 2.49 * (Qtot^0.726) * (((Qtot)/(Qtot+Qint))^0.363) * (NTANK^0.242) * (NENG^0.157);
WES = 12.57 * ((WFS + WAS)^0.51);
WFCS = 0.053 * (lFS^1.563) * (b^0.371) * ((nZ*WO*(10^-4))^0.80);
WF = (0.0582 * WO) - 65;
WHS = 0.001 * WO;


wtot  = WAC + WES + WFCS + WF + WFS + WFUS + WHS +WHT + WMLG + WNLG + WVT + WW + WAS + WIE;
end


