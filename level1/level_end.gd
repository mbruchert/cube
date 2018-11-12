extends TileMap

var anim=""

onready var sprite = $sprite


var new_anim = "idle"
#
	
func _on_Area2D_body_entered(body):
	new_anim = "timer"


	if new_anim != anim:
		anim = new_anim
		$anim.play(anim)
	









func _on_anim_animation_finished(timer):
	get_tree().change_scene("level2/level2.tscn")	
