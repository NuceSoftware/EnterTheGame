extends ParallaxBackground

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var multiplier = 7

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if event is InputEventMouseMotion:
		var mouse_x = event.position.x
		var mouse_y = event.position.y
		
		var viewport_size = OS.get_window_size()
		
		var relative_x = (mouse_x - (viewport_size.x/2)) / (viewport_size.x/2)
		var relative_y = (mouse_y - (viewport_size.y/2)) / (viewport_size.y/2)
		
		get_node("../ParallaxBackground/ParallaxLayer").motion_offset.x = multiplier * relative_x
		get_node("../ParallaxBackground/ParallaxLayer").motion_offset.y = multiplier * relative_y
