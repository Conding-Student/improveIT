extends Node

func save_game():
	var save_data = {
		"player_position": Global.get_player_spawnpoint(),
		"enemy_position": Global.get_enemy_position(),
		"enemy_name": Global.get_enemy_name(),
		"bat1_position_set": Global.bat1_position_set,
		"bat2_position_set": Global.bat2_position_set,
		"map": Global.get_map()
	}

	# Convert Vector2 to array for JSON serialization
	save_data["player_position"] = [save_data["player_position"].x, save_data["player_position"].y]
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
		var player_pos_array = loaded_data["player_position"]
		var player_position = Vector2(player_pos_array[0], player_pos_array[1])
		Global.set_player_spawnpoint(player_position)

		Global.enemy_position.clear()
		for pos_array in loaded_data["enemy_position"]:
			var pos = Vector2(pos_array[0], pos_array[1])
			Global.set_enemy_position(pos)

		Global.enemy_name = loaded_data["enemy_name"]
		Global.bat1_position_set = loaded_data["bat1_position_set"]
		Global.bat2_position_set = loaded_data["bat2_position_set"]
		Global.set_map(loaded_data["map"])
		
		SceneTransition.change_scene(Global.get_map())
	else:
		print("Failed to open file for reading")
