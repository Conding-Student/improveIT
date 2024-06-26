extends Node

# Variables
var save_triggered = true
var player_position_engaged = Vector2(0, 0)
var player_position_retain = false
var player_initial_position = Vector2(0, 0)
var player_current_position = Vector2(0, 0)
var player_after_door_position = Vector2(0, 0)

var start_level_trigger = false
var door_activated = false

#NPC
var dialogue1 = false

# ENEMY
var enemy_current_position = {"enemy1": Vector2(0, 0),"enemy2": Vector2(0, 0),"enemy3": Vector2(0, 0)}
var enemy_initial_position = {"enemy1": Vector2(0, 0),"enemy2": Vector2(0, 0),"enemy3": Vector2(0, 0)}
var enemy_engaged_position = {"enemy1": Vector2(0, 0),"enemy2": Vector2(0, 0),"enemy3": Vector2(0, 0)}
var enemy_state = {"enemy1": false, "enemy2": false, "enemy3": false}
var enemy_defeated = {"enemy1": false, "enemy2": false, "enemy3": false}

var map = ""
var current_level = ""
var save_button_click = false

# Restarting function
func restarting():
	# Reset player-related variables
	save_triggered = true
	Global.player_current_position = Global.player_initial_position
	Global.player_initial_position = Vector2(0,0)
	Global.player_position_retain = false
	Global.player_position_engaged = Vector2(0,0)
	
	start_level_trigger = false

	# Reset enemy-related variables
	#Global.enemy_current_position = Global.get_enemy_current_position()
	#Global.enemy_initial_position = {"enemy1": Vector2(0, 0)}
	#Global.enemy_engaged_position = {"enemy1": Vector2(0, 0)}
	#Global.enemy_state = {"enemy1": false}
	#Global.enemy_defeated = {"enemy1": false}

	# Reset level-related variables
	current_level = ""
	save_button_click = false


func set_player_after_door_position(new_position: Vector2) -> void:
	player_after_door_position = new_position
	
func get_player_after_door_position() -> Vector2:
	return player_after_door_position

func set_player_position_engaged(new_position: Vector2) -> void:
	player_position_engaged = new_position
	
func get_player_position_engaged() -> Vector2:
	return player_position_engaged

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

