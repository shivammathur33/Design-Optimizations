function MLG_W = WMLG (nl , Wl , Lm)
% This function calculates the Main Landing Gear Weight

%nl = ultimate landing load factor
%Wl = design landing weight in lbf
%Lm = length of the main landing gear strut in inches

MLG_W = 0.095 * ((nl*Wl)^0.768) * ((Lm/12)^0.409);

% MLG_W = Main Landing Gear Weight

end