%% MXB103 Project Group 64:  BUNGEE!

%% 1  Introduction
% As part of Brisbane's "New World City" transformation, the Brisbane City
% Council is investigating a proposal to allow bungee jumping off the
% Story Bridge. This report addresses several key questions about the
% proposal.
%
% In Section 2 of this report, the proposal and the key questions relating 
% to it are discussed in more detail. In Section 3, the equation of motion
% for the bungee jump is presented as well as steps which were taken to
% derive the model. This is followed by summarizing the meaning of each
% symbol used in the model. Section 3.1 touches on the assumptions and 
% limitations regarding the model and the conducted study. The parameters
% are then defined in section 3.2. Continuing in Section 4, the second 
% order numerical method is introduced and the jumper’s position against 
% time is plotted on a graph. In section 5, the model predictions are 
% analysed with respect to the key questions being asked about the 
% proposal. Finally, in section 6, the report comes to the conclusion and  
% findings and recommendations will be discussed.

%% 2  The proposal
% The Brisbane City Council is proposing to allow bungee jumping off the 
% Story Bridge. A commercial bungee jump company has provided the Council  
% with measurements regarding the operation of the bungee jumping from the 
% Story Bridge. Our team has been hired to verify the commercial bungee 
% jump company's measurements and answer various key questions regarding 
% the proposal. These questions include:
%
% * Whether or not the jumper will bounce 10 times in approximately 60
% seconds during the jump
% * How much "thrill factor" the ride has; what is the fastest speed the  
% jumper will experience and when does the jumper experience it?
% * How much "thrill factor" the ride has; is the bungee jump company's  
% claim that the jumper will experience acceleration  "up to 2g" accurate 
% and what is the maximum acceleration the jumper will experience and when 
% does the jumper experience it?
% * How far does the jumper travel in the 60-second jump?
% * At what time from the start of the jump does the jumper pass the deck?
% * How can the rope be modified to incorporate a "water touch" option  
% where the jumper just touches the water at the first bounce without 
% reaching acceleration greater than 2g while keeping as close as possible 
% to 10 bounces in 60 seconds?
%
% The questions will be approached using the Modified Euler Method to model 
% the jumper's distance, speed, and acceleration against time. Separate  
% functions will then be used to analyse and identify key values relating 
% to the questions. The Modified Euler Method attempts to model the motion 
% of the bungee jump as shown in the original model below.

%% 3 The model
%
% The equation of motion for bungee jumping is
%
% $$\frac{dv}{dt} = g - C|v|v - \max(0,K(y-L))$$
%
% The model has been derived by considering the forces of gravity, drag and
% tention acting on the jumper at all times. Keeping in mind,
% 
% Gravity = mg (acting downwards)
%
% Drag = -c|v|v (acting in opposite direction of motion)
%
% Tension  = - max(0, k(y - L)) (acting upwards)
% 
% Where:
%
% m = Mass of the jumper
%
% g = Gravitational acceleration
%
% c = Drag coefficient 
%
% v = Velocity of the jumper
%
% k = Spring constant
%
% y = Position of the jumper
%
% L = Length of the unstretched rope
%
% Moreover, Newton’s second law of motion says that the sum of these forces
% must equal the product of the jumper’s mass and acceleration.
% Therfore, equation governing the bungee jumping is the following ordinary
% differential equation (ODE):
%
% $$m(dv/dt) = mg-c|v|v-max(0,k(y-L))$$
%
% Where dv/dt is the jumper’s acceleration.  The equation can be simplified
% by dividing through by m, to obtain:
%
% $$dv/dt = g-C|v|v-max(0,K(y-L))$$
% 
% Where: 
%
% $$C = c/m$$
%
% $$K = k/m$$

%% 3.1 Assumptions and limitations
%
% In this model, there will be a range of assumptions that will have to be
% taken into consideration in order to produce usable results and figures.
% The assumptions are as follows: The drag experienced by the jumper is
% constant, the bounces are always vertically upright, the jumper weighs
% 80kg and they will not attempt to do anything that will impact their
% trajectory. The limitations of this model include not accounting for
% different possible bounces (in different directions) and also
% catastrophic cancellation, which might negatively influence the accuracy
% produced by the model.
%
% In the study that we have conducted, there are some limitations which 
% might have a negative influence on the accuracy of the results in certain
% scenarios which have not been accounted for. The height of the jumper,
% when attached to the rope, has not been considered . Our study did not
% take into account adverse weather or any other unpredictable forces which
% might affect the trajectory of the jumper. Our study also includes
% methods and formulas which might contain very minor inaccuracies or
% roundoff errors. Due to the fact that multiple of these methods have been
% used in succession, the inaccuracies might build up and have a slightly
% larger effect on the results.

%% 3.2 Parameters
H = 74;             % Height of jump point (m)
D = 31;             % Deck height (m)
c = 0.9;            % Drag coefficient (kg/m)
m = 80;             % Mass of the jumper (kg)
L = 25;             % Length of bungee cord (m)
k = 90;             % Spring constant of bungee cord (N/m)
g = 9.8;            % Gravitational acceleration (m/s^2)
C = c/m;            % Scaled drag coefficient
K = k/m;            % Scaled spring constant

%% 4 The numerical method
% The Modified Euler Method was chosen as our second order or higher
% numerical method as its more accurate than the Euler method and more
% convenient to implement over the Second Order Taylor Method. It solves 
% the ODEs using a numerical approximation of the derivative and then using 
% Euler’s method to re-approximate the right-hand side of the equation.
%
% $$k1 = h*f(v(j), y(j));$$
%
% $$k2 = h*f(v(j) + h, y(j) + k1);$$
%
% $$v(j+1) = v(j) + 0.5*(k1 + k2);$$

%% 4.1 Parameters

T = 60;             % Final time in simulation (s)
n = 100000;          % Number of subintervals 

%% 4.2 Solution
%
% The ordinary differential equations are solved using modified Euler 
% method.
[t, y, v, h] = modified_euler_bungee(T, n, g, C, K, L);

% Plotting jumper’s position against time.
figure(1)
plot(t, y);
xlabel('Time (s)');
ylabel('Distance fallen (m)');
title('Figure 1: Jumper’s position against time');

%% 5 Analysis
%
% In this section, the model predictions are analysed with respect to the
% key questions being asked about the proposal.
%
%% 5.1 Timing and bounces
% The bungee company suggests that the standard jump will consist of 10
% bounces in 60 seconds. The number of bounces are calculated below by
% summing the amount of peaks in the y value over time from 0 seconds to
% 60 seconds. The number of peaks in y is directly equivalent to the 
% amount of bounces. Based on the calculated number of bounces by the 
% model for the given parameters, the bungee jumping company's claim can be
% confirmed.
fprintf('Analysis Task 1\n');

% Finding the number of peaks   
bounces = (numel(findpeaks(y(1:(60/T*n)+1))));
% Printing the results
fprintf('The jumper will experience %f bounces in 60 seconds\n', bounces);

%% 5.2 Maximum speed experienced by the jumper
% The task is to determine the maximum speed experienced by the jumper in
% m/s as well as finding the point in time the jumper experiences the 
% maximum speed measured in seconds from the start of the jump. The 
% question will be answered by plotting the jumper's velocity against time.
% Then fining the maximum velocity and its corresponding time. This point
% will be marked with an asterisk on the line. 
fprintf('Analysis Task 2\n');

% Finding the maximum velocity
[maxV, maxVIndex]=max(abs(v));
% Finding the time of maximum velocity
timeOfMaxV=t(maxVIndex);
% Plotting jumper’s velocity against time and marking the point of maximum
% velocity.
figure (2)
plot(t, v);
hold on;
plot(timeOfMaxV, maxV, 'r*');
xlabel('Time (s)');
ylabel('Velocity (m/s)');
title('Figure 2: Jumper’s velocity against time');
fprintf(['The jumper will experience maximum velocity ', ...
'of %f m/s \nat the time %f seconds\n'], maxV, timeOfMaxV);

%% 5.3 Maximum acceleration experienced by the jumper
% The task is to determine the accuracy of the bungee company's claim that 
% the jumper will experience an acceleration of up to 2g and find the point 
% in time when jumper experiences the maximum acceleration measured in
% seconds from the start of the jump. It was found that the model did not
% support the bungee company's claims as while the jumper's accelerations
% were found to come close 2g, it never did reach or breach 2g. 
fprintf('Analysis Task 3\n');
% Setting up the array for acceleration values
a = zeros(1,n+1);
% Setting the starting acceleration to g
a(1)=g;
% Finding the amount acceleration for each time interval of h
for j=2:n
    a(j)=first_order_backward(v, j, h);
end
% Finding the maximum acceleration
[maxA, maxAIndex]=max(abs(a));
% Finding the time of maximum acceleration
timeOfMaxA=t(maxAIndex);
% Converting acceleration to g
maxG=maxA/g;
% Plotting jumper’s acceleration against time
figure (3)
plot(t, a);
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');
title('Figure 3: Jumper’s acceleration against time');
fprintf(['The jumper will experience a maximum of %f m/s^2 acceleration',...
'\n at time %f seconds from the start, which is equivalent to %f g \n'],...
maxA, timeOfMaxA, maxG);
%% 5.4 Distance travelled by the jumper
% The bungee company has inquired about the total distance that the jumper
% will travel during the complete 60 seconds jump. This was calculated by
% incorporating Simpson's rule, using the absolute values for velocity in
% order to calculate the total distance travelled in any direction. The 
% index points used is the first and last velocity reading from the first 
% 60 seconds of the jump. The function used for integrating Simpson's rule 
% has been modified to take an additional value of h as input.
fprintf('Analysis Task 4\n');

f = @(t) abs(v(t));
% Setting the starting and ending values for integral
a = 1;
b = length(y);
% Finding the distance using simprule
distance = simprule(f, a, b, n, h);
% Printing the result
fprintf('The jumper will travel %f meters in 60 seconds\n', distance);

%% 5.5 Automated camera system
% The bungee company has proposed to install an automated camera system to
% photograph the jumpers as they pass the bridge deck for the first time.
% To enable the camera to capture the photos at a predetermined time, we
% are tasked with accurately predicting the time the jumper will pass the  
% bridge deck for the first time. 
% To achieve this, the nearest four values of the jumper's position which 
% lie either side of the camera have been interpolated using newton's 
% method. Then the time that the jumper will be closest to the camera was 
% calculated using the modified Bisection function. 
fprintf('Analysis Task 5\n');

% Camera height = jump point height - bridge deck height
cam=H-D;
% Finding the maximum height of the jump (lowest point) 
% as we are only interested in when the jumper first passes the point
[maxVal,maxIdx]=max(y);
% Contains all y values for the first bounce
firstBounce=y(1:maxIdx);
% Finding the closest the jumper will be to the camera point
[minDist,cy]=min(abs(firstBounce-cam));
% The height of the jumper at the closest point 
minVal=firstBounce(cy);
% Finding the two y points below and above the camera
% Also checking if the closest point found is above or below the camera
% to consider the appropriate points
if minVal>cam
    yPoints= [y(cy-2), y(cy-1), y(cy), y(cy+1)];
    tPoints= [t(cy-2), t(cy-1), t(cy), t(cy+1)];
else
    yPoints= [y(cy-2), y(cy), y(cy+1), y(cy+2)];
    tPoints= [t(cy-2), t(cy), t(cy+1), t(cy+2)];
end
% Time range
tRange = tPoints(1):h/100:tPoints(end); 
% Newton's forward difference table
FD = forward_differences(yPoints);
% Newton's forward difference form of the interpolating polynomial for 
% the four points
FE = forward_eval(tPoints, FD, tRange);
% Finding the t such that f(t) is closet to camera position
t_index = modBisection(FE, cam, 100);
shutterTime=tRange(t_index);

fprintf(['The camera should be set to trigger at %f seconds', ...
', for\n the given set of model parameters.\n'], shutterTime);
%% 5.6 Water touch option
%
% The bungee jumping company is seeking an alternative rope length and  
% spring constant where the jumper would touch the water at bottom of the  
% first jump while the acceleration is kept under 2 gs and the number of 
% bounces within 60 seconds is as close to 10 bounces as possible.
% Higher L values get the jumper closer to water but generally increase the 
% maximum acceleration experienced to unsafe levels. A lowering k value
% combats this but also increases the time it takes to complete a bounce
% and therefore, pushes the number of bounces/60 seconds below the ideal 
% 10. Using trial and error and approximation we found that L and k values 
% of around 40 and 80 respectively achieved close to the desired water  
% touch effect. Iteration and conditionals were used to determine more  
% accurate values that created a water touch effect while staying under 
% 2gs of max acceleration, and as close to 10 bounces/60 seconds as 
% possible. These values of L and k were 44.4m and 79.2 respectively.
fprintf('Analysis Task 6\n');


peaks = findpeaks(y(1:(60/T*n)+1));
first_peak = peaks(1);
fprintf(['With the current parameters, the 80kg bungee jumper would be',...
' %f meters\n away from a water touch\n\n'], (H - peaks(1)));

% Getting the values close to ideal by approximation
L2 = 40;             % Length of bungee cord (m)
k2 = 80;             % Spring constant of bungee cord (N/m)
K2 = k2/m;            % Scaled spring constant
disp('please wait...');
% Using a while loop to find more accurate ideal values of L and k
while (1)
    K2 = k2/m; % Update spring/weight constant
    [~, y2, v2, h] = modified_euler_bungee(T, n, g, C, K2, L2);
    % Calculate maxG
    a = zeros(1,n+1);  
    a(1)=g;
    for j=2:n
        a(j)=first_order_backward(v2, j, h);
    end
    maxA=max(abs(min(a)),abs(max(a)));
    maxG=maxA/g;
    peaks = findpeaks(y2(1:(60/T*n)+1));
    first_peak = peaks(1);
    % Calculate bounces
    bounces = (numel(findpeaks(y2(1:(60/T*n)+1))));
    
    % Apply changes based on the given conditions
    if (H - first_peak) > 0
        L2 = L2 + 0.05;
    elseif (H - first_peak) < -0.1
        L2 = L2 - 0.05;
    elseif maxG > 2
        k2 = k2 - 0.05;
    else
        % If every condition is met, break loop
        break;
    end
end  
% Printing the results
fprintf(['New L(rope length): %f\nNew k(sprint constant): %f\nNew K',...
'(scaled spring constant): %f\n\n'], L2, k2, K2);

fprintf(['With the NEW parameters, the 80kg bungee jumper would be %f',...
'\n meters away from a water touch\n(negative means contact with water',...
' is made)\nThe jumper will experience a maximum of %f g under the new',...
'parameters\nThe jumper will experience %f bounces within the first 60',...
' seconds of bungee\n'], (H - first_peak), maxG, bounces);

%% 6 Conclusion
%
% The Modified Euler Method was chosen as our second order or higher 
% numerical method and was then used to model the jumper’s position against 
% time. This model loosely resembles a damped sine wave, (almost) periodic 
% peaks of lessening amplitude. By adding the number of peaks in the 
% jumper's position it was discovered that the given parameters created a 
% standard jump that consisted of 10 bounces within the first 60 seconds. 
% The maximum speed experienced by the jumper, and the time at which this 
% occurred, was found using the max() function on the array of velocity 
% values. The max speed was found to be slightly over 20m/s, occurring  
% 2.6 seconds into the jump. The maximum acceleration experienced by the 
% jumper was found using similar methods, however, first_order_backward was 
% used to numerically differentiate velocity to find acceleration at the 
% given points. It was found that the max acceleration was 18.34m/s^2, 
% occurring 4.23 seconds into the jump. Simpson’s rule of numerical 
% derivation was used to find the total distance travelled, which was found 
% to be 282.16m. The best time to capture a photo from the jumper would be 
% at 3.33 seconds which was calculated by interpolating the 4 points  
% closest to the camera's position. Finally, to achieve a "water touch" 
% option, while remaining within the advertised values, the length and 
% spring constant of the rope should be changed to 44.4m and 79.2 
% respectively. 
% For the Brisbane city council and their commercial bungee jump company, 
% it is recommended that they consider the following factors:
%
% * the height of the jumper, which would affect parameters for a 
% "water touch" option. 
% * the head to toe surface area of the jumper, which would affect 
% air resistance and drag (and therefore acceleration and velocity).
% * Wind and weather conditions, as air pressure and wind can affect 
% the angle and speed of the jump, which affects travelled distance.


