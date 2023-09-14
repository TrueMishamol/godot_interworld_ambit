extends Control


signal retry


func _on_retry_pressed():
	get_tree().reload_current_scene()
	retry.emit()


func set_score(value):
	$GameOverScreen/Score.text = "Score: " + str(value)

func set_best_score(value):
	$GameOverScreen/Best.text = "Best: " + str(value)


