extends Node


func _ready():
	#pass
	var new_dialog = Dialogic.start('trial')
	add_child(new_dialog)
	new_dialog.connect("timeline_end", self, "after_dialog")

func after_dialog(timelinename):
	SceneTransition.change_scene("res://levels/World.tscn")


