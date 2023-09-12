extends Node2D


@onready var game_over_screen = $IngameUI/GameOverScreen


var score := 0
var best_score

#func _on_movable_level_borders_player_fell_off_the_screen(body):
#	print("Game over, ", body)
#	remove_child(body)
	

func  _ready():
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
	game_over_screen.set_score(score)
	update_best_score()
	game_over_screen.set_best_score(best_score)
	
	await get_tree().create_timer(1).timeout
	game_over_screen.visible = true

func update_best_score():
	if score > best_score:
		best_score = score
	print("Score: ", score, ". Best score: ", best_score)
	save_game()
