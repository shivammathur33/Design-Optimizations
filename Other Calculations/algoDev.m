%%  Constants

w0 = 3993;
nocc = 10;
M = 0.75;
lfs = 20;
nZ = 0;
b = 0; %var Wingspan in ft
Qtot = 366.72;
Qint = 428;
nTank = 2;
nEng = 2;
sFus = 0;%* var
lHt =0; %* var
dFs =0;
q =0; %0.5 rho v2
vP =0;
dp =0;
sHt =0; % trapezoidal ht area var
tTc =0; % group check airfoil
hS= 0; % * ht %sweep at 25% MGC - ashmita  VAR (OPTIMIZATION)
aR = 10; % * var Aspect Ratio - ca
tR = 0.5; %Wing taper ratio 
WENG = 300; %Uninstalled engine weight in lbf - williams FJ33.
nl = 0; %%Ultimate landing load factor - khalil NOT SURE
Wl = 0; %Design landing weight in lbf - (RATIOS)
lM = 0; %Length of the main landing gear strut in inches
lN = 0; %Length of the nose landing gear strut in inches
fT = 1; 
VS = 0; % *VT sweep at 25% MGC - ashmita  VAR (OPTIMIZATION)
SVT =0; % * Trapezoidal VT area in ft^2 - ashmita  VAR (OPTIMIZATION)
SW =0;  % * Trapezoidal wing area in ft^2 - ca
wFw =0; %Weight of fuel in wing in lbf - density of fuel (300.7 KG)
WS =0;  %Wing sweep at 25% MGC - ashmita 

ctr =0; % Loop Counter

w_s = 1:0.25:50.75; %Wing loading assumptions



%% Iterative Process
w1 = w0;
w2 = 0;
while 1
    
   wFw = w1 * 1.06*(1-0.87);
   S = w0 /w_s(ctr); %Wing Area
   b = sqrt(S*AR); %Wing span
   
   
   
   
    
   w2 = 0 ; % Total weight calc func (rashi)
    
   dev = devation(w1,w2);
   fprintf(dev);
    
   w1=w2;
   if ctr == 100
       break
   end          
end    
