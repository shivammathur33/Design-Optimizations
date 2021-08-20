function Wtot = TotalWeight (W_W , HT_W , VT_W , FUS_W , MLG_W , NLG_W , IE_W , FS_W , FCS_W , HS_W , AS_W , ES_W , AC_W , F_W)

% W_W Wing Weight
% HT_W Horizontal Tail Weight
%VT_W Vertical Tail Weight%
%FUS_W Fuselage Weight
%MLG_W Main Landing Gear Weight
%NLG_W Nose Landing Gear Weight
%IE_W Installed Engine Weight
%FS_W Fuel Systems Weight
%FCS_W Flight Control Systems Weight
%HS_W Hydraulic Systems Weight
%AS_W Avionic Systems Weight
%ES_W Electrical Sysems weight
%AC_W Air Conditioning and anti icing Weight
%F_W Furnishings
        
%Total Weight:-
Wtot = W_W + HT_W + VT_W + FUS_W + MLG_W + NLG_W + IE_W + FS_W + FCS_W + HS_W + AS_W + ES_W + AC_W + F_W   ;

end