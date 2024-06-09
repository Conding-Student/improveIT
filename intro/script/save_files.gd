extends Node

onready var panel = $Panel
onready var saving_file = $saving_file
onready var auto = $Panel/MarginContainer/VBoxContainer/Auto as Button
onready var file1 = $Panel/MarginContainer/VBoxContainer/File1 as Button
onready var file2 = $Panel/MarginContainer/VBoxContainer/file2 as Button

# Called when the node enters the scene tree for the first time.
func _ready():
	panel.hide()
	saving_file.load_game()
	
	if Global.get_current_level() != "":
		file1.text = Global.get_current_level()
	else:
		file1.text = "File1"
	
	# Connect signals from buttons to respective functions
	auto.connect("pressed", self, "auto_save")
	file1.connect("pressed", self, "auto_save")
	file2.connect("pressed", self, "auto_save")

func auto_save() -> void:
	if Global.save_triggered == false and Global.get_current_level():
		file1.text = Global.get_current_level()
		saving_file.save_game()
		Global.save_triggered = true
	else:
		SceneTransition.change_scene(Global.get_map())
		Global.save_triggered = false
func _on_close_pressed():
	panel.hide()
