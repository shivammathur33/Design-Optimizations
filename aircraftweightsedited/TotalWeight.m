function TotalWeight
W_W = WW (SW , WFW , AR , WS , q , TR , TtC , nZ , WO);                    % Wing Weight                                           

HT_W = WHT (nZ , WO , q , SHT , TtC , HS , AR , TR);                       %Horizontal Tail Weight                               

VT_W = WVT (FT , nZ , WO , q , SVT , TtC , VS , AR , TR);                  %Vertical Tail Weight

FUS_W = WFUS (SFUS , nZ , WO , lHT , lFS , dFS , q , VP , DP);             %Fuselage Weight                                     

MLG_W = WMLG (nl , Wl , Lm);                                               %Main Landing Gear Weight

NLG_W = WNLG (nl , Wl , Ln);                                               %Nose Landing Gear Weight

IE_W = WIE (WENG , NENG);                                                  %Installed Engine Weight

FS_W = WFS (Qtot , Qint , NTANK , NENG);                                   %Fuel Systems Weight

FCS_W = WFCS (lFS , b ,  nZ , WO);                                         %Flight Control Systems Weight

HS_W = WHS (WO);                                                           %Hydraulic Systems Weight
	
AS_W = WAS (WUAV);                                                         %Avionic Systems Weight

ES_W = WES (FS_W , AS_W);                                                  %Electrical Sysems weight

AC_W = WAC (WO , NOCC , AS_W , M);                                         %Air Conditioning and anti icing Weight

F_W = WF (WO);                                                             %Furnishings

%Total Weight:-
Wtot = W_W + HT_W + VT_W + FUS_W + MLG_W + NLG_W + IE_W + FS_W + FCS_W + HS_W + AS_W + ES_W + AC_W + F_W     

end