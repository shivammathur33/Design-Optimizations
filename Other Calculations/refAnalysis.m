% Constraint Analysis
% All units in lb, ft, s, lbf

clc
clear
close all

%% Constants

gw = 3993; %1625kg - Gross weight
g = 32.174; %Gravitational Constant ft/s^2

d_20000 = 12.67e-4; %Density at 20000ft
d_15000 = 14.96e-4; %Density at 15000ft
d_sl = 23.77e-4; %Density at sea level

CDmin = 0.02; %from historical data

AR = 10; %Aspect Ratio
%e = 0.810; %Oswald's factor
e = 1.78 * (1 - (0.045 * (AR^0.68))) - 0.64;
k = 1 / (pi*e*AR);

v_s = 97; %Stall speed ft/s
v_kn = 250; %Cruise velocity in KTAS
v_cr = v_kn * 1.68781; %Cruise velocity in ft/s

w_s = 1:0.25:50.75; %Wing loading assumptions for plotting graph

wl_g = 28 * 4;

CLmx = 2.6;

%% CLmax 

q_s = 0.5 * d_sl * v_s^2; %Dynamic pressure on stall

for i = 1:200
    CLmax(i) = w_s(i) / q_s;
end

CL_max = CLmax(wl_g); %CL max
wing_loading = w_s(wl_g);
S = gw / wing_loading; %Wing Area
b = sqrt(S*AR); %Wing span

subplot(2, 1, 2)
plot(w_s, CLmax)
grid on;
xlabel('W/S');
ylabel('CLmax');
axis([0, 45, 0, 4])

%% Takeoff Requirement

v_to = 1.2 * v_s; %Take off velocity
CL_to = CLmx / 1.21;
sig = 1; %Density ratio
q_to = 0.5 * d_sl * sig * (v_to/sqrt(2))^2; %Take off dynamic pressure
k1 = 0.85; %avg acceleration factor
nu = 0.03; %Ground Friction Coeff
Sg = 900; %Ground Run

for i = 1:200
    t_w(i) = (1.44*w_s(i) / (Sg*k1*g*d_sl*CL_to)) + nu;
end
tw_to = t_w(wl_g);
t_to = tw_to * gw; %Min thrust required to take off
S_to = Sg * 1.66;
subplot(2, 1, 1)
plot(w_s, t_w, 'g')
hold on;
grid on;

%% Landing Requirement

CL_mxl = CL_to / 0.8;
a = 0:0.1:1; %Random Variable to plot constant wing loading
w_app = 1;

w_s_land = 0.3 * g * 0.75 * 1500 * CL_mxl * d_sl / (1.69 * w_app);
w_s_land = w_s_land * ones(1, length(a));

subplot(2,1,1)
plot(w_s_land, a, 'c')

%% Cruise Requirement

q_cr = 0.5 * d_15000 * v_cr^2; %Cruise dynamic pressure
w_cr = 1;
del_cr = 0.65;

for i = 1:200
    t_w(i) = ((CDmin*q_cr)/w_s(i)) + (k*w_cr^2*w_s(i)/(q_cr*del_cr));
end

tw_cr = t_w(wl_g);
t_cruise = t_w(wl_g) * gw; %Min thrust required to cruise
subplot(2, 1, 1)
plot(w_s, t_w, '--')

%% Climb Requirement

%climb_angle = 7; %degrees
%CLmax = 2.7;
roc = 28.33; %Rate of climb in ft/s
v_roc = roc / sind(7); %Airspeed on climb
q_roc = 0.5 * (d_sl+d_15000)/2 * v_roc^2; %Climb dynamic pressure
w_climb = 1;

%for i=1:200
%    t_w(i) = sind(climb_angle) + 1/(0.8*CLmax/CDmin);
%end

for i=1:200
    t_w(i) = (roc/v_roc) + (q_roc*CDmin/w_s(i)) + (k*w_s(i)/q_roc);
end

tw_climb = t_w(wl_g);
t_climb = t_w(wl_g) * gw * w_climb; %Min thrust required during climb
subplot(2, 1, 1)
plot(w_s, t_w, 'r')

xlabel('W/S');
ylabel('T/W');
legend('TO', 'Landing', 'Cruise', 'Climb');
axis([0, 50, 0, .6])

%% Constant Calculation

L_D = 0.5 * sqrt(1/(k*CDmin)); %Aerodynamic Efficiency

c = b/AR/3.281; %Approximate chord length in meters