function [W_I , CG_I , W_A , CG_A] = Main
global WO
global nz

% WW = Wing weight

W_W = WW;                                          % calculating Wing weight

% WHT = Horizontal Tail(HT) Weight

HT_W = WHT;                                        %calculating Horizontal Tail(HT) Weight

%WVT = Vertical Tail(VT) Weight

VT_W = WVT;                                        %calculating Vertical Tail(VT) Weight

%WFUS = Fuselage Weight

FUS_W = WFUS;                                      %calculating Fuselage Weight

%WMLG = Main Landing Gear Weight

MLG_W = WMLG;                                      %calculating Main Landing Gear Weight

%WNLG = Nose Landing Gear Weight

NLG_W = WNLG;                                      %calculating Nose Landing Gear Weight

%WIE = Installed Engine Weight

IE_W = WIE;                                        %calculating Installed Engine Weight

%WFS = Fuel System Weight

FS_W = WFS;                                        %calculating Fuel System Weight

%WFCS = Flight Control-System Weight

FCS_W = WFCS;                                      %calculating Flight Control-System Weight

%WHS = Hydraulic System Weight

HS_W = WHS;                                        %calculating Hydraulic System Weight

%WAS = Avionics Systems Weight

AS_W = WAS;                                        %calculating Avionics Systems Weight

%WES = Electrical System Weight

ES_W = WES(FS_W,AS_W);                             %calculating Electrical System Weight

%WAC = Air-conditioning and Anti-icing weight

AC_W = WAC(AS_W);                                  %calculating Air-conditioning and Anti-icing weight

%WF = Furnishings weight

F_W = WF;                                          %calculating Furnishings weight

% Calculation of the Centre of Gravity

MI = input('Moment Arm\n');                        % MI = Moment Arm

fprintf('Weight of individual systems:\n');
W_I = [W_W   HT_W   VT_W   FUS_W   MLG_W   NLG_W   IE_W   FS_W   FCS_W   HS_W   AS_W   ES_W   AC_W   F_W]  %Display of individual weights in an array form

fprintf('Centre of Gravity of individual systems:\n');
CG_I = MI * W_I                                                                                            %Calculation and Display of the Centre of Gravity of the individual systems

fprintf('Total Weight of Aircraft:\n')
W_A = W_W + HT_W + VT_W + FUS_W + MLG_W + NLG_W + IE_W + FS_W + FCS_W + HS_W + AS_W + ES_W + AC_W + F_W    %Total weight of the Aircraft = Sum of the individual weight

fprintf('Centre of Gravity of Aircraft:\n');
CG_I = MI * W_A                                                                                            %Calculation and Display of the Centre of Gravity of the total Aircraft

end