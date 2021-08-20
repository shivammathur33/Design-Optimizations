function IE_W = WIE (WENG , NENG)
%This function calculates the Installed Engine Weight

%WENG = uninstalled engine weight in lbf
%NENG = number of engines

IE_W = 2.575 * (WENG^0.922) * NENG;

% IE_W = Installed Engine Weight

end
