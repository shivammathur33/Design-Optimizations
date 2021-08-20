function NLG_W = WNLG (nl , Wl , Ln)
% This function calculates the Nose Landing Gear Weight

%nl = input('Ultimate landing load factor\n');                              %nl = ultimate landing load factor
%Wl = input('Design landing weight in lbf\n');                              %Wl = design landing weight in lbf
%Ln = input('Length of the nose landing gear strut in inches\n');           %Ln = length of the nose landing gear strut in inches

NLG_W = 0.125 * ((nl*Wl)^0.566) * ((Ln/12)^0.845);

% NLG_W = Nose Landing Gear Weight

end