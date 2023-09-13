extends Control


signal game_paused


func _on_pause_pressed():
	game_paused.emit()
