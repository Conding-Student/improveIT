extends Node

onready var panel = $Panel
onready var saving_file = $saving_file
onready var auto = $Panel/MarginContainer/VBoxContainer/Auto as Button
onready var file1 = $Panel/MarginContainer/VBoxContainer/File1 as Button
onready var file2 = $Panel/MarginContainer/VBoxContainer/file2 as Button

# Called when the node enters the scene tree for the first time.
func _ready():
	panel.hide()
	# Connect signals from buttons to respective functions
	auto.connect("pressed", self, "auto_save")
	file1.connect("pressed", self, "load_game_and_transition")
	file2.connect("pressed", self, "auto_save")

func file1():
	auto_save()
	file1.text = Global.get_map()

func auto_save() -> void:
	saving_file.save_game()
	print("save")
	#pass

func load_game_and_transition() -> void:
	saving_file.load_game()
	print("load")

func _on_close_pressed():
	panel.hide()
