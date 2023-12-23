extends Control


func _on_retry_pressed():
	get_tree().set_deferred("paused", false)
	get_tree().reload_current_scene()


func set_score(value):
	$GameOverScreen/Score.text = "Score: " + str(value)

func set_best_score(value):
	$GameOverScreen/Best.text = "Best: " + str(value)
