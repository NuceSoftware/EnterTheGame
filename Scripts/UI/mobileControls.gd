extends MarginContainer

var moveLeft = InputEventAction.new()
var moveRight = InputEventAction.new()
var moveJump = InputEventAction.new()
var moveSprint = InputEventAction.new()
var escapeAction = InputEventAction.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	# if on mobile, show mobile controls
	# visible = OS.has_touchscreen_ui_hint() 
	escapeAction.action = "ui_cancel"
	moveLeft.action = "ui_left"
	moveRight.action = "ui_right"
	moveJump.action = "jump"
	moveSprint.action = "sprint"


func _on_paused_pressed():
	escapeAction.pressed = true
	visible = false
	Input.parse_input_event(escapeAction)


func _on_right_button_pressed():
	moveRight.pressed = true
	Input.parse_input_event(moveRight)

func _on_right_release():
	moveRight.pressed = false
	Input.parse_input_event(moveRight)

func _on_left_pressed():
	moveLeft.pressed = true
	Input.parse_input_event(moveLeft)

func _on_left_released():
	moveLeft.pressed = false
	Input.parse_input_event(moveLeft)

func _on_sprint_pressed():
	moveSprint.pressed = true
	Input.parse_input_event(moveSprint)

func on_sprint_released():
	moveSprint.pressed = false
	Input.parse_input_event(moveSprint)


func _on_jump_pressed():
	moveJump.pressed = true
	Input.parse_input_event(moveJump)

func _on_jump_released():
	moveJump.pressed = false
	Input.parse_input_event(moveJump)
