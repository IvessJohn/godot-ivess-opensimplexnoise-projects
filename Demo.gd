extends Node2D


func _unhandled_input(event):
	if event.is_action_pressed("reload_level"):
		get_tree().reload_current_scene()
