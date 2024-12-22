# ##############################################################################
# Author: Edward E. Daisey
# Class: Statistical Methods & Data Analysis
# Professor: Dr. Barry Bodt
# Date: 7th of of October, 2024
# Title: Assignment 6
# ##############################################################################


# ################################# Constants ##################################
num_times <- 1000 # Can change to lower values.
# Drop [ 51 : 950 ] if changed.
# ##############################################################################


# ################################## Analysis ##################################
# Generate sums of 3 iid Poisson(Mean = 2):
poisson <- replicate( num_times, sum( rpois( 3, 2 ) ) ) # 3 random samples summed together num_times.

# Directly generated from the resulting Poisson(2 + 2 + 2) = Poisson(6):
poisson_sum <- rpois( num_times, 6 )

# Sorting & Plotting:
plot( sort( poisson ), sort( poisson_sum ),
main = "Comparison of Poisson Sums",
xlab = "Sum of 3 iid Poisson(2)",
ylab = "Poisson(6)",
pch = 20)
abline( 0, 1 )

# Generate sums of 3 iid Exponential(Rate = 1/4), and then trim:
exponential <- replicate( num_times, sum( rexp( 3, 1/4 ) ) )
exponential_trimmed <- exponential[ 51 : 950 ]

# Directly generated from the sums of three Exponential(1/4) random variables, and then trim:
exponential_sum <- rexp( num_times, 1/4 ) + rexp( num_times, 1/4 ) + rexp(num_times, 1/4)
exponential_sum_trimmed <- exponential_sum[ 51 : 950 ]

# Sorting & Plotting Against Theoretical Mean Associated With Exponential(Rate = 1/4):
plot( sort( exponential_trimmed ), sort( exponential_sum_trimmed ),
main = "Comparison of Exponential Sums",
xlab = "Sum of 3 iid Exponential(1/4)",
ylab = "Exponential(1/4)",
pch = 20)
abline( 0, 1 )

# Furthermore, a histogram can be created and ... can be replaced with:
# poisson: Vector containing sums of three random deviates (1000).
# poisson_sum: 1000 random deviates for direct sum.
# exponential: Vector containing sums of three random deviates (1000).
# exponential_sum: 1000 random deviates for direct sum.
# Note: All produce a histogram that is slightly right skewed.
hist( ..., breaks = 30, main = "Histogram" )
# ##############################################################################
