extends Node


@onready var player: CharacterBody2D = $"../Player"
@onready var ingame_ui = $"../IngameUI"


var score := 0
var best_score


func _ready():
	player.defeated.connect(_on_player_defeated)

	var save_file = FileAccess.open("user://save.data",FileAccess.READ)
	if save_file != null:
		best_score = save_file.get_32()
	else:
		best_score = 0
		save_game()


func save_game():
	var save_file = FileAccess.open("user://save.data",FileAccess.WRITE)
	save_file.store_32(best_score)


func _on_player_defeated():
	ingame_ui.game_over.set_score(score)
	update_best_score()
	ingame_ui.game_over.set_best_score(best_score)

	await get_tree().create_timer(1).timeout
	ingame_ui.game_over_ui_show()


func update_best_score():
	if score > best_score:
		best_score = score
	print("Score: ", score, ". Best score: ", best_score)
	save_game()
