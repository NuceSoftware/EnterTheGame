extends MarginContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	# if on mobile, show mobile controls
	visible = OS.has_touchscreen_ui_hint() 

