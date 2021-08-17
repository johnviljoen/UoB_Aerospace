classdef constants
    %   constants class
    %   obj=constants(H,temp)
    
    properties
        H = 0;                      % [km], Altitude
        temp = 288;                 % [Kalvin], Temperature
        g = 9.81;                   % [m/s^2], Gravity
    end
    
    properties (Constant, Access = protected)
        rho0 = 1.225;               % [kg/m^3], Air density at sea level
        gamma = 1.4;                % [-], Gas constant
        R_gas = 286;                % [-], Gas constant
    end
    properties (Dependent)
        rho                         % [kg/m^3], Air density at
        ss                          % [m/s], Speed of sound
    end
    
    methods
        function obj = constants(H, temp)
            if nargin == 2
                obj.H    = H;
                obj.temp = temp;
            elseif nargin == 1
                obj.H    = H;
            end
        end
        %% identify function
        function identify_c(obj)
            disp(['This is the constant object for H = ' num2str(obj.H)...
                '[Km] and temperature = ' num2str(obj.temp) '[Kelvin].']);
        end
        %% rho getter function
        function rho = get.rho(obj)
            sigma_h = (20-obj.H)/(20+obj.H);  % [-], Relative density ratio
            rho = obj.rho0*sigma_h;  % [kg/m^3], Air density
        end
        %% Speed of Sound getter function
        function ss = get.ss(obj)
            ss=sqrt(obj.gamma.*obj.R_gas.*obj.temp);  % [m/s], Speed of sound
        end
    end
    
end

