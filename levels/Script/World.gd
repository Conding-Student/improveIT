extends Node2D

onready var topui = $TopUi
onready var player_controller = $YSort/Player/Controller
onready var pause_ui = $TopUi/pause_menu/pause_menu/Panel
onready var resume = $TopUi/pause_menu/pause_menu/Panel/VBoxContainer/resume as Button
onready var current_level = $TopUi/Level
onready var bat1 = $YSort/Bat

var current_map = "res://levels/World.tscn"
var initial_spawn_point  = Vector2(164, 88)
var bat1_defeated = false

func _ready():	
	if Global.get_player_current_position() == Vector2(0, 0):
		Global.set_player_current_position(initial_spawn_point)		
	else:
		player_new_position()
	
	Global.set_current_level(current_level.text)
	resume.connect("pressed", self, "resume_the_game")
	set_bat_positions()
	Global.set_map(current_map)

func player_new_position():
	var player = $YSort/Player
	player.global_position = Global.get_player_current_position()

func set_bat_positions():
	# Only set positions if they haven't been set before
	if Global.get_bat1_current_position() == Vector2(0, 0):
		Global.set_bat1_current_position(bat1.global_position)
		print(Global.get_bat1_current_position())
	else:
		bat1.position = Global.get_bat1_current_position()

func _process(delta): # New function
	# Update bat's position in global variables every frame
	Global.set_bat1_current_position(bat1.global_position)

func resume_the_game() -> void:
	get_tree().paused = false
	topui.visible = true
	player_controller.visible = true
	pause_ui.hide()

func _on_pause_game_pressed():
	get_tree().paused = true
	topui.visible = false
	player_controller.visible = false
	pause_ui.show()
