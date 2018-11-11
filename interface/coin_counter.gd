extends Label




func _on_root_score_changed():
	set_text(str(get_node("../../.").score))
	pass
