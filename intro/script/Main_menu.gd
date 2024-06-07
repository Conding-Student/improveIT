class_name mainmenu
extends Control

onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer/Start_new as Button
onready var continue_button =$MarginContainer/HBoxContainer/VBoxContainer/Continue as Button
onready var badges_button = $MarginContainer/HBoxContainer/VBoxContainer/Badges as Button
onready var exit_button = $MarginContainer/HBoxContainer/VBoxContainer/Exit as Button
onready var settings = $settings2/Panel
onready var quit = $Quit/Panel
onready var ui = $CanvasLayer
onready var badges = $CanvasLayer/badges/Panel4
onready var spell_book = $CanvasLayer/Spell_Book/Panel
onready var save_files = $save_files/Panel


func _ready():
	quit.hide()
	settings.hide()
	start_button.connect("pressed", self, "_on_start_pressed")
	exit_button.connect("pressed", self, "_on_exit_pressed")
	continue_button.connect("pressed", self, "_on_continue_pressed")
	

func _on_continue_pressed() ->void:
	save_files.show()

func _on_start_pressed() ->void:
	SceneTransition.change_scene("res://Scenes/Intro-scene.tscn")

func _on_exit_pressed() ->void:
	quit.show()


func _on_settings_pressed():
	settings.show()


func _on_Badges_pressed():
	ui.visible = true
	badges.show()
	
func _on_book_pressed():
	ui.visible = true
	spell_book.show()
