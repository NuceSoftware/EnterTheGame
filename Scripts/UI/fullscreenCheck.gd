extends CheckBox

func _ready():
	grab_focus()
	pressed = OS.window_fullscreen

func _toggled(state):
	OS.window_fullscreen = state
