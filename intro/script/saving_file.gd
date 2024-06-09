extends Node

func save_game():
	var save_data = {
		"player_initial_position": Global.player_initial_position,
		"enemy_position": Global.get_enemy_position(),
		"enemy_name": Global.get_enemy_name(),
		"bat1_current_position": Global.get_bat1_current_position(),
		"map": Global.get_map(),
		"current_level": Global.get_current_level(),
		"player_current_position": Global.get_player_current_position(),
		"bat1_state": Global.bat1_state
	}

	# Convert Vector2 to array for JSON serialization
	save_data["player_current_position"] = [save_data["player_current_position"].x, save_data["player_current_position"].y]
	var enemy_positions_converted = []
	for pos in save_data["enemy_position"]:
		enemy_positions_converted.append([pos.x, pos.y])
	save_data["enemy_position"] = enemy_positions_converted

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

		# Convert arrays back to Vector2
		var player_pos_array = loaded_data["player_current_position"]
		var player_position = Vector2(player_pos_array[0], player_pos_array[1])
		Global.set_player_current_position(player_position)
		
		# Convert arrays back to Vector2
		var player_Inpos_array = loaded_data["player_current_position"]
		var player_Inposition = Vector2(player_Inpos_array[0], player_Inpos_array[1])
		Global.set_player_initial_position(player_Inposition)

		
		var position_string = loaded_data["bat1_current_position"]
		

		# Remove the parentheses and spaces, then split on the comma
		var position_array = position_string.replace("(", "").replace(")", "").replace(" ", "").split(",")
		var position = Vector2(float(position_array[0]), float(position_array[1]))

		
		Global.set_bat1_current_position(position)

		Global.bat1_state = loaded_data["bat1_state"]
		Global.set_map(loaded_data["map"])
		Global.set_current_level(loaded_data["current_level"])

		
	else:
		print("Failed to open file for reading")
