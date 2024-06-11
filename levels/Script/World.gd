extends Node2D

onready var topui = $TopUi
onready var player_controller = $YSort/Player/Controller
onready var pause_ui = $TopUi/pause_menu/pause_menu/Panel
onready var resume = $TopUi/pause_menu/pause_menu/Panel/VBoxContainer/resume as Button
onready var current_level = $TopUi/Level
onready var bat1 = $YSort/Bat
onready var player = $YSort/Player

var current_map = "res://levels/World.tscn"
var staring_player_position = Vector2(-170,-69)
var starting_bat1_position = Vector2(-150,255)

func _ready():	
	#print(Global.bat1_state)
	#print(Global.get_bat1_current_position())
	#print(bat1.position)
	#print(Global.get_player_current_position())
	Global.set_player_initial_position(Global.get_player_current_position())
	Global.set_enemy_initial_position("enemy1",Global.get_enemy_current_position("enemy1"))
	
	set_bat_positions()
	set_player_position()
	
	
	Global.set_current_level(current_level.text)
	resume.connect("pressed", self, "resume_the_game")
	
	Global.set_map(current_map)
	#print(Global.get_current_level())

func set_player_position():
	if Global.get_player_initial_position() == Vector2(0,0):
		Global.set_player_current_position(staring_player_position)
		#print("one")
		#print(Global.get_player_initial_position())
		#print(Global.get_player_current_position())
	elif Global.get_player_initial_position() != Vector2(0,0) and Global.player_position_retain == true:
		player.position = Global.player_position_engaged
		Global.player_position_retain = false
		#print("two")
	elif Global.get_player_initial_position() != Vector2(0,0) and Global.get_enemy_defeated("enemy1") == true:
		player.global_position = Global.get_player_current_position()
		#print("3rd")
	else:
		player.global_position = Global.get_player_current_position()
		#print("4th")
		#print(Global.get_player_initial_position())
		#print(Global.get_player_current_position())
		#print(Global.start_level_trigger)

func set_bat_positions():
	
	# Only set positions if they haven't been set before
	if Global.get_enemy_current_position("enemy1") == Vector2(0,0):		
		Global.set_enemy_current_position("enemy1",Global.get_enemy_initial_position("enemy1"))		
		#print("one")				
	elif Global.get_enemy_current_position("enemy1") != Vector2(0,0) and Global.get_enemy_state("enemy1") == true:
		bat1.position = Global.get_enemy_engaged_position("enemy1")
		bat1._on_Stats_no_health()
		Global.set_enemy_state("enemy1", false)
		Global.set_enemy_defeated("enemy1", true)		
		#print("two")
	elif Global.get_enemy_current_position("enemy1") != Vector2(0,0) and Global.get_enemy_defeated("enemy1") == true:
		bat1.queue_free()
		bat1 = null 
		#print("three")
	else:
		bat1.position = bat1.global_position
		#print("4")
		#print(bat1_defeated)
		#print(Global.bat1_state)

func _process(_delta):
	Global.set_player_current_position(player.global_position)
	#print(Global.get_player_current_position())
	
	if Global.get_enemy_defeated("enemy1") == true:
		pass
	else:
		Global.set_enemy_current_position("enemy1",bat1.global_position)


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


func _on_Area2D_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	Global.set_player_current_position(body.position) 
	#print("position")
	#print(body.position)
	Global.set_enemy_engaged_position("enemy1",Global.get_enemy_current_position("enemy1"))
	#print(Global.bat1_position_engaged)
	Global.player_position_retain = true
	call_deferred("change_scene", "res://Battlescenes/battle_scene_forest.tscn")

func change_scene(scene_path: String):
	get_tree().change_scene(scene_path)
