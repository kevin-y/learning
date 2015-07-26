#!/usr/bin/python

#########################################################
#	Mini-project 1
#	Author: Kevin Wang
#	Since: 2015-07-26
#	License: MIT
#########################################################

import random
import sys  
import traceback

def name_to_number(name):
	if(name == 'rock'):
		return 0	
	elif(name == 'Spock'):
		return 1	
	elif(name == 'paper'):
		return 2	
	elif(name == 'lizard'):
		return 3	
	elif(name == 'scissors'):
		return 4	
	else:
		return -1	

def number_to_name(number):
	if(number == 0):
		return 'rock'
	elif(number == 1):
		return 'Spock'
	elif(number == 2):
		return 'paper'
	elif(number == 3):
		return 'lizard'
	elif(number == 4):
		return 'scissors'
	else:
		return ''

def rpsls(player_choice):
	print '\nPlayer chooses ' + player_choice
	player_number = name_to_number(player_choice)
	
	# randomly pick a number from sequence: [0, 1, 2, 3, 4]
	comp_number = random.randrange(0, 5, 1)
	print 'Computer chooses ' + number_to_name(comp_number)
	
	if(player_number != comp_number):
		result = (player_number - comp_number) % 5
		if(result == 1 or result == 2):
			print "Player wins!"
		elif(result == 3 or result == 4):
			print "Computer wins!"
	else:
		print "Player and Computer tie!"

#print number_to_name(name_to_number('scissors'))
#print number_to_name(name_to_number('scissor'))

rpsls('rock')
rpsls('Spock')
rpsls('paper')
rpsls('lizard')
rpsls('scissors')


#########################################################
# Below is the interactive section.
# You can uncomment the code block for testing
#########################################################

#try:
#	choice = raw_input("Please input your choice: ")
#
#	n = name_to_number(choice)
#	if(n == -1):
#		print "Command not supported!"
#		# sys.exit will throw an SystemExit
#		sys.exit(1)
#	rpsls(choice)
#
#except SystemExit:
#	pass
#except:
#	traceback.print_exc()
