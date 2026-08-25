extends Node

var person_talking: Person

var current_level: int = 1
var levels := {
	"level1": "uid://bgltk50n5hrgq",
	"level2": "uid://ddlmpjvm1qqjm",
	"level3": "uid://bsghx1dpixgrk",
	"level4": "uid://ed3pmag54j3m",
}

func finish_level(people_choosen: Array, level_goal: Array):
	if people_choosen == level_goal:
		print("WIN")
		current_level += 1
		if current_level > levels.size():
			print("YOU FINISHED")
		else:
			get_tree().change_scene_to_file(levels["level" + str(current_level)])
	else:
		print("WRONG")
