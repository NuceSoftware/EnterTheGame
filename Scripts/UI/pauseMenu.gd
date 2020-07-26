extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		# position.x = get_node("../player").position.x
		# position.y = get_node("../player").position.y
		get_tree().paused = not get_tree().paused
		visible = not visible


func _on_resume_pressed():
	if OS.has_touchscreen_ui_hint() == true:
		get_node("/root/Walls/mobileContainer/CanvasLayer").visible = true
	get_tree().paused = false
	visible = false


func _on_returnTitle_pressed():
	var newSong = preload("res://Music/intro.ogg")
	
	get_tree().paused = false
	visible = false
	get_node("/root/AudioManager/Visualiser").show()
	
	if get_node("/root/AudioManager/Visualiser").musicEnabled == true:
		get_node("/root/AudioManager/").playing = false
		get_node("/root/AudioManager/").set_stream(newSong)
		get_node("/root/AudioManager/").playing = true
	
	get_tree().change_scene("res://Scenes/titleScreen.tscn")

