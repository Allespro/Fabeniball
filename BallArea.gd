extends Area2D

const vel = Vector2(0, 0)
var goal = false

func _on_BallArea_area_entered(area):
	
	var groups = area.get_groups()
	print (groups)
	if(groups.has("goal")):
		$"../".global_position.x=530
		$"../".global_position.y=-100
		$"../".set_axis_velocity(vel)
		$goal/anim.play('success')
	
	if(groups.has("out")):
		$"../".global_position.x=530
		$"../".global_position.y=-100
		$"../".set_axis_velocity(vel)
		
	
	pass # replace with function body
