extends Control
class_name BaseLevel

@export var amount_of_liers: int = 1
var people_choosen: Array = []
@export var level_goal: Array = [true, true, false]

@export var finish_button: Button
@export var people_node: Control

func _on_button_pressed() -> void:
	people_choosen.clear()
	for i in people_node.get_children():
		if i is Person:
			if !i.choosen_one:
				return
			people_choosen.append(i.player_chooses)
	LevelManager.finish_level(people_choosen, level_goal)
