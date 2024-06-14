extends Node

func save_game():
	var save_data = {
		"players_health": PlayerStats.health,
		"save_button_click": Global.save_button_click,
		"map": Global.get_map(),
		"current_level": Global.get_current_level(),
		"player_current_position": Global.get_player_current_position(),
		"player_initial_position": Global.player_initial_position,
		"player_position_engaged": Global.player_position_engaged,
		"player_position_retain": Global.player_position_retain,
		# ENEMY
		"enemy_current_position": Global.enemy_current_position,
		"enemy_initial_position": Global.enemy_initial_position,
		"enemy_engaged_position": Global.enemy_engaged_position,
		"enemy_state": Global.enemy_state,
		"enemy_defeated": Global.enemy_defeated
	}
	
	# Convert Vector2 to array for JSON serialization
	save_data["player_current_position"] = [save_data["player_current_position"].x, save_data["player_current_position"].y]
	save_data["player_initial_position"] = [save_data["player_initial_position"].x, save_data["player_initial_position"].y]
	save_data["player_position_engaged"] = [save_data["player_position_engaged"].x, save_data["player_position_engaged"].y]
	
	# Convert enemy positions to arrays
	var enemy_current_position = {}
	for enemy in Global.enemy_current_position:
		enemy_current_position[enemy] = [Global.enemy_current_position[enemy].x, Global.enemy_current_position[enemy].y]
	save_data["enemy_current_position"] = enemy_current_position
	
	var enemy_initial_position = {}
	for enemy in Global.enemy_initial_position:
		enemy_initial_position[enemy] = [Global.enemy_initial_position[enemy].x, Global.enemy_initial_position[enemy].y]
	save_data["enemy_initial_position"] = enemy_initial_position
	
	var enemy_engaged_position = {}
	for enemy in Global.enemy_engaged_position:
		enemy_engaged_position[enemy] = [Global.enemy_engaged_position[enemy].x, Global.enemy_engaged_position[enemy].y]
	save_data["enemy_engaged_position"] = enemy_engaged_position
	
	# Save to file
	var file = File.new()
	var error = file.open("user://file.txt", File.WRITE)
	if error == OK:
		var save_string = JSON.print(save_data)
		file.store_string(save_string)
		file.close()
	else:
		print("Failed to open file for writing")


func load_game() -> void:
	var file = File.new()
	var error = file.open("user://file.txt", File.READ)
	if error == OK:
		var content = file.get_as_text()
		file.close()
		var loaded_data = JSON.parse(content).result

		# player positions
		Global.set_player_current_position(Vector2(loaded_data["player_current_position"][0], loaded_data["player_current_position"][1]))
		Global.set_player_initial_position(Vector2(loaded_data["player_initial_position"][0], loaded_data["player_initial_position"][1]))
		Global.set_player_position_engaged(Vector2(loaded_data["player_position_engaged"][0], loaded_data["player_position_engaged"][1]))
		Global.player_position_retain = loaded_data["player_position_retain"]
		
		# enemy positions
		for enemy in loaded_data["enemy_current_position"]:
			Global.set_enemy_current_position(enemy, Vector2(loaded_data["enemy_current_position"][enemy][0], loaded_data["enemy_current_position"][enemy][1]))
		
		for enemy in loaded_data["enemy_initial_position"]:
			Global.set_enemy_initial_position(enemy, Vector2(loaded_data["enemy_initial_position"][enemy][0], loaded_data["enemy_initial_position"][enemy][1]))
		
		for enemy in loaded_data["enemy_engaged_position"]:
			Global.set_enemy_engaged_position(enemy, Vector2(loaded_data["enemy_engaged_position"][enemy][0], loaded_data["enemy_engaged_position"][enemy][1]))
		
		# enemy state and defeated status
		Global.enemy_state = loaded_data["enemy_state"]
		Global.enemy_defeated = loaded_data["enemy_defeated"]
		
		# other data
		Global.set_map(loaded_data["map"])
		Global.set_current_level(loaded_data["current_level"])
		Global.save_button_click = loaded_data["save_button_click"]
		PlayerStats.health = loaded_data["players_health"]
	else:
		print("Failed to open file for reading")


func load_game_button() -> void:
	var file = File.new()
	var error = file.open("user://file.txt", File.READ)
	if error == OK:
		var content = file.get_as_text()
		file.close()
		var loaded_data = JSON.parse(content).result

		# Fetch and set the save_button_click value
		Global.save_button_click = loaded_data["save_button_click"]
		Global.set_current_level(loaded_data["current_level"]) 
	else:
		print("Failed to open file for reading")
