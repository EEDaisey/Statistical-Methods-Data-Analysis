# ##############################################################################
# Author: Edward E. Daisey
# Class: Statistical Methods & Data Analysis
# Professor: Dr. Barry Bodt
# Date: 18th of November, 2024
# Title: Assignment 9 - Bayesian Statistics
# ##############################################################################


# ############## Function to compute the prior distribution (Beta) #############
# Purpose: To compute the prior distribution (Beta) for a given value of θ, with
# parameters r and s.
# Inputs:
# theta - The probability of heads (θ), where 0 <= θ <= 1.
# r - The alpha parameter (shape1) of the Beta distribution.
# s - The beta parameter (shape2) of the Beta distribution.
# Output:
# The prior Beta distribution density at θ.
PriorDistribution <- function( theta, r, s ) {
  # Prior Distribution (Beta)
  return( ( gamma( r+s ) / (gamma( r ) * gamma( s ) ) ) * ( theta^( r-1 ) ) * ( ( 1-theta )^( s-1 ) ) )
}
# ##############################################################################


# ######### Function to compute the posterior distribution (Beta) after ########
# ######### observing n tosses with k heads ########
# Purpose: To compute the distribution posterior (Beta) after updating the prior
# with observed data.
# Inputs:
# theta - The probability of heads (θ), where 0 <= θ <= 1.
# n - The total number of coin tosses.
# k - The number of heads observed in the coin tosses.
# r - The alpha parameter (shape1) of the Beta distribution.
# s - The beta parameter (shape2) of the Beta distribution.
# Output:
# The posterior Beta distribution density at θ.
PosteriorDistribution <- function( theta, n, k, r, s ) {
  # Posterior Distribution (Beta)
  return( ( gamma( r+k+s+n ) / ( gamma( r+k ) * gamma( s+n-k ) ) ) * ( theta^( r+k-1 ) ) * ( ( 1-theta )^( s+n-k-1 ) ) )
}
# ##############################################################################


# ############# Function to calculate the probability that θ > 0.5 #############
# ############# (i.e., biased towards heads) #############
# Purpose: To compute the probability that the true probability of heads (θ)
# is greater than 0.5 using the posterior Beta distribution.
# Inputs:
# r - The alpha parameter (shape1) of the Beta distribution.
# s - The beta parameter (shape2) of the Beta distribution.
# n - The total number of coin tosses.
# k - The number of heads observed in the coin tosses.
# Output:
# The probability that θ > 0.5, based on the posterior distribution.
ProbabilityBiasedTowardsHeads <- function( r, s, n, k ) {
  # Compute the posterior parameters (α = r + k, β = s + n - k)
  alpha_posterior <- r + k
  beta_posterior <- s + n - k
  # Use pbeta to calculate the probability P(θ > 0.5) by subtracting from 1
  return( 1 - pbeta( 0.5, alpha_posterior, beta_posterior ) )
}
# ##############################################################################


# ########################## List & Process Parameters #########################
# List of parameter sets for different (r, s, n, k) combinations
# Purpose: To define a set of parameter combinations to use in the analysis.
parameter_sets <- list(
  list( r = 1, s = 1, n = 4, k = 3 ),   # Case 1: (r,s) = (1,1), (n,k) = (4,3)
  list( r = 1, s = 1, n = 20, k = 11 ), # Case 2: (r,s) = (1,1), (n,k) = (20,11)
  list( r = 4, s = 4, n = 4, k = 3 ),   # Case 3: (r,s) = (4,4), (n,k) = (4,3)
  list( r = 4, s = 4, n = 20, k = 11 )  # Case 4: (r,s) = (4,4), (n,k) = (20,11)
)
# Process each parameter set:
for ( params in parameter_sets ) {
  r <- params$r
  s <- params$s
  n <- params$n
  k <- params$k
  # Calculate the probability that θ > 0.5 (biased towards heads):
  prob_biased <- ProbabilityBiasedTowardsHeads( r, s, n, k )
  
  # Print the calculated probability:
  cat( sprintf( "For (r = %d, s = %d, n = %d, k = %d), P(θ > 0.5) = %.4f\n", r, s, n, k, prob_biased ) )
  
  # Define the sequence of theta values to evaluate the distributions over [0, 1]:
  theta_vals <- seq( 0, 1, by = 0.01 )
  
  # Compute prior and posterior densities for each theta:
  prior_vals <- sapply( theta_vals, PriorDistribution, r = r, s = s )
  posterior_vals <- sapply( theta_vals, PosteriorDistribution, n = n, k = k, r = r, s = s )
  
  # Determine max values for prior & posterior. Normalize the posterior by dividing by its maximum value:
  max_prior <- max( prior_vals )
  max_posterior <- max( posterior_vals )
  normalized_posterior <- posterior_vals / max_posterior
  y_max <- max( max_prior, 1 )
  
  # Plot Prior and Normalized Posterior Distribution on the same plot:
  plot( theta_vals, prior_vals, type = "l", col = "blue", lwd = 2,
  main = sprintf( "Prior & Normalized Posterior Distributions (r = %d, s = %d, n = %d, k = %d)", r, s, n, k ),
  xlab = "Theta", ylab = "Density", lty = 1, ylim = c( 0, y_max ) )
  lines( theta_vals, normalized_posterior, col = "red", lwd = 2, lty = 2 )
  
  # Add legend to distinguish prior and posterior:
  legend( "topright", legend = c( "Prior", "Normalized Posterior" ), col = c( "blue", "red" ), lty = c( 1, 2 ), lwd = 2 )
  grid()
}
# ##############################################################################
