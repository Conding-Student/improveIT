extends Node

var save_triggered = true
var player_position_engaged = Vector2(0,0)
var player_position_retain = false
var player_initial_position = Vector2(0,0)
var player_current_position = Vector2(0,0)
var start_level_trigger = false
var enemy_position = []
var map = ""
var enemy_name = []
var current_level = ""
var bat1_position_set = Vector2(0,0)
var bat1_state = false

func set_player_position_engaged(new_position: Vector2) -> void:
	player_position_engaged = new_position
	
func restarting():
	Global.player_current_position = Global.player_initial_position
	current_level = ""
	bat1_position_set = Vector2(0,0)
	bat1_state = false
	enemy_position = []
	enemy_name = []
	
func get_player_initial_position() -> Vector2:
	return player_initial_position

func set_player_initial_position(new_position: Vector2) -> void:
	player_initial_position = new_position
	
func set_bat1_current_position(new_position: Vector2) -> void:
	bat1_position_set = new_position

func get_bat1_current_position():
	return bat1_position_set
	
func get_player_current_position() -> Vector2:
	return player_current_position

func set_player_current_position(new_position: Vector2) -> void:
	player_current_position = new_position

func get_current_level():
	return current_level

func set_current_level(new_level):
	current_level = new_level

func set_map(new_map):
	map = new_map

func get_map():
	return map

func get_enemy_position() -> Array:
	return enemy_position

func set_enemy_position(position: Vector2):
	enemy_position.append(position)

func get_enemy_name() -> Array:
	return enemy_name

func set_enemy_name(name: String):
	enemy_name.append(name)

func set_array_enemy_name(array: Array):
	enemy_name = array
