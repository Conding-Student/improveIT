extends Area2D


func _on_battle_mode_body_entered(body):
	call_deferred("change_scene", "res://Battlescenes/battle_scene_forest.tscn")

func change_scene(scene_path: String):
	get_tree().change_scene(scene_path)

