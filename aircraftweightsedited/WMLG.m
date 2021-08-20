function MLG_W = WMLG (nl , Wl , Lm)
% This function calculates the Main Landing Gear Weight

%nl = input('Ultimate landing load factor\n');                              %nl = ultimate landing load factor
%Wl = input('Design landing weight in lbf\n');                              %Wl = design landing weight in lbf
%Lm = input('Length of the main landing gear strut in inches\n');           %Lm = length of the main landing gear strut in inches

MLG_W = 0.095 * ((nl*Wl)^0.768) * ((Lm/12)^0.409);

% MLG_W = Main Landing Gear Weight

end