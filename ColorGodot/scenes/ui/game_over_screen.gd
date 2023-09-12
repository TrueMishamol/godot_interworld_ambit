extends Control


func _on_retry_pressed():
	get_tree().reload_current_scene()

func _on_quit_pressed():
	get_tree().quit()


func  set_score(value):
	$GameOverScreen/Score.text = "Score: " + str(value)

func  set_best_score(value):
	$GameOverScreen/Best.text = "Best: " + str(value)


