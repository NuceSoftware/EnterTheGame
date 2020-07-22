extends Button

func _ready():
	grab_focus()

# Called when the button attached to this script is pressed
func _pressed():
	# Copies to clipboard, might be useful later
	# OS.clipboard = "https://github.com/NuceSoftware/EnterTheGame/"
	OS.shell_open("https://github.com/NuceSoftware/EnterTheGame/")
