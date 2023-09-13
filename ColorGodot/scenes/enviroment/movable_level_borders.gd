extends PathFollow2D

signal player_fell_off_the_screen(body)
signal enemy_fell_off_the_screen(body)
signal enemy_enters_the_screen(body)


var time := 0.0


func  _process(delta):
	time += delta
	progress = time * 200.0


func _on_area_player_exited(body):
	player_fell_off_the_screen.emit(body)


func _on_area_enemy_exited(body):
	enemy_fell_off_the_screen.emit(body)


func _on_area_enemy_body_entered(body):
	enemy_enters_the_screen.emit(body)
