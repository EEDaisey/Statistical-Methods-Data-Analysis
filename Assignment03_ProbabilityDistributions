# ##############################################################################
# Author: Edward E. Daisey
# Class: Statistical Methods & Data Analysis
# Professor: Dr. Barry Bodt
# Date: 16th of September, 2024
# Title: Assignment 3
# ##############################################################################


# ###################### Instructions For Questions 1-3 ########################
# The first three question are using expectation and the random number generation
# in R for the binomial, hypergeometric, and exponential distributions.
# ##############################################################################


# ################################ Question 1 ##################################
# (1) Using the function rbinom in R, generate 1000 random deviates from a
# B(20,.4) distribution, compute the sample mean and compare with the
# theoretical expectation.
# Parameters associated with the binomial distribution.
number_observations <- 1000 # Number of Observations Generated
number_trials <- 20 # Number of Trials
p_success <- 0.4 # Probability of Success In Each Trial
random_deviates <- rbinom( n = number_observations, size = number_trials, prob = p_success )
mean <- mean( random_deviates )
theoretical_expectation <- ( number_trials * p_success )
stdout <- sprintf( "\nMean: %.4g\tTheoretical Expectation: %.4g", mean, theoretical_expectation )
cat( stdout )
# Result: Mean: 8.003 Theoretical Expectation: 8
# Reference: https://www.rdocumentation.org/packages/stats/versions/3.3/topics/Binomial
# ##############################################################################


# ################################ Question 2 ##################################
# (2) Using the function rhyper in R, generate 1000 random deviates from a
# hypergeometric distribution with 4 white balls, 8 black balls, and 3 balls
# drawn without replacement. Compute the sample mean and compare with the
# theoretical expectation.
number_observations <- 1000 # Number of Observations Generated
white_balls <- 4 # Number of White Balls
black_balls <- 8 # Number of Black Balls
total_balls <- white_balls + black_balls # Total Number of Balls
drawn_balls <- 3 # Number of Balls Drawn
random_deviates <- rhyper( nn = number_observations, m = white_balls, n = black_balls, k =
drawn_balls )
mean <- mean( random_deviates )
theoretical_expectation <- ( drawn_balls * white_balls / total_balls )
stdout <- sprintf( "\nMean: %.4g\tTheoretical Expectation: %.4g", mean, theoretical_expectation )
cat( stdout )
# Result: Mean: 0.987 Theoretical Expectation: 1
# Reference: https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/Hypergeometric
# ##############################################################################


# ################################ Question 3 ##################################
# (3) Using the function rexp in R, generate 1000 random deviates from an
# exponential with lambda=3. Compute the sample mean and compare with the
# theoretical expectation, which is 1/lambda.
number_observations <- 1000 # Number of Observations Generated
lambda <- 3 # Lambda Value
random_deviates <- rexp( n = number_observations, rate = lambda )
mean <- mean( random_deviates )
theoretical_expectation <- ( 1 / lambda )
stdout <- sprintf( "\nMean: %.4g\tTheoretical Expectation: %.4g", mean, theoretical_expectation )
cat( stdout )
# Result: Mean: 0.3212 Theoretical Expectation: 0.3333
# Reference: https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/Exponential
# ##############################################################################
