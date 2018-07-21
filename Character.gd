extends RigidBody2D

# Default Character Properties (Should be overwritten)
var acceleration = 10000
var top_move_speed = 200
var top_jump_speed = 400

# Movement Vars
var directional_force = Vector2()
const DIRECTION = {
	ZERO = Vector2(0, 0),
	LEFT = Vector2(-1, 0),
	RIGHT = Vector2(1, 0),
	UP = Vector2(0, -1),
	DOWN = Vector2(0, 1)
}

func _integrate_forces(state):
	# Final force
	var final_force = Vector2()
	
	# We are not moving when you are not changing the direction
	directional_force = DIRECTION.ZERO
	
	# Apply force on character
	apply_force(state)
	
	# Get movement velocity
	final_force = state.get_linear_velocity() + (directional_force * acceleration)
	
	# Prevent ourselves from exceeding top speeds
	if(final_force.x > top_move_speed):
		final_force.x = top_move_speed
	elif(final_force.x < -top_move_speed):
		final_force.x = -top_move_speed
	# Prevent jumping too fast / falling too fast
	if(final_force.y > top_jump_speed):
		final_force.y = top_jump_speed
	elif(final_force.y < -top_jump_speed):
		final_force.y = -top_jump_speed
	
	# Add force
	state.set_linear_velocity(final_force)

# This func is overwritten by the character
func apply_force(state):
	pass