extends TextureButton


@export_file var level_path


func _on_pressed():
	if level_path == null:
		return
	get_tree().set_deferred("paused", false)
	get_tree().change_scene_to_file(level_path)
