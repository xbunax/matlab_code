% Set the size of the Ising model
N = 300;

% Set the total number of Monte Carlo steps
num_steps = 200000;

% Set the interaction strength
J = 2.0;

% Set the temperature
T = [2.0, 8.0];

% Initialize the spin matrix with random values
spin_matrix = sign(randn(N));

% Plot the initial spin distribution
figure;
imagesc(spin_matrix);
title('Initial spin distribution');

% Loop over the different temperatures
for k = 1:length(T)
  % Set the current temperature
  curr_T = T(k);

  % Loop over the Monte Carlo steps
  for i = 1:num_steps 
    % Select a random position in the spin matrix
    row = randi(N);
    col = randi(N);
    if ((1 < col && col <300) && (1 <row && row <300))
    % Compute the current energy of the spin matrix
    curr_energy = -J * spin_matrix(row, col) * (spin_matrix(row-1, col) + spin_matrix(row+1, col) + spin_matrix(row, col-1) + spin_matrix(row, col+1));

    % Compute the change in energy if the spin at the selected position is flipped
    dE = 2 * curr_energy;

    % Use the Metropolis algorithm to determine whether to flip the spin
    if dE <= 0 || rand() < exp(-dE / curr_T)
      spin_matrix(row, col) = -spin_matrix(row, col);
    end
    end
  end

  % Plot the equilibrium spin distribution
  figure;
  imagesc(spin_matrix);
  title(sprintf('Equilibrium spin distribution (T = %.1f)', curr_T));
end
