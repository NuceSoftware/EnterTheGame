extends CheckBox

func _ready():
	pressed = get_node("/root/AudioManager/Visualiser").musicEnabled

func _toggled(state):
	get_node("/root/AudioManager/").playing = state
	get_node("/root/AudioManager/Visualiser").musicEnabled = state
