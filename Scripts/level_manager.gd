extends Node

var person_talking: Person

func finish_level(people_choosen: Array, level_goal: Array):
	if people_choosen == level_goal:
		print("WIN")
	else:
		print("WRONG")
