extends Control
class_name BaseLevel

@export var amount_of_liers: int = 1
var people_choosen: Array = []
@export var level_goal: Array[bool] = [true, true, false]

@export var finish_button: Button
@export var people_node: Control
@export var note: RichTextLabel
var note_open: bool = false

var page_number: int = 1

func _ready() -> void:
	page_number = LevelManager.current_level
	note.text = NotesManager.note_adds[page_number]
	$RichTextLabel.text = str(amount_of_liers) + " Lier(s)"

func _process(_delta: float) -> void:
	$NotesButtons/PageContainer/PageNumber.text = str(page_number)

func _on_button_pressed() -> void:
	people_choosen.clear()
	for i in people_node.get_children():
		if i is Person:
			if !i.choosen_one:
				return
			people_choosen.append(i.player_chooses)
	LevelManager.finish_level(people_choosen, level_goal)

func _on_open_pressed() -> void:
	if !$NoteAnimation.is_playing():
		if note_open:
			note_open = false
			$NoteAnimation.play("note_close")
		else:
			note_open = true
			$NoteAnimation.play("note_open")

func _on_back_page_pressed() -> void:
	if page_number > 1:
		page_number -= 1
		note.text = NotesManager.note_adds[page_number]

func _on_next_page_pressed() -> void:
	if page_number < LevelManager.current_level:
		page_number += 1
		note.text = NotesManager.note_adds[page_number]
