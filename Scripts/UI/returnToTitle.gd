extends Button

func _ready():
	grab_focus()

# Called when the button attached to this script is pressed
func _pressed():
	get_tree().change_scene("res://Scenes/titleScreen.tscn")
