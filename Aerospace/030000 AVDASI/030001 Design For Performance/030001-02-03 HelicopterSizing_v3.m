function data = HelicopterSizing_v3
% Initial sizing function For Preliminary Helicopter Design
% Note: this is just a simple template and you should take it just as an 
% example on how to conduct basic initial sizing of a penny-farthing 
% helicopter configuration (mainly). you can develop this function further by 
% updating the equations used or adding new ones for sizing other components 
%
% Updated by Dr Rezgui 2020


%% Estimation of AUW
PL_kg = 600; % Payload [kg], from requirment spec
PL_lb  = PL_kg*2.20462;    % Payload [lb], from requirment spec
FLF = 1;            % Fuel Load Fraction, assume default 1(i.e. 100%)
FL_lb  = FLF.*PL_lb;      % Fuel load, make a good guess (=100% Payload)

% If you can estimate the fuel load, then just input the value
% FL  = 1;  % FuelLoad [lb], from knowledge, judgment or as you start the
% iteration proces

MDW_lb = PL_lb + FL_lb;      % Mission Disposable Weight [lb]
DWF = 0.4;         % Disposable Weight Fraction of AUW is typically 25% to 30% of AUW for 
                    % small helicopters and 35% to 40% of AUW for large helicopters
                    % Other equipments can also increase this by 5% to 10%
            
AUW_lb = MDW_lb./DWF;     % All Up Weight [lb], calculated based on some good guesses            
AUW_kg = AUW_lb/2.20462;  % All Up Weight [kg]
%% Estimation of Main Rotor Diameter 
DL_lb_ft2 = 5;      % Disc loading [lb/ft^2]
                    % Roughly 4 - 10 lb/ft^2 for small helicopters, and upto 12 lb/ft^2 for 
                    % large helicopter. Smaller helicopters should well below 10 lb/ft^2.
            
Adisc_MR_ft2    = AUW_lb./DL_lb_ft2;    % Min Rotor (MR) disc area (ft^2)

% Adisc_MR_m2    = ft2m(ft2m(Adisc_MR_ft2));   % Min Rotor (MR) disc area (m^2)

R_MR_ft     = sqrt(Adisc_MR_ft2./pi);   % Main Rotor (MR)raduis (ft)
R_MR_m        = ft2m(R_MR_ft);            % convert from ft to meters
%% Estimation of Main Rotor Speed
% Estimation of Main Rotor Speed based on compressibility limit
h_ft = 1000;            % Altitude [ft]
H = ft2m(h_ft)./1000;   % Altitude [km]
temp = 273.15 + 15;     % Temperature [kelvin], you can also calculate this based on the altitue
const=constants(H,temp);
ss  = const.ss;         % speed of sound
rho = const.rho;        % air sensity

M_crit = 0.85;          % Estimate the M_crit: the drag rise Mach number at 95% blade radius

V_crit = SpeedFunc(M_crit, ss); % Estimate the V_crit: the drag rise Velocity at 95% blade radius
            
Vf_kts = 140;                   % Max Forward helicopter speed [kts], this value can depend on the mission requirements
Vf_mps = kts2mps(Vf_kts);       % Forward helicopter speed [m/s]

V_adv95 = V_crit - Vf_mps;      % Max Blade translational velocity due to rotation at advancing side [m/s] at 95% of blade raduis
Vtip_MR_mps_c = V_adv95./0.95;  % Max Tip Speed of Main Rotor [m/sec]
% Vtip_MR_fps_c = m2ft(Vtip_MR_mps_c); % Max Tip Speed of Main Rotor [ft/sec]

Omega_MR_max_c = Vtip_MR_mps_c./R_MR_m;       % Max Main Rotor rotational speed [rad/s]
Omega_MR_max_rpm_c = Omega_MR_max_c*30/pi;  % Max Main Rotor rotational speed [rpm]

% Estimation of Main Rotor Speed based on noise limit
Vtip_MR_fps_n = 680;                    % Estimate Max Tip Speed of Main Rotor [ft/sec]
Vtip_MR_mps_n = ft2m(Vtip_MR_fps_n);    % Max Tip Speed of Main Rotor [m/sec]

Omega_MR_max_n      = Vtip_MR_mps_n./R_MR_m;  % Max Main Rotor rotational speed [rad/s]
Omega_MR_max_rpm_n  = Omega_MR_max_n*30/pi; % Max Main Rotor rotational speed [rpm]

% Pick the lowest rotor rpm based on both limits (compressiblity or noise)
Omega_MR_rpm = min([Omega_MR_max_rpm_c ;Omega_MR_max_rpm_n],[],1); % Main rotor speed [rpm]
% Omega_MR_rpm = min([Omega_MR_max_rpm_c Omega_MR_max_rpm_n]); % Main rotor speed [rpm]

% you can choose a different lower value if you wwant:
% Omega_MR_rpm = ???

Omega_MR    = Omega_MR_rpm*pi/30;   % Selected Main Rotor rotational speed [rad/s]
Vtip_MR_mps = Omega_MR.*R_MR_m;       % Tip Speed of Main Rotor [m/sec]
Vtip_MR_fps = m2ft(Vtip_MR_mps);    % Tip Speed of Main Rotor [ft/sec]

%% Estimation of Tail Rotor Speed
d_Vtip_TR_fps = 20; % Difference of Tip Speed of Tail Rotor [ft/sec] relative to main rotor tip speed
                    % Usualy 20 to 30 ft/sec less than V_tip_MR
Vtip_TR_fps = Vtip_MR_fps - d_Vtip_TR_fps;  % Tip Speed of Main Rotor [fps]
Vtip_TR_mps = ft2m(Vtip_TR_fps);            % Tip Speed of Main Rotor [m/sec]

%% Estimate the tail rotor Radius
TR_ratio = 1/5; % The tail rotor diameter is likely to be something between 
                % 1/6th and 1/5th of the main rotor diameter
                
R_TR_m = R_MR_m.* TR_ratio;
Omega_TR        = Vtip_TR_mps./R_TR_m;    % Max Main Rotor rotational speed [rad/s]
Omega_TR_rpm    = Omega_TR*30/pi;       % Max Main Rotor rotational speed [rpm]

%% 
% Need a graph of AUW/NCR vs EAS (Equavallent Air speed )--> find NCR

% Alternatively, we can find blade area NCR from blade loading (Cw/s) curve vs.
% advance ratio mu. This plot define the blade stall limits in forward
% flight condition. See plot in the lecture slides or the "Initial Design
% Guide", see guide for more details
% Choose a low blade loading --> technology level 5

% Advance Ratio
mu = Vf_mps./Vtip_MR_mps;

% from the plot read Cw/s based on the calculated advance ratio
Cws = 0.15; % This is just an example

% Therefore, the blade area A_b = NRc is:
T = AUW_lb*0.453592*9.81; % USe the max Thurst needed at the limiting max speed case. 
                          % You can also add the effect of the download of the wake on the fuselage
NRc = T./(0.5*Cws.*rho.*Vtip_MR_mps.^2);

for i=1:8 % number of blades
    N(i,1)=i;
    c(i,:) = NRc./(N(i,:).*R_MR_m); % chord
    AR(i,:)= R_MR_m./c(i,:); % Blade aspect ratio 
end
disp('Num. of Blades   AR     chord')
disp([N , AR, c])
  

% Power loading
FoM =0.7; % This is just an assumption. You can use power equations in the sizing guide
          % or the AW spreadsheet

DL_SI   = T./(pi*R_MR_m.^2); % Disc Loading (SI unit) [N/m^2]
PowL_SI = FoM.*sqrt(2*rho./DL_SI); % Power Laoding in hover case
Pow     = T./PowL_SI/1000; % in KW
%% Output
data.PL_kg  = PL_kg;
data.PL_lb  = PL_lb;
data.FL_lb  = FL_lb;
data.MDW_lb = MDW_lb;
data.AUW_lb = AUW_lb;
data.AUW_kg = AUW_kg;
data.R_MR_m = R_MR_m;
data.R_TR_m = R_TR_m;
data.Vtip_MR_fps  = Vtip_MR_fps;
data.Vtip_TR_fps  = Vtip_TR_fps;
data.Omega_MR_rpm = Omega_MR_rpm;
data.Omega_TR_rpm = Omega_TR_rpm;
data.mu = mu;
data.NRc = NRc;
data.N  = N;
data.c  = c;
data.AR = AR;
data.PowL_SI = PowL_SI;
data.Pow     = Pow;


end


%% Functions
function V = SpeedFunc(M, ss)

V = M.*ss; % ss is the speed of sound
end

function [ y ] = m2ft( x )
% [ y ] = m2ft( x )
% m2ft converts a length in metres to feet
% Inputs:
% x = length [m]
% Outputs:
% y = length [ft]
y = x/0.3048;
end
function [ y ] = ft2m( x )
% [ y ] = ft2m( x )
% ft2m converts a length in feet to metres
% Inputs:
% x = length [ft]
% Outputs:
% y = length [m]
y = 0.3048*x;
end
function [ y ] = kts2mps( x )
%[ y ] = kts2mps( x )
%kts2mps converts a speed from knots to metres per second
%   Inputs:
%   x = Airspeed [kts]
%   Outputs: 
%   y = Airspeed [m/s]
y = x*0.514444;
end
function [ y ] = mps2kts( x )
%[ y ] = mps2kts( x )
%mps2kts converts a speed from metres per second to knots
%   Inputs:
%   x = Airspeed [m/s]
%   Outputs: 
%   y = Airspeed [kts]
y = x*1.94384;
end