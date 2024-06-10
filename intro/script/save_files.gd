extends Node

onready var panel = $Panel
onready var saving_file = $saving_file
onready var auto = $Panel/MarginContainer/VBoxContainer/Auto as Button
onready var file1 = $Panel/MarginContainer/VBoxContainer/File1 as Button
onready var file2 = $Panel/MarginContainer/VBoxContainer/file2 as Button

# Called when the node enters the scene tree for the first time.
func _ready():
	panel.hide()
	#print(Global.get_current_level())
	saving_file.load_game_button()
	
	if Global.get_current_level() != "" and Global.save_button_click == true:
		file1.text = Global.get_current_level()
		#print("two")
	if Global.get_current_level() !="":
		auto.text = ("Autoload: "+Global.get_current_level())	
		#print("one")
	else:
		auto.text = "Autoload File"
		#file1.text = "File1"
		#print("three")
	#saving_file.load_game_button()
		
	
	
	# Connect signals from buttons to respective functions
	auto.connect("pressed", self, "auto_save")
	file1.connect("pressed", self, "file1")
	#file2.connect("pressed", self, "auto_save")

func auto_save() -> void:
	if Global.save_button_click == true:
		SceneTransition.change_scene(Global.get_map())
		Global.save_triggered = false
	else:
		auto.text = "Autoload File"
		

func file1():
	if Global.save_triggered == false and Global.get_current_level():
		file1.text = Global.get_current_level()
		Global.save_button_click = true
		saving_file.save_game()	
		print(Global.save_button_click)
		Global.save_triggered = true
	else:
		saving_file.load_game_button()
		if Global.save_button_click == true:
			saving_file.load_game()
			SceneTransition.change_scene(Global.get_map())
			Global.save_triggered = false	
		else:
			file1.text = "File 1"

func _on_close_pressed():
	panel.hide()
	#Global.save_triggered = false
