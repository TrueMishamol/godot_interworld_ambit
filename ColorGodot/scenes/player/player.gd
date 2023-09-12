extends CharacterBody2D


const SPEED = 300

signal defeated


func _process(_delta):
	
	# input
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * SPEED
	move_and_slide()
	
	# rotate
	look_at(get_global_mouse_position())

	var player_direction = (get_global_mouse_position() - position).normalized()		


func die():
	print("Game over, ", self)
	defeated.emit()
	queue_free()


func _on_movable_level_borders_player_fell_off_the_screen(body):
	die()
