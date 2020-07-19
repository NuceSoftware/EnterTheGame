extends CheckBox

func _toggled(state):
	OS.window_fullscreen = state
