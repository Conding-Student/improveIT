extends Node


func _on_VideoPlayer_finished():
	var result = get_tree().change_scene("res://intro/progressbar.tscn")
	if result != OK:
		print("Failed to change scene: ", result)
