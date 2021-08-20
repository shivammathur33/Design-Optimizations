% Weight Optimization
% All units in lb,ft,s,lbf,gal

clc
clear
%%  Parameters

w0 = 3993;          %Design gross weight in lb
nocc = 10;          %no. of occupants
M = 0.75;           %Mach number
WUAV = 400;         %weight of uninstalled avionics in lb
lFS =28;            %length of fusalge structure in ft
nZ = 5;             %Ultimate load factor
b = 1;              %Wingspan in ft (initialized to 1 varied iteratively in loop)
Qtot = 96.877 ;     %Total fuel quantity in gallons
Qint = 96.877;      %Total fuel quantity in integral fuel tanks
nTank = 2;          %Number of fuel tanks
sFus = 1;           %fuslage wetted area (initialized to 1 varied iteratively in loop)
lHt =0.475*lFS;     %Horizontal tail arm, from wing C/4 to HT C/4 
dFs = 8.4;          %Depth of fuselage structure
v_to = 116.400;     %take- =off velocity
v_kn = 250;         %Cruise velocity in KTAS
v_cr=v_kn*1.68781;  %Cruise velocity in ft/s
d_15000 = 14.96e-4; %Density at 15000ft 
q=0.5*d_15000*v_cr^2;%Dynamic pressure at cruise, 0.5 rho v2
vP =529.72;         %Volume of pressurized cabin section ft^3
dP = 4.15;          %Cabin pressure differential, in psi
tTc =0.145;         %Wing Thinkness to Chord Ratio(eppler 421 airfoil)
tTc2 = 0.12;        %Wing Thinkness to Chord Ratio(NACA 0012 airfoil)
hS= 25;             %ht %sweep at 25% MGC - ashmita  VAR (OPTIMIZATION)
aR = 10;            %Aspect Ratio - ca
tR = 0.5;           %Wing taper ratio 
WENG = 300;         %Uninstalled engine weight in lbf - williams FJ33.
NENG = 1;           %Number of fuel engines
nl = 4;             %Ultimate landing load factor - khalil NOT SURE
Wl = 1;             %Design landing weight in lbf - (RATIOS)
lM = 35.4;          %Length of the main landing gear strut in inches
lN = 27.6;          %Length of the nose landing gear strut in inches
fT = 1;             %Ftail = 1 (because of T tail).
vS = 25;            %VT sweep at 25% MGC - ashmita  VAR (OPTIMIZATION)
sW = 138;           %Trapezoidal wing area in ft^2 - ca
wFw =1;             %Weight of fuel in wing in lbf - density of fuel (300.7 KG)
wS = 20;            %Wing sweep at 25% MGC - ashmita 
sVt =0.25*sW;       %Trapezoidal VT area in ft^2 - ashmita  VAR (OPTIMIZATION)
sHt =0.3*(sW);      % trapezoidal ht area var
ctr =1;             % Loop Counter
w_s = 28.75;        %Wing loading from CA (lb/ft2)
S=1;                %Wing Surface area
%% Iterative Process
w1 = w0;            %previous iteration's weight
w2 = 0;             %new weight calculated (in present iteration)
while ctr < 100
    
   wFw = w1 * 1.06*(1-0.8928719717); % From total fuel fraction equation
   S = double(w1/w_s); %Wing surface area     
   b = sqrt(S*aR);     % Wingspan     
   Wl=w1*0.9201;       % Landing wt    
   sFus = 5.5*S;       % 5.5 * S
   
   
   % Sub Weights Calculation, refer documentation for abbrevations
   W_W = WW(sW , wFw , aR , wS , q , tR , tTc , nZ , w1); 
   W_VT = WVT(fT , nZ , w1 , q , sVt , tTc2 , vS , aR , tR); 
   W_NLG = WNLG(nl , Wl , lN);
   W_MLG = WMLG(nl , Wl , lM);
   W_IE = WIE(WENG , NENG);
   W_HT = WHT(nZ,w1,q,sHt,tTc2,hS,aR,tR);
   W_HS = WHS(w1);
   W_FUS = WFUS(sFus , nZ , w1 , lHt , lFS , dFs , q , vP , dP);
   Wl = 0.87*w1;
   W_FS = WFS(Qtot,Qint,nTank,NENG);
   W_FCS = WFCS(lFS , b ,  nZ , w1);
   F_W = WF(w1);
   W_AS = WAS(WUAV);
   W_ES = WES(W_FS,W_AS);
   W_AC = WAC(w1,nocc,W_AS,M); 
   
   
   %Total weight calculation:
   w2 = TotalWeight(W_W , W_HT ,W_VT , W_FUS , W_MLG , W_NLG , W_IE , W_FS , W_FCS , W_HS , W_AS , W_ES , W_AC , F_W); 
   dev = deviation(w1,w2); % calculating deviation
   
   fprintf("--------------------------------------------------\n");
   fprintf("\nIteration# %d\n",ctr);
   
   %Printing sub Weights, total weight and deviation for every iteration:
   fprintf("W_W %d lbs\n",W_W);
   fprintf("W_HT %d lbs\n",W_HT);
   fprintf("W_VT %d lbs\n",W_VT);
   fprintf("W_FUS %d lbs\n",W_FUS);
   fprintf("W_MLG %d lbs\n",W_MLG);
   fprintf("W_NLG %d lbs\n",W_NLG);
   fprintf("W_IE %d lbs\n",W_IE);   
   fprintf("W_FS %d lbs\n",W_FS);
   fprintf("W_FCS %d lbs\n",W_FCS);
   fprintf("W_HS %d lbs\n",W_HS);
   fprintf("W_AS %d lbs\n",W_AS);
   fprintf("W_ES %d lbs\n",W_ES);
   fprintf("W_AC %d lbs\n",W_AC);
   fprintf("W_W %d lbs\n",W_W);
   fprintf("F_W %d lbs\n",F_W);
   
   fprintf("\nTotal Weight = %d lbs\n",w2);
   fprintf("Deviation from last iteration = %d\n",dev);
   
   %Break from loop if deviation < 1e-5
   if(abs(dev) <= (1e-5))      
       break
   end
   
   %Replace new calculated weight for next iteration
   w1=w2;
   
   wPlot(ctr,1) = w2; 
   ctrPlot(ctr,1)= ctr;
   devPlot(ctr,1)= dev;
   
   %Increment loop counter
   ctr=ctr+1;  
end  
% xlswrite('opPlots.xlsx', ctrPlot,'sheet 1','A2');
% xlswrite('opPlots.xlsx', wPlot,'sheet 1','B2');
% xlswrite('opPlots.xlsx', devPlot,'sheet 1','C2');

fprintf("____________________________________________________________\n");
fprintf("Optimized weight of aircraft = %d lbs\n",w2);
fprintf("____________________________________________________________\n");

% plot(ctrPlot,wPlot);
% hold on
% plot(ctrPlot,devPlot)

