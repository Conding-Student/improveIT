extends Node

var save_triggered = true
var player_position_engaged = Vector2(0,0)
var player_position_retain = false
var player_initial_position = Vector2(0,0)
var player_current_position = Vector2(0,0)

var start_level_trigger = false

# ENEMY
var enemy_current_position = {"enemy1": Vector2(0, 0)}
var enemy_initial_position = {"enemy1": Vector2(0, 0)}
var enemy_engaged_position = {"enemy1": Vector2(0, 0)}
var enemy_state = {"enemy1": false}
var enemy_defeated = {"enemy1": false}

var map = ""
var enemy_name = []
var current_level = ""
var save_button_click = false

func set_player_position_engaged(new_position: Vector2) -> void:
	player_position_engaged = new_position
	
func restarting():
	Global.player_current_position = Global.player_initial_position
	Global.player_initial_position = Vector2(0,0)
	Global.player_position_retain = false
	Global.player_position_engaged = Vector2(0,0)
	
	current_level = ""
	Global.bat1_position_set = Global.bat1_initial_position
	#bat1_state = false lagyan mo ito nang engaged position
	enemy_current_position = []
	enemy_name = []
	
func get_player_initial_position() -> Vector2:
	return player_initial_position

func set_player_initial_position(new_position: Vector2) -> void:
	player_initial_position = new_position
	
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

# ENEMIES
func get_enemy_defeated(key) -> bool:
	return enemy_defeated[key]

func set_enemy_defeated(key,position: bool):
	enemy_defeated.erase(key)
	enemy_defeated[key] = position
	
func get_enemy_state(key) -> bool:
	return enemy_state[key]

func set_enemy_state(key,position: bool):
	enemy_state.erase(key)
	enemy_state[key] = position


func get_enemy_engaged_position(key) -> Vector2:
	return enemy_engaged_position[key]

func set_enemy_engaged_position(key,position: Vector2):
	enemy_engaged_position.erase(key)
	enemy_engaged_position[key] = position

func get_enemy_current_position(key) -> Vector2:
	return enemy_current_position[key]

func set_enemy_current_position(key,position: Vector2):
	enemy_current_position.erase(key)
	enemy_current_position[key] = position

func get_enemy_initial_position(key) -> Vector2:
	return enemy_initial_position[key]

func set_enemy_initial_position(key,position: Vector2):
	enemy_initial_position.erase(key)
	enemy_initial_position[key] = position

func get_enemy_name() -> Array:
	return enemy_name

func set_enemy_name(name: String):
	enemy_name.append(name)

func set_array_enemy_name(array: Array):
	enemy_name = array
