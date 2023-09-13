extends Node


func pause_game():
	get_tree().set_deferred("paused", true)
	
func run_game():
	get_tree().set_deferred("paused", false)


func _on_ingame_ui_game_paused():
	pause_game()


func _on_ingame_ui_game_unpaused():
	run_game()
