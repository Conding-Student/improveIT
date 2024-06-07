extends Node

onready var ui = $Panel

# Called when the node enters the scene tree for the first time.
func _ready():
	ui.hide()



func _on_close_pressed():
	ui.hide()
