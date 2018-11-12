extends Node2D


var score = 0 setget _set_score_current


signal score_changed

func _ready():
	pass



func _set_score_current(new_value):
	score = new_value
	emit_signal("score_changed")
	pass
