extends Particles2D


func _ready():
	emitting = true

func _on_Area2D_body_entered(body):
	emitting = true
	
