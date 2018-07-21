extends Area2D

func _on_Goal2Area_area_entered(area):
	var groups = area.get_groups()
	print(groups)
	if (groups.has("ball")):
		$"../".score2 += 1
		#$"../Goal".play()
	pass # replace with function body
