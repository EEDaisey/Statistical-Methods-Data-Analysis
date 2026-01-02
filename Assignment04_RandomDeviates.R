# ##############################################################################
# Author: Edward E. Daisey
# Class: Statistical Methods & Data Analysis
# Professor: Dr. Barry Bodt
# Date: 23rd of of September, 2024
# Title: Assignment 04 – Example 3.8.5 Simulation
# ##############################################################################


# ############################ Simulation Parameters ###########################
sample_number <- 2000 # Number of samples.
lambda <- 1 # Rate parameter for the exp distributions.
# ###############################################################################


# ############################ Generate Random Deviates #########################
# Purpose: Generate random deviates for X and Y from an exponential distribution.
# Input: sample_number - Number of samples; lambda - Rate Parameter.
# Output: W_ratio_Y_Over_X - Ratio W = Y / X.
X <- rexp( sample_number, rate = lambda ) # Exponential random variate for X
Y <- rexp( sample_number, rate = lambda ) # Exponential random variate for Y
# Compute The Ratio W = Y / X:
W_ratio_Y_Over_X <- Y / X
# ###############################################################################


# ############################ Theoretical Random Deviates ######################
# Purpose: Generate random deviates from the theoretical distribution.
# Input: sample_number - Number of samples.
# Output: W_random_deviates - Random deviates from the theoretical distribution.
# Generate uniform random numbers:
uniform_random_numbers <- runif( sample_number )
# Calculate W_random_deviates using the derived formula:
W_random_deviates <- ( 1 / ( 1 - uniform_random_numbers ) ) - 1
# ##############################################################################
