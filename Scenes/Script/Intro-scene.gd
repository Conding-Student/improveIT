extends Node

onready var video_player = $VideoPlayer

func _on_VideoPlayer_finished():
	SceneTransition.change_scene("res://levels/World.tscn")
	#get_tree().change_scene("res://dialogue/introduction.tscn")

func _on_Skip_button_pressed():
	SceneTransition.change_scene("res://levels/World.tscn")
	#SceneTransition.change_scene("res://dialogue/introduction.tscn")
