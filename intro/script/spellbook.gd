extends Node

onready var ui = $Panel
onready var methods = $methods
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#ui.hide()



func _on_close_pressed():
	ui.hide()


func _on_pictureIG_pressed():
	methods.show()
