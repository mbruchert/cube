extends Particles2D




func _on_Area2D_body_entered(body):
	emitting = true


func _on_Area2D_body_exited(body):
	emitting = false
	


func _on_Area2D2_body_entered(body):
	emitting = true


func _on_Area2D2_body_exited(body):
	emitting = false
