extends TextureButton
class_name Person

@export var person_name: String = "Bob"
@export var lier: bool = false
var player_chooses: bool
var choosen_one: bool = false
@export var said_line: String = "Hi I guess"
var in_text: bool = false

var mouse_inside: bool = false

@export var text_box: RichTextLabel

func _ready() -> void:
	choosen_one = false
	in_text = false
	text_box.visible_ratio = 0
	text_box.text = person_name + "\n" + said_line

func _process(_delta: float) -> void:
	if choosen_one:
		if player_chooses:
			modulate = Color.GREEN
		else:
			modulate = Color.RED
	else:
		modulate = Color.WHITE
	if LevelManager.person_talking != self:
		text_box.visible_ratio = 0
	if mouse_inside:
		if Input.is_action_pressed("Shift"):
			if Input.is_action_pressed("R"):
				choosen_one = false
				return
			if Input.is_action_pressed("Right Click"):
				player_chooses = false
				choosen_one = true
				return
			if Input.is_action_pressed("Left Click"):
				player_chooses = true
				choosen_one = true
				return

func _on_pressed() -> void:
	if in_text or Input.is_action_pressed("Shift"):
		return
	in_text = true
	LevelManager.person_talking = self
	for i in text_box.text.length():
		if LevelManager.person_talking == self:
			text_box.visible_characters += 1
			await get_tree().create_timer(0.02).timeout
		else:
			text_box.visible_ratio = 0
			in_text = false
			return
	await get_tree().create_timer(1).timeout
	text_box.visible_ratio = 0
	in_text = false

func _on_mouse_entered() -> void:
	mouse_inside = true

func _on_mouse_exited() -> void:
	mouse_inside = false
