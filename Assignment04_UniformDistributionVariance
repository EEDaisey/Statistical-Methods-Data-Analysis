# ##############################################################################
# Author: Edward E. Daisey
# Class: Statistical Methods & Data Analysis
# Professor: Dr. Barry Bodt
# Date: 23rd of September, 2024
# Title: Assignment 4 - 3.10.6
# ##############################################################################


# ############################ Simulation Parameters ###########################
n <- 3 # Number of Samples
trials <- 1000 # Number of Trials
ranges <- numeric( trials ) # Vector to store the range values from each trial.
# ##########################################################################


# ########################### Uniform Generator Function #######################
# Function Name: UniformGenerator
# Purpose: Generates n uniform random numbers in the range [0, 1].
# Input: n - The number of uniform random variables to generate.
# Output: A vector of n uniform random variables.
UniformGenerator <- function( n ) {
return( sample( seq( 0, 1, by = 0.001 ), n, replace = TRUE ) )
}
# ##########################################################################


# ############################ Main Simulation Loop ############################
# Purpose:
# This script performs a simulation to estimate the range of samples drawn
# from a uniform distribution, specifically using n = 3 samples in each trial.
#
# Simulation Parameters:
# - n: The number of random variables to generate in each trial (set to 3).
# - trials: The total number of trials to run (set to 1000).
# - ranges: A numeric vector initialized to store the computed ranges from
# each trial.
#
# Functions:
# - UniformGenerator: Generates n uniform random variables.
# - Input: n - The number of uniform random variables to generate.
# - Output: A numeric vector of uniform random variables in the range [0, 1].
#
# Main Simulation Loop:
# For each trial, generate uniform random numbers, compute the range, and
# store the results. Then compute mean and variance. Print the results.
#
# Output:
# The sample mean and variance of the computed ranges are printed to the console.
# ###########################################################################
for ( i in 1:trials ) {
samples <- UniformGenerator( n ) # Generate n uniform random variables.
ranges[ i ] <- max( samples ) - min( samples ) # Compute the range
}
sample_mean <- mean( ranges ) # Compute the mean of the ranges.
sample_variance <- var( ranges) # Compute the variance of the ranges.
# Print Results:
cat( "Sample Mean:", sample_mean, "\n" ) # Output Sample Mean.
cat( "Sample Variance:", sample_variance, "\n" ) # Output Sample Variance.
# Problem 3.10.6 Result: E(R) = 1/2, Var(R) = 1/20
# Simulation Result: E(R) = 0.508644, Var(R) = 0.0507994
# ###########################################################################
# Some Mathematics:
# E(R) = Integral_Btwn_0_1(r*(6r-6r^2)*dr)
# = [2(r)^3 - 3/2(r)^4], where r = 1, --> E(r) = 2 - 3/2 = 1/2
# E(R^2) = Integral_Btwn_0_1(r^2*(6r-6r^2)*dr)
# = [3/(r)r^4 - 6/5(r)^5], where r = 1 --> E(R^2) = 3/2 - 6/5 = 3/10
# Var(R) = E(R^2) - E(R)^2 = 3/10 - (1/2)^2 = 3/10 - 1/4 = 1/20
# ###########################################################################
