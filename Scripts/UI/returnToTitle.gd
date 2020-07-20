extends Button

# Couldn't set z index with GUI so I'm doing this
func _ready():
	set("z", 2)

# Called when the button attached to this script is pressed
func _pressed():
	get_tree().change_scene("res://Scenes/titleScreen.tscn")
