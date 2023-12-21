extends CharacterBody2D


@onready var movable_level_borders = %MovableLevelBorders


signal defeated


const MAX_SPEED = 500
const ACCELERATION = 1500
const FRICTION = 600


func _ready():
	movable_level_borders.player_fell_off_the_screen.connect(_on_player_fell_off_the_screen)


func  _physics_process(delta):
	player_movement(delta)
	

func  player_movement(delta):
	var input_direction = Input.get_vector("left", "right", "up", "down").normalized()
	
	if input_direction == Vector2.ZERO:
		# Slows
		if velocity.length() > (FRICTION * delta):
			velocity -=velocity.normalized() * (FRICTION * delta)
		else:
			velocity = Vector2.ZERO
	else:
		# Speeds
		velocity += (input_direction * ACCELERATION * delta)
		velocity = velocity.limit_length(MAX_SPEED)
		
	move_and_slide()
	
	# rotate
	look_at(get_global_mouse_position())


func die():
	print("Game over, ", self)
	defeated.emit()
	queue_free()


func _on_player_fell_off_the_screen(_body):
	die()

