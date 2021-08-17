% This function generates the coupler curve for a four bar crank rocker or a double crank (and not any general four bar)
%
% How to run:
% 1. Pleace the file in a folder
% 2. Run MATLAB
% 3. In the MATLAB Command Window select the folder where the file is.
% 4. Go to Open File and open the file
% 5. Go to Debug --> Run
% 6. Follow Instructions on the screen
% MATLAB TIP: Press Control + C to get out of a loop if you get stuck in one  
%
% Original version from Shorya Awtar 01/27/2002
% Modified by Fabrizio Scarpa 01/11/2006

function four_bar_Graf

disp(' ')
disp(' function FOUR_BAR_GRAF ')
disp(' This function generates the coupler curve for a Grashofian four bar crank follower.')
disp(' a, b, c, and d define the four bar linkage. a is the crank, b is the coupler, c is the follower,')
disp(' and d is the ground link. For a valid crank-follower mechanism the following conditions have to hold:')
disp(' 1. Sum of lengths of the shortest and longest link is less than the sum of the length of the other two links')
disp(' 2. The shortest link is either the crank or the ground')
disp(' The generated plot represents the path followed by a coupler point defined by r and phi.')
disp(' ')

clf;
clear;

% Input the four specification provided by the user

V = input('Enter these parameters in the following format [a b c d r phi(in deg)] and hit enter \n');
a=V(1); b=V(2); c=V(3); d=V(4); r=V(5); f=V(6)*pi/180;

% Check if the mechanism is Grashofian

shortest=min(V(1:4));
longest=max(V(1:4));
P=shortest + longest;
Q=sum(V(1:4))- P;

% The following check rejects the mechanism specified by the user and prompts the user to enter another mechanism specification if the current
% spcification is not purely Grashofian

if P>Q
    disp(' ')
    disp('The linkage that you have specified is non-Grashofian. Please use another set of linkage parameters')
    fourbar
elseif P==Q
    disp(' ')
    disp('The linkage that you have specified is Grashofian with a toggle condition that leads to a mathematical singularity.')
    disp('Use a physical model(e.g. Solidworks, ADAMS) to analyze this situation.')
    disp(' ')
    disp('Enter another set of linkage parameters to continue.')
    fourbar
end

% If the mechanism IS purely Grashofian then the program proceeds to check if the specified mechanism is in the crank-rocker or
% double crank configuration. If the specified Grashofian mechanism is in a double rocker mode, the following routine rejects it
% and prompts the user to enter a new mechanism specification

if a==min(V(1:4)) | d==min(V(1:4))
    disp(' ')
    disp('The linkage specification meets the necessary conditions for a happy crank follower')
    disp(' ')
    disp('Proceeding to generate coupler curve.')
else 
    disp(' ')
    disp('Although the specified linkage is Grashofian, the conditions necessary for a happy crank-follower are not met')
    disp(' ')
    disp('Enter another set of linkage parameters to continue.')
    fourbar
end

% For a given set of four bar specification, the mechanism can be parallel or anti-parallel
% Ask your instructor/TA for more details on this

s = input('Enter 1 for a parallel mechanism and -1 for an antiparallel mechanism \n');
s=s/abs(s);

x1=0; y1=0; %coordinates of the crank ground point : Point 1
x4=d; y4=0; %Coordinates of the follower ground point: Point 4

% The following lines of code determines the starting configuration of the mechanism
% This is based on the standard cosine formulars and other triangle properties used for analyzing four-bar linkages

n=0;
    theta1=n*360/20*pi/180;    
    x2=a*cos(theta1); % x cooridnate of the crank moving point: Point 2
    y2=a*sin(theta1); % y cooridnate of the crank moving point: Point 2
    e = sqrt((x2-d)^2+y2^2);
    phi2=acos((e^2+c^2-b^2)/(2*e*c));
    phi1=atan(y2/(x2-d))+(1-sign(x2-d))*pi/2; %Bug in the code: this has a problem if x2 is zero, but that almost never happens

    theta3=phi1-s*phi2;
    x3=c*cos(theta3)+d; % x cooridnate of the follower moving point: Point 3
    y3=c*sin(theta3); % y cooridnate of the crank moving point: Point 3
    
    theta2=atan((y3-y2)/(x3-x2))+(1-sign(x3-x2))*pi/2; %Bug in the code: There is an problem with this step if x3-x2 is zero, but that rarely happens
    phi3=theta2+f;
    
    x5=x2+r*cos(phi3); % x cooridnate of the coupler point: Point 5
    y5=y2+r*sin(phi3); % y cooridnate of the coupler point: Point 5

    x=[x1 x2 x3 x4];
    y=[y1 y2 y3 y4];
    u=[x2 x3 x5];
    v=[y2 y3 y5];
    
    % The following lines specifies the plots that will be animated, and the data that will be updated
    tf1=figure(1);
    if P == Q
        title(' 4-bar Grashofian linkage with toggle condition ')
    elseif P > Q
        title(' 4-bar Grashofian linkage ')
    end
    
    if s == 1
        xlabel('Parallel mechanism')
    else
        xlabel('Anti-Parallel mechanism')
    end
    
    set(gcf,'Color',[1 1 1]);
    t=plot(x5,y5,'r.','EraseMode','none'); % Plots the coupler point in red
    hold on
    p=plot(x,y,'bo-','EraseMode','xor'); % Plots the fourbar in blue as a stick figure
    q=fill(u,v,'g','EraseMode','xor'); % Plots the coupler in solid green
   
    scale=max(V(1:5)); % This just picks up the largest dimension in the mechanism so as to scale the output display appropriately
    axis([-scale scale -scale scale])
    axis equal

% The following lines of code determines the new configurations of the mechanism for an incrementally varying position of the crank
% This is based on the standard cosine formulars and other triangle properties used for analyzing four-bar linkages



for n=1:1000,
    theta1=n*360/1000*pi/180;   
    x2=a*cos(theta1);
    y2=a*sin(theta1);
    e = sqrt((x2-d)^2+y2^2);
    phi2=acos((e^2+c^2-b^2)/(2*e*c));
    phi1=atan(y2/(x2-d))+(1-sign(x2-d))*pi/2; %Bug in the code: this has a problem if x2 is zero, but that almost never happens

    theta3=phi1-s*phi2;
    x3=c*cos(theta3)+d;
    y3=c*sin(theta3);

    theta2=atan((y3-y2)/(x3-x2))+(1-sign(x3-x2))*pi/2; %Bug in the code: There is an problem with this step if x3-x2 is zero, but that rarely happens
    phi3=theta2+f;
    
    x5=x2+r*cos(phi3);
    y5=y2+r*sin(phi3);
    
    x=[x1 x2 x3 x4];
    y=[y1 y2 y3 y4];
    u=[x2 x3 x5];
    v=[y2 y3 y5]; 
    
    % The following lines erase the previous data on the figure, and plots the new data
    % This produces an animation effect
    
    set(t,'XData',x5,'YData',y5)
    set(p,'XData',x,'YData',y)
    set(q,'XData',u,'YData',v)
    drawnow
    pause(0.02)
end

return



