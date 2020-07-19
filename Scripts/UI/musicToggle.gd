extends CheckBox

func _toggled(state):
	get_node("/root/AudioManager/").playing = state
