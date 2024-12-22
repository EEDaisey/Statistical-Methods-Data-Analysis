# ##############################################################################
# Author: Edward E. Daisey
# Class: Statistical Methods & Data Analysis
# Professor: Dr. Barry Bodt
# Date: 14th of October, 2024
# Title: Assignment 7 - Monte Carlo Simulation of Means & Variances
# ##############################################################################


# ################################## Analysis ##################################
# Set Parameters:
mean_value <- 10 # Mean of the Normal Distribution,
stddev_value <- 5 # Standard Deviation of the Normal Distribution,
number_samples <- 3 # Number of Samples to Draw in Each Simulation, &
number_simulations <- 1000000 # Number of Simulations to Perform.

# Initialize Storage For Estimators:
mu_hat_1 <- numeric( number_simulations )
mu_hat_2 <- numeric( number_simulations )

# Simulation Loop:
for ( i in 1:number_simulations ) {
  # Generate 3 Random Samples from normal distribution:
  samples <- rnorm( number_samples, mean = mean_value, sd = stddev_value )
  
  # Calculate the Estimators:
  mu_hat_1[ i ] <- ( 1/4 ) * samples[ 1 ] + ( 1/2 ) * samples[ 2 ] + ( 1/4 ) * samples[ 3 ]
  mu_hat_2[ i ] <- ( 1/3 ) * samples[ 1 ] + ( 1/3 ) * samples[ 2 ] + ( 1/3 ) * samples[ 3 ]
}

# Calculate Means and Variances:
mu_hat_1_mean <- mean( mu_hat_1 )
mu_hat_1_variance <- var( mu_hat_1 )
mu_hat_2_mean <- mean( mu_hat_2 )
mu_hat_2_variance <- var( mu_hat_2 )

# Theoretical Variances:
theoretical_variance_1 <- 3*( stddev_value^2 )/8
theoretical_variance_2 <- 3*( stddev_value^2 )/9

# Output Results:
sprintf( "===== Estimator mu_hat_1 Values =====" ) |> print()
sprintf( " Sample Mean: %.4f", mu_hat_1_mean ) |> print()
sprintf( "Sample Variance: %.4f", mu_hat_1_variance ) |> print()
sprintf( "===== Estimator mu_hat_2 Values =====" ) |> print()
sprintf( " Sample Mean: %.4f", mu_hat_2_mean ) |> print()
sprintf( "Sample Variance: %.4f", mu_hat_2_variance) |> print()
sprintf( "======== Theoretical Values =========" ) |> print()
sprintf( "Theoretical Mean: %.4f", mean_value ) |> print()
sprintf( "Theoretical Variance mu_hat_1: %.4f", theoretical_variance_1 ) |> print()
sprintf( "Theoretical Variance mu_hat_2: %.4f", theoretical_variance_2 ) |> print()

# ============ Results ============
# Note n = 1000000 (n = 1000 --> Slightly Difference Values For Estimators)
# ===== Estimator mu_hat_1 Values =====
# Sample Mean: 10.0018
# Sample Variance: 9.3718
# ===== Estimator mu_hat_2 Values =====
# Sample Mean: 10.0029
# Sample Variance: 8.3339
# ======== Theoretical Values =========
# Theoretical Mean: 10.0000
# Theoretical Variance mu_hat_1: 9.3750
# Theoretical Variance mu_hat_2: 8.3333
# ##############################################################################
