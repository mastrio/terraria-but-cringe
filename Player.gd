extends KinematicBody2D

# Signals
signal moved

## Variables
# Motion
export var speed = 300
export var gravity = 32
export var jumpforce = 1000 #650
export var affected_by_gravity = true
var screen_size
var motion = Vector2.ZERO
# Spawning
var respawn_location

# Ready
func _ready():
	respawn_location = position
	screen_size = get_viewport_rect().size

# Input
func _input(event):
	# Jumping
	if Input.is_action_just_pressed("ui_up"):
		#if is_on_floor():
		motion.y = -jumpforce
		emit_signal("moved", self.position)
		yield(get_tree().create_timer(0.01), "timeout")

# Physics Loop
func _physics_process(delta):
	# Left / Right movement
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
		emit_signal("moved", self.position)
	elif Input.is_action_pressed("ui_left"):
		motion.x = -speed
		emit_signal("moved", self.position)
	else:
		motion.x = lerp(motion.x, 0, 0.25)

	# Gravity
	if (affected_by_gravity):
		motion.y += gravity + delta
	motion = move_and_slide(motion, Vector2.UP)

	# Die if fall off stage lol u bad haha amogus
	#if (position.y >= 1000):
	#	die()

# Die
func die():
	print("You Died!")
	motion.y = 0
	affected_by_gravity = false
	$Box.hide()
	position = respawn_location
	yield(get_tree().create_timer(1), "timeout")
	$Box.show()
	affected_by_gravity = true
