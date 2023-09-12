extends PathFollow2D

signal player_fell_off_the_screen(body)


var time := 0.0


func  _process(delta):
	time += delta
	progress = time * 200.0


func _on_area_2d_body_exited(body):
	player_fell_off_the_screen.emit(body)
