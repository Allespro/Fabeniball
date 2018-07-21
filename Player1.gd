
##var tm = 0
##onst GRAV = 14;
#const JUMP = 500 #230
#const SPEED = 200
#var dir = Vector2()
#
#func _physics_process(delta):
#
#	if Input.is_action_pressed('ui_left'):
#		dir.x = -1
#	elif Input.is_action_pressed('ui_right'):
#		dir.x = 1
#	else:
#		dir.x = 0
#
#	if  Input.is_action_just_pressed('ui_up'):
#		dir.y = -1;
#
#	else:
#		dir.y = 0
#
#
#	if  Input.is_action_just_pressed('ui_down'):
#		dir.y = 0.5;
#
#
#	if dir.y:
#		dir.y *= JUMP
#		dir.y += 150;
#
#		set_axis_velocity(dir)
#	if dir.x:
#		dir.x *= SPEED
#		set_axis_velocity(dir)
#

extends "res://Character.gd"
# Grounded?
var grounded = false 

# Jumping
var can_jump = false
var jump_time = 0
const TOP_JUMP_TIME = 0.1 # in seconds

# Start
func _ready():
	# Set player properties
	acceleration = 1000
	top_move_speed = 200
	top_jump_speed = 400

# Apply force
func apply_force(state):
	# Move Left
	if(Input.is_action_pressed("ui_left2")):
		directional_force += DIRECTION.LEFT
	
	# Move Right
	if(Input.is_action_pressed("ui_right2")):
		directional_force += DIRECTION.RIGHT
	
	# Jump
	if(Input.is_action_pressed("ui_up2") && jump_time < TOP_JUMP_TIME && can_jump):
		directional_force += DIRECTION.UP
		jump_time += state.get_step()
	elif(Input.is_action_just_released("ui_up2")):
		can_jump = false # Prevents the player from jumping more than once while in air
	
	# Go down
	if(Input.is_action_pressed("ui_down2")):
		directional_force += DIRECTION.DOWN
	# While on the ground
	if(grounded):
		can_jump = true
		jump_time = 0


# Enter Ground
func _on_Player1_body_entered(body):
		# Get groups
	var groups = body.get_groups()
	
	# If we are on a solid ground
	if(groups.has("solid")):
		grounded = true





# Exit Ground

	# Get groups
func _on_Player1_body_exited(body):
# Get groups
	var groups = body.get_groups()
	
	# If we are on a solid ground
	if(groups.has("solid")):
		grounded = false



