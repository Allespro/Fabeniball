extends Area2D



func _on_ground_check_area_entered(area):
	var groups1 = area.get_groups()
	
	if(groups1.has("solid") || groups1.has("player2")):
		$"../".grounded = true
	if(groups1.has("out")):
		$"../".global_position.x=530
		$"../".global_position.y=-100
		#$"../".set_axis_velocity(vel)

	


func _on_ground_check_area_exited(area):
	var groups2 = area.get_groups()
	
	if(groups2.has("solid") || groups2.has("player2")):
		$"../".grounded = false
