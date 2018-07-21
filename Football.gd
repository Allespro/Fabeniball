extends Node2D

var score1 = 0
var score2 = 0
func _process(delta):
	$GUI/Score1.text = str(score1)
	$GUI/Score2.text = str(score2)
	pass
