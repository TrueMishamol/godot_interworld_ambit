extends CanvasLayer


signal game_paused
signal game_unpaused


@onready var controls = $Controls
@onready var game_over = $GameOver
@onready var pause = $Pause
@onready var options = $Options


func tmp():
	print("tmp")


func game_over_ui_show():
	controls.hide()
	pause.hide()
	options.hide()
	game_over.show()
	game_paused.emit()


func _input(event):
	if event.is_action_pressed("menu"):
		if game_over.visible:
			return
		elif options.visible:
			options.hide()
			pause.show()
		elif pause.visible:
			pause.hide()
			controls.show()
			game_unpaused.emit()
		else:
			pause.show()
			controls.hide()
			game_paused.emit()


func _on_controls_game_paused():
	controls.hide()
	pause.show()
	game_paused.emit()


func _on_pause_menu_options():
	pause.hide()
	options.show()


func _on_pause_menu_resume():
	controls.show()
	pause.hide()
	game_unpaused.emit()


func _on_game_over_retry():
	game_unpaused.emit()
