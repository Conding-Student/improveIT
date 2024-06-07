extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_Timer_timeout():
	$ProgressBar.value += 0.95
	
	if $ProgressBar.value >= 50 and $Label.visible:
		$Label.visible = false
		$tip2.visible = true
	
	if $ProgressBar.value >= 100:
		var result = get_tree().change_scene("res://intro/Main_menu.tscn")
		if result != OK:
			print("failed to load"+result)
