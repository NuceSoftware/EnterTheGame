extends Button

# Called when the button attached to this script is pressed
var newSong = preload("res://Music/Pigstep.ogg")

func _ready():
	grab_focus()

func _pressed():
	get_tree().change_scene("res://Scenes/Levels/levelOne.tscn")
	get_node("/root/AudioManager/Visualiser").hide()
	
	if get_node("/root/AudioManager/Visualiser").musicEnabled == true:
		get_node("/root/AudioManager/").playing = false
		get_node("/root/AudioManager/").set_stream(newSong)
		get_node("/root/AudioManager/").playing = true
