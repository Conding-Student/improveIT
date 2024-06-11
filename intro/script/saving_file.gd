extends Node

func save_game():
	var save_data = {
		"enemy_position": Global.get_enemy_position(),
		"enemy_name": Global.get_enemy_name(),
		"save_button_click": Global.save_button_click,
		"map": Global.get_map(),
		"current_level": Global.get_current_level(),
		"player_current_position": Global.get_player_current_position(),
		"player_initial_position": Global.player_initial_position,
		"player_position_engaged": Global.player_position_engaged,
		"player_position_retain": Global.player_position_retain,
		"bat1_current_position": Global.get_bat1_current_position(),
		"bat1_initial_position": Global.bat1_initial_position,
		"bat1_position_engaged": Global.bat1_position_engaged,
		"bat1_state": Global.bat1_state,
		"bat1_defeated": Global.bat1_defeated
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

		# player current position
		var player_pos_array = loaded_data["player_current_position"]
		var player_position = Vector2(player_pos_array[0], player_pos_array[1])
		Global.set_player_current_position(player_position)
		
		# player initial position
		var player_Inpos_array = loaded_data["player_initial_position"]
		var player_Inposition = Vector2(player_Inpos_array[0], player_Inpos_array[1])
		Global.set_player_initial_position(player_Inposition)
		
		# player engaged position
		var player_Enpos_array = loaded_data["player_position_engaged"]
		var player_Enposition = Vector2(player_Enpos_array[0], player_Enpos_array[1])
		Global.set_player_position_engaged(player_Enposition)

		# player retain position
		Global.player_position_retain = loaded_data["player_position_retain"]
		
		#bat1 current position
		var position_string = loaded_data["bat1_current_position"]
		var position_array = position_string.replace("(", "").replace(")", "").replace(" ", "").split(",")
		var position = Vector2(float(position_array[0]), float(position_array[1]))
		Global.set_bat1_current_position(position)
		
		#bat1 engaged position
		var Enposition_string = loaded_data["bat1_position_engaged"]
		var Enposition_array = Enposition_string.replace("(", "").replace(")", "").replace(" ", "").split(",")
		var Enposition = Vector2(float(Enposition_array[0]), float(Enposition_array[1]))
		Global.set_bat1_position_engaged(Enposition)
		
		#bat1 initial position
		var Inposition_string = loaded_data["bat1_initial_position"]
		var Inposition_array = Inposition_string.replace("(", "").replace(")", "").replace(" ", "").split(",")
		var Inposition = Vector2(float(Inposition_array[0]), float(Inposition_array[1]))
		Global.set_bat1_position_engaged(Inposition)

		#bat1 state
		Global.bat1_state = loaded_data["bat1_state"]
		Global.bat1_defeated = loaded_data["bat1_defeated"]
		
		
		Global.set_map(loaded_data["map"])
		Global.set_current_level(loaded_data["current_level"])
		Global.save_button_click = loaded_data["save_button_click"]
		
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


