# ##############################################################################
# Author:  Edward E. Daisey
# Class:  Statistical Methods & Data Analysis
# Professor:  Dr. Barry Brodt
# Date:  2nd of September, 2024
# Title:  Assignment 01 - Risk Simulation
# ##############################################################################


# ################################## Results ###################################
#               Probabilities of The Attacker Winning
#     # of Dice       1            2            3
# --------------|-------------------------------------------------------
#       MC Runs |
#            10 |   0.300        0.700         0.500       
#          1000 |   0.440        0.562         0.636
#         10000 |   0.430        0.576         0.656
#        100000 |   0.417        0.579         0.660
#
# Note: The numbers above represent the probabilities of the attacker winning
# based on different Monte Carlo (MC) runs in a game of Risk. The attacker is
# assumed to have three dice while the defender is assumed to have one dice.
# "# of Dice" above indicates the number of dice the attacker rolls.
#
# Using a larger number of MC runs generally leads to more reliable and
# stable results, converging to the true solution as the number of runs increases.
#
# Reproducibility: (0) Open R-Studio.
#                  (1) Change NUM_SIMULATIONS & MAX_DICE to desired values.
#                  (2) Make sure you have constants & functions operational.
#                  (3) Run Main() at the bottom of this code.
#
# References:      None.
# ##############################################################################


# ############################## Constants ################################
NUM_SIMULATIONS <- 100000    # 10, 1000, 10000, 100000 Simulations.
MIN_DICE <- 1                # Minimum number of dice rolled (defender).
MAX_DICE <- 3                # Maximum number of dice rolled (attacker).
DICE_SIDES <- 6              # A fair six sided dice was used.
# #########################################################################

     
# ############################## Function 1 ################################
#    Function Name: simulate_and_calculate_probability
# Function Purpose: Simulates an engagement (roll) between the attacker and the 
#                   defender.  The probability of winning is calculated & printed.
#  Function Input:  number_dice_* - the number of dice the defender (or attacker)
#                   decides to use during the battle.
# Function Output:  Whether the attacker wins the engagement or not.
SimulateAndCalculateProbability <- function( number_dice_defender, number_dice_attacker ) {
  SimulateEngagement <- function() {
    # n x Six Sided Die Used By The Defender. n = 1. Numbers are allowed to repeat, i.e., replace = TRUE. 
    defender_rolls <- sample( 1:DICE_SIDES, number_dice_defender, replace = TRUE )
    # n x Six Sided Die Used By The Attacker. n = 3. Numbers are allowed to repeat, i.e., replace = TRUE. 
    attacker_rolls <- sample( 1:DICE_SIDES, number_dice_attacker, replace = TRUE )
    # Note: The sample function in R is used for random sampling from the sample space.
  
    # Determine if attacker wins the engagement.
    maximum_attacker_roll <- max( attacker_rolls )
    return( maximum_attacker_roll > defender_rolls )
  }
  
  # Monte Carlo Simulation & Probability Calculation. Text printed to console. 
  # Replicate() calls engagement function and collects the results. Results of
  # engagements are printed to console.
  stdout <- sprintf("==================== Monte Carlo Results ====================\n")
  cat( stdout )
  stdout <- sprintf("1 = Attacker Won Engagement | 0 = Attacker Lost Engagement\n\n ")
  cat( stdout )
  
  monte_carlo_results <- replicate( NUM_SIMULATIONS, SimulateEngagement() )
  stdout <- sprintf( "Result From Engagement: %.3g\n", monte_carlo_results )
  cat( stdout )
  
  probability_winning <- mean( monte_carlo_results )
  stdout <- sprintf( "\nProbability of attacker winning the engagement with %d dice: %.3g\n", number_dice_attacker, probability_winning )
  cat( stdout )
}
# ##########################################################################
     
     
# ############################## Function 2 ################################
#    Function Name: main
# Function Purpose: Simulates an engagement between the attacker and the 
#                   defender,and calculates the probability of winning.
#  Function Input:  MIN_DICE and MAX_DICE.
# Function Output:  Performs simulation and calculates the probability.
Main <- function() {
  number_dice_defender <- MIN_DICE
  number_dice_attacker <- MAX_DICE
  SimulateAndCalculateProbability( number_dice_defender, number_dice_attacker )
} 
Main()
# ##########################################################################
