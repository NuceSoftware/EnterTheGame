extends KinematicBody2D

var WALK_FORCE = 4000
var WALK_MAX_SPEED = 400
const STOP_FORCE = 1800
const JUMP_SPEED = 800

var velocity = Vector2()

onready var gravity = 1400

func _physics_process(delta):
	if position.y > 1000:
		position.x = 0
		position.y = 0
	
	if Input.get_action_strength("sprint"):
		WALK_FORCE = 4000
		WALK_MAX_SPEED = 600
	else:
		WALK_FORCE = 4000
		WALK_MAX_SPEED = 400
	
	# Horizontal movement code. First, get the player's input.
	var walk = WALK_FORCE * (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"))
	# Slow down the player if they're not trying to move.
	if abs(walk) < WALK_FORCE * 0.2:
		# The velocity, slowed down a bit, and then reassigned.
		velocity.x = move_toward(velocity.x, 0, STOP_FORCE * delta)
	else:
		velocity.x += walk * delta
	# Clamp to the maximum horizontal movement speed.
	velocity.x = clamp(velocity.x, -WALK_MAX_SPEED, WALK_MAX_SPEED)

	# Vertical movement code. Apply gravity.
	velocity.y += gravity * delta

	# Move based on the velocity and snap to the ground.
	velocity = move_and_slide_with_snap(velocity, Vector2.DOWN, Vector2.UP)

	# Check for jumping. is_on_floor() must be called after movement code.
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = -JUMP_SPEED





func _on_bounce_trigger(body):
	velocity.y = -JUMP_SPEED * 1.7
