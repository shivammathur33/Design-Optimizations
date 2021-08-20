function NLG_W = WNLG (nl , Wl , Ln)
% This function calculates the Nose Landing Gear Weight

%nl = ultimate landing load factor
%Wl = design landing weight in lbf
%Ln = length of the nose landing gear strut in inches

NLG_W = 0.125 * ((nl*Wl)^0.566) * ((Ln/12)^0.845);

% NLG_W = Nose Landing Gear Weight

end