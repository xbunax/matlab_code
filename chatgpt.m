% Define time points
t = 0:0.01:2;

% Define heart shape
x = [-1 -1 0 0 1 1]*0.4;
y = [0 1 0.8 0 1 0]*0.4;

% Define amplitudes
A1 = 0.4;
A2 = 0.2;

% Define frequencies
f1 = 1;
f2 = 2;

% Set up figure
figure;
axis equal;
axis([-1 1 -1 1]);
axis off;

% Loop through time points
for i = 1:length(t)
    % Define heart beat signal
    z = A1*sin(2*pi*f1*t(i)) + A2*sin(2*pi*f2*t(i));

    % Scale heart shape
    xx = x*(1+z);
    yy = y*(1+z);

    % Draw heart shape
    patch(xx, yy, 'r');

    % Pause for animation
    pause(0.01);

    % Clear figure
    clf;
end
