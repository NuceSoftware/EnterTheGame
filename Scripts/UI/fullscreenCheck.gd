extends CheckBox

func _ready():
	pressed = OS.window_fullscreen

func _toggled(state):
	OS.window_fullscreen = state
