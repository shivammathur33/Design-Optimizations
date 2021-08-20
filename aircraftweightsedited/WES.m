function ES_W = WES (FS_W,AS_W)
%This function calculates the Electrical system Weight 

% FS_W = Fuel system weight (calculated by the function WFS)               #value from main
% AS_W = Avionics System Weight (calculated by the function WAS)           #value from main

ES_W = 12.57 * ((FS_W + AS_W)^0.51);

% ES_W = Electrical system Weight 

end