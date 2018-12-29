extends Node2D

func _on_Area2D_body_entered(body):
	get_tree().change_scene("level3/level3.tscn")	
