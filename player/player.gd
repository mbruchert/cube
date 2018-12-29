extends KinematicBody2D

const FLOOR_NORMAL = Vector2(0, -1)
const SLOPE_SLIDE_STOP = 25.0
const MIN_ONAIR_TIME = 0.1
const WALK_SPEED = 250 # pixels/sec
const JUMP_SPEED = 480
const SIDING_CHANGE_SPEED = 10


var gravity_vec = Vector2(0, 900)
var linear_vel = Vector2()
var onair_time = 0 
var on_floor = false


var anim=""



onready var sprite = $sprite

func _physics_process(delta):
	#increment counters

	onair_time += delta


	### MOVEMENT ###

	# Apply Gravity
	linear_vel += delta * gravity_vec
	# Move and Slide
	linear_vel = move_and_slide(linear_vel, FLOOR_NORMAL, SLOPE_SLIDE_STOP)
	# Detect Floor
	if is_on_floor():
		onair_time = 0

	on_floor = onair_time < MIN_ONAIR_TIME

	### CONTROL ###

	# Horizontal Movement
	var target_speed = 0
	if Input.is_action_pressed("move_left"):
		target_speed += -1
	if Input.is_action_pressed("move_right"):
		target_speed +=  1

	target_speed *= WALK_SPEED
	linear_vel.x = lerp(linear_vel.x, target_speed, 0.1)

	# Jumping
	if on_floor and Input.is_action_just_pressed("jump"):
		linear_vel.y = - JUMP_SPEED
		

	
#### ANIMATION ###
#
	var new_anim = "idle"
#

	if (Input.is_action_pressed("jump")):
		new_anim = "jump"


	if new_anim != anim:
		anim = new_anim
		$anim.play(anim)
	



func _on_gravity_body_entered(body):
	gravity_vec = Vector2(0, -900)


func _on_gravity_body_exited(body):
	gravity_vec = Vector2(0, 900)



func _on_Area2D_body_entered(body):
	linear_vel.y = -1.7 * JUMP_SPEED
