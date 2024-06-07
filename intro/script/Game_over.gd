extends Control

onready var restart_button = $HBoxContainer/VBoxContainer/Restart as Button
onready var main_menu_button = $HBoxContainer/VBoxContainer/Main_menu as Button
onready var exit_button = $HBoxContainer/VBoxContainer/Exit as Button
onready var quit = $Quit/Panel

func _ready():
	main_menu_button.connect("pressed", self, "_on_start_pressed")
	exit_button.connect("pressed", self, "_on_exit_pressed")

func _on_start_pressed() ->void:
	SceneTransition.change_scene("res://intro/Main_menu.tscn")

func _on_exit_pressed() ->void:
	quit.show()



func _on_Restart_pressed():
	SceneTransition.change_scene("res://levels/World.tscn")
