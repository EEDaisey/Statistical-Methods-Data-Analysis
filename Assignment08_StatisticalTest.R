# ##############################################################################
# Author: Edward E. Daisey
# Class: Statistical Methods & Data Analysis
# Professor: Dr. Barry Bodt
# Date: 4th of November, 2024
# Title: Assignment 8 - Statistical Test
# ##############################################################################


# ################################# Load Data ##################################
# Purpose: Initializes the fixed and adjustable rate mortgage (ARM) rates.
fixed_rates <- c( 3.525, 3.625, 3.383, 3.625, 3.661, 3.791, 3.941, 3.781, 3.660, 3.733 )
arm_rates <- c( 2.923, 3.385, 3.154, 3.363, 3.226, 3.283, 3.427, 3.437, 3.746, 3.438 )
# ##############################################################################


# ##################### Means & Initial Difference In Means ####################
# Purpose: Calculates the average rates for each group and their difference.
# The critical t_value derived in 9.2.20 is also noted.
initial_mean_fixed <- mean( fixed_rates ) # Mean of fixed rate mortgage rates.
initial_mean_arm <- mean( arm_rates ) # Mean of ARM rates.
initial_difference <- initial_mean_fixed - initial_mean_arm # Difference in means.

# Define the critical t-value for significance testing.
t_crit <- 2.58 # Critical t-value.
# ##############################################################################


# ########################### Combined Rates Vector ############################
# Purpose: Merging fixed and ARM rates into a single dataset for permutation.
combined_rates <- c( fixed_rates, arm_rates )
# ##############################################################################


# ############################## Permutation Test ##############################
# Purpose: This section conducts a permutation test to evaluate the significance
# of the difference.
num_permutations <- 1000 # Number of permutations.
differences <- numeric( num_permutations ) # Initialize vector.

for ( i in 1:num_permutations ) {
  # Sample 10 rates without replacement to create a permuted sample.
  permuted_sample <- sample( combined_rates, 10, replace = FALSE )

  # Calculate means for the permuted sample and remaining rates.
  mean_plan_1 <- mean( permuted_sample )
  mean_plan_2 <- mean( combined_rates[!combined_rates %in% permuted_sample] )

  # Store the difference between the two means for this permutation.
  differences[i] <- mean_plan_1 - mean_plan_2
}
# ##########################################################################


# ######################## Calculate P-Values & Results ########################
# Purpose: P-values are computed & the results are explained.

# One-tailed test based on initial difference --
p_value_difference <- mean( differences > initial_difference )

# Compare permuted differences to the critical t-value --
p_value_critical <- mean( differences > t_crit )

# Output the results.
print( paste( "p-value from permutation test:", p_value_difference ) ) # 0.001
print( paste( "p-value from critical t-value:", p_value_critical ) ) # 0

# Explanation of Results:
# The p_value_difference of 0.001 indicates that the observed difference in means
# is unusual under the null hypothesis, suggesting that there is only a 0.1% chance
# of obtaining such a difference if the null hypothesis were true.
# With a p_value_critical of 0, it confirms that the test statistic is
# significantly higher than the critical value of 2.58. Thus, we reject
# the null hypothesis (H0: u1 = u2) and accept the alternative hypothesis
# (H1: u1 > u2), concluding that the ARM rates are statistically
# significantly lower than the Fixed rates.
# #########################################################################
