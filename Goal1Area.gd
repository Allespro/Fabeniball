extends Area2D

func _on_Goal1Area_area_entered(area):
	
	var groups = area.get_groups()
	print(groups)
	if (groups.has("ball")):
		$"../".score1 += 1
		#$"../Goal".play()

	
