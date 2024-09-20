# #############################################################################
# Author: Edward E. Daisey
# Class: Statistical Methods & Data Analysis
# Professor: Dr. Barry Bodt
# Date: 9th of September, 2024
# Title: Assignment 2 - World Series Simulation
# #############################################################################


# ################################## Results ##################################
# Simulation Result: 0.9300, mean of 1000 runs done fifteen times.
# Calculation: 0.9294, work in 'Mathematical Analysis' section below.
#
# MC Runs | Probability of Team Winning The World Series | Run
# --------------|--------------------------------------------------------------
# 1000 | 0.9360 | 1
# 1000 | 0.9190 | 2
# 1000 | 0.9340 | 3
# 1000 | 0.9190 | 4
# 1000 | 0.9410 | 5
# 1000 | 0.9250 | 6
# 1000 | 0.9300 | 7
# 1000 | 0.9330 | 8
# 1000 | 0.9230 | 9
# 1000 | 0.9350 | 10
# 1000 | 0.9380 | 11
# 1000 | 0.9230 | 12
# 1000 | 0.9380 | 13
# 1000 | 0.9170 | 14
# 1000 | 0.9390 | 15
#
# Note: The numbers above represent the probabilities of Team A winning
# the World Series based on 1000 Monte Carlo (MC) runs. 'Run' is simply
# the number of times I ran my simulation 1000 times. The mean was 0.9300,
# which is close to the calculated value of 0.9294 in the section below.
#
# Mathematical Analysis:
# P('A Wins World Series') = P('A Wins First 4 Games') +
# P('A Wins In 5 Games') +
# P('A Wins In 6 Games') +
# P('A Wins In 7 Games')
#
# = P('A Wins First Four Games') +
# P('A Wins 3 of First 4 Games')*P('A Wins 5th Game'|'A Wins 3 of First 4 Games') +
# P('A Wins 3 of First 5 Games')*P('A Wins 6th Game'|'A Wins 3 of First 5 Games') +
# P('A Wins 3 of First 6 Games')*P('A Wins 7th Game'|'A Wins 3 of First 6 Games')
#
# = p^4 +
# (4C3 * p^3 * q * p) +
# (5C3 * p^3 * q * q * p) +
# (6C3 * p^3 * q * q * q * p)
# Where nCr is representative of n Choose r. E.g., 4C3 = 4 Choose 3.
#
# = p^4 +
# (4C3 * p^3 * q * p) +
# (5C3 * p^3 * q^2 * p) +
# (6C3 * p^3 * q^3 * p)
#
# = p^4 +
# (4C3 * p^4 * q ) +
# (5C3 * p^4 * q^2) +
# (6C3 * p^4 * q^3)
#
# = p^4 +
# ( 4 * p^4 * q ) +
# (10 * p^4 * q^2) +
# (20 * p^4 * q^3)
#
# Let p = 0.75
# q = 1.00 - p --> q = 1.00 - 0.75 = 0.25
# By substitution, it follows that P('A Wins World Series') = 0.9294
#
# Reproducibility: (0) Open Python IDE.
# (1) Change constants to desired values.
# (2) Execute code.
#
# References: Makoto Matsumoto and Takuji Nishimura. 1998. Mersenne Twister:
# A 623-Dimensionally Equidistributed Uniform Pseudo-Random
# Number Generator. ACM Trans. Model. Comput. Simul. 8, 1
# (Jan. 1998), 3–30. https://doi.org/10.1145/272991.272995
# #############################################################################


# ############################# Dependencies ##################################
import random
# 'random' leverages the Mersenne Twister (MT). The MT is a bit dated, though
# it is still a good pseudo-random number generator appropriate for this
# particular simulation. See reference above for further information.
# #############################################################################


# ############################## Constants ####################################
NUM_SIMULATIONS = 1000 # Specified number of simulations.
MAX_GAMES = 7 # Maximum number of games in the World Series.
P_TEAM_A_WINS = 0.75 # Probability of Team A winning a single game.
# #############################################################################


# ############################## Function 1 ###################################
# Function Name: SimulateBaseballGame
# Function Purpose: Simulates a single baseball game.
# Function Input: Probability that Team A wins a single game.
# Function Output: Boolean value capturing whether Team A won or lost the game.
def SimulateBaseballGame( P_TEAM_A_WINS ):
return random.random() < P_TEAM_A_WINS
# #############################################################################


# ############################## Function 2 ###################################
# Function Name: SimulateWorldSeries
# Function Purpose: Simulates the World Series between Team A and Team B.
# Function Input: Probability that Team A wins a single game.
# Maximum number of games in the World Series.
# Function Output: Integer value indicating whether Team A won the
# series (1) or lost (0).
def SimulateWorldSeries( P_TEAM_A_WINS, MAX_GAMES ):
# Count of the number of wins associated with both teams.
team_a_wins = 0
team_b_wins = 0
for _ in range( MAX_GAMES ):
if SimulateBaseballGame( P_TEAM_A_WINS ):
team_a_wins += 1
else:
team_b_wins += 1
# Check if the team has won four games.
if team_a_wins == 4:
print( f"Team A wins the series!" )
return 1 # Team A wins the series!
if team_b_wins == 4:
print( f"Team B wins the series!\n" +
       f" Al Michaels' shouts: 'Do you believe in miracles!'" )
return 0 # Team B wins the series!
# #############################################################################


# ############################## Function 3 ###################################
# Function Name: CalculateProbabilityWinning
# Function Purpose: The probability that Team A wins the World series
# based on multiple simulations is calculated.
# Function Input: Probability that Team A wins a single baseball game.
# The number of simulations to run for the analysis.
# Function Output: Float value representing the probability that Team A
# wins the World Series.
def CalculateProbabilityWinning( P_TEAM_A_WINS, NUM_SIMULATIONS ):
wins = sum( SimulateWorldSeries( P_TEAM_A_WINS, MAX_GAMES ) for _ in
range( NUM_SIMULATIONS ) )
return wins / NUM_SIMULATIONS
# #############################################################################


# ############################## Function 4 ###################################
# Function Name: Main
# Function Purpose: The simulation is executed and the probability of Team A
# winning the World Series is printed.
# Function Input: P_TEAM_A_WINS and NUM_SIMULATIONS.
# Function Output: Performs simulation and calculates the probability of winning.
def Main():
probability = CalculateProbabilityWinning( P_TEAM_A_WINS, NUM_SIMULATIONS )
print( f"\nProbability that Team A wins the World Series: {probability:.4f}" )
if __name__ == "__main__":
Main()
# ###########################################################################
