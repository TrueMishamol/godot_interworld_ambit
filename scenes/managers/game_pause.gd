extends Node


@onready var ingame_ui = $"../IngameUI"


func _ready():
	ingame_ui.game_paused.connect(_on_ingame_ui_game_paused)
	ingame_ui.game_unpaused.connect(_on_ingame_ui_game_unpaused)
	

func _on_ingame_ui_game_paused():
	pause_game()


func _on_ingame_ui_game_unpaused():
	run_game()


func pause_game():
	get_tree().set_deferred("paused", true)
	
	
func run_game():
	get_tree().set_deferred("paused", false)
