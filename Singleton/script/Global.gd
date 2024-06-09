extends Node

var player_spawnpoint = Vector2(0, 0)
var player_current_position = Vector2(0,0)
var enemy_position = []
var map = ""
var enemy_name = []
var current_level = ""
var bat1_position_set = Vector2(0,0)
var bat2_position_set = true

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

func set_player_spawnpoint(spawn_point: Vector2):
	player_spawnpoint = spawn_point

func get_player_spawnpoint() -> Vector2:
	return player_spawnpoint

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
