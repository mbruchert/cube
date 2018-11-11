extends Node2D

func _on_Area2D_body_entered(body):
	get_node("../../.").score += 1;
	visible = false
