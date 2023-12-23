extends TextureButton


@export var level: PackedScene


func _on_pressed():
	if level == null:
		return
	get_tree().set_deferred("paused", false)
	get_tree().change_scene_to_packed(level)
