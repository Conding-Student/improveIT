extends Node2D

onready var topui = $TopUi
onready var player_controller = $YSort/Player/Controller
onready var pause_ui = $TopUi/pause_menu/pause_menu/Panel
onready var resume = $TopUi/pause_menu/pause_menu/Panel/VBoxContainer/resume as Button

var bat_scene = preload("res://Enemies/Bat.tscn")
var current_map = "res://levels/World.tscn"
var bat1_defeated = false
var bat2_defeated = false
var initial_spawn_point  = Vector2(164, 88)
var bat1_spawn_point = Vector2(-12, 101)  # Adjust as needed
#var bat2_spawn_point = Vector2(301, 86)  # Adjust as needed
# Called when the node enters the scene tree for the first time.

func _ready():	
	
	if Global.get_player_spawnpoint() == Vector2(0, 0):
		Global.set_player_spawnpoint(initial_spawn_point)
	else:
		player_new_position()
	
	resume.connect("pressed",self,"resume_the_game")
	set_bat_positions()
	Global.set_map(current_map)

func player_new_position():
	var player = $YSort/Player
	player.global_position = Global.get_player_spawnpoint()

func spawn_bat(spawn_point: Vector2, bat_position_set: bool):
	if bat_position_set:
		var bat_instance = bat_scene.instance()
		var ysort_node = $YSort  # Adjust this to the correct path to your YSort node
		ysort_node.add_child(bat_instance)
		
		# Set the position of the bat instance
		bat_instance.global_position = spawn_point
		
		# Update the singleton with the bat's position
		Global.set_enemy_position(spawn_point)

func set_bat_positions():
	# Only set positions if they haven't been set before
	if Global.bat1_position_set:
		spawn_bat(bat1_spawn_point, Global.bat1_position_set)
		Global.bat1_position_set = false
	
	#if Global.bat2_position_set:
		#spawn_bat(bat2_spawn_point, Global.bat2_position_set)
		#Global.bat2_position_set = false
		
func resume_the_game() ->void:
	get_tree().paused = false
	topui.visible = true
	player_controller.visible = true
	pause_ui.hide()
	
func _on_pause_game_pressed():
	get_tree().paused = true
	topui.visible = false
	player_controller.visible = false
	pause_ui.show()
