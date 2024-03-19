% this script will initialize the inverted pendulum - cart system.

% Basic parameters:

invpend_cart_mass = 5; % mass of the cart in [KG]
invpend_pendulum_mass = 3; % mass of the pendulum in [KG]
invpend_pendulum_length = 1.5; % arm length of the pendulum in [m] 
invpend_friction_coeff = 5; % Rolling friction coefficient for the cart wheels.

% Init position of the pendulum:

invpend_pendulum_init_angle_in_deg = 8; % Pendulum arm position compared to the vertical axis in [deg]
invpend_pendulum_init_angle = invpend_pendulum_init_angle_in_deg * pi / 180; % Calculate the radians from the degrees.

% Simulation variables

invpend_use_resistance = true;
invpend_use_controller = true;

% Control parameters

invpend_pid_proportional_gain = 100;
invpend_pid_integral_gain =  60;
invpend_pid_derivative_gain = 20;