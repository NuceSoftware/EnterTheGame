extends Button

# Called when the button attached to this script is pressed
func _pressed():
	get_tree().change_scene("res://Scenes/Levels/levelOne.tscn")
	get_node("/root/AudioManager/Visualiser").hide()
