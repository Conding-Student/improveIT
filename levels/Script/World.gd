extends Node2D

onready var topui = $TopUi
onready var player_controller = $YSort/Player/Controller
onready var pause_ui = $TopUi/pause_menu/pause_menu/Panel
onready var resume = $TopUi/pause_menu/pause_menu/Panel/VBoxContainer/resume as Button
onready var current_level = $TopUi/Level
onready var bat1 = $YSort/Bat
onready var player = $YSort/Player

var current_map = "res://levels/World.tscn"
var bat1_defeated = false
var staring_player_position = Vector2(161,89)

func _ready():	
	#print(Global.get_player_current_position())
	Global.set_player_initial_position(Global.get_player_current_position())
	#set_bat_positions()
	set_player_position()
	Global.set_current_level(current_level.text)
	resume.connect("pressed", self, "resume_the_game")
	
	Global.set_map(current_map)

func set_player_position():
	if Global.get_player_initial_position() == Vector2(0,0):
		Global.set_player_current_position(staring_player_position)
		#print("2nd")
	if Global.get_player_initial_position() != Vector2(0,0) and Global.player_position_retain == true:
		player.position = Global.player_position_engaged
		Global.player_position_retain = false
	else:
		player_new_position()
		#print("3rd")
		#print(Global.get_player_initial_position())
		#print(Global.start_level_trigger)


func player_new_position():
	player.global_position = Global.get_player_current_position()

func set_bat_positions():
	# Only set positions if they haven't been set before
	if Global.get_bat1_current_position() == Vector2(0, 0) and Global.bat1_state == false:
		Global.set_bat1_current_position(bat1.global_position)
		
	elif Global.get_bat1_current_position() and Global.bat1_state == true:
		bat1.position = Global.get_bat1_current_position()
		bat1._on_Stats_no_health()
	else:
		bat1.position = Global.get_bat1_current_position()

func _process(_delta): # New function
		
	Global.set_player_current_position(player.global_position)
	#print(Global.get_player_current_position())
	# Update bat's position in global variables every frame
	if Global.bat1_state:
		pass
	else:
		pass
		#Global.set_bat1_current_position(bat1.global_position)

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
