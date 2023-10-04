extends CharacterBody2D


@onready var movable_level_borders = %MovableLevelBorders


var player_chase = false
var player = null


const MAX_SPEED = 500
const ACCELERATION = 1500
const FRICTION = 600


func _ready():
	movable_level_borders.enemy_fell_off_the_screen.connect(_on_enemy_fell_off_the_screen)
	movable_level_borders.enemy_enters_the_screen.connect(_on_enemy_enters_the_screen)


func  _physics_process(delta):
	movement(delta)
	

func  movement(delta):
	if player_chase and player != null:
		var target_direction: Vector2 = (player.position - position).normalized()
		
		if target_direction == Vector2.ZERO:
			# Slows
			if velocity.length() > (FRICTION * delta):
				velocity -=velocity.normalized() * (FRICTION * delta)
			else:
				velocity = Vector2.ZERO
		else:
			# Speeds
			velocity += (target_direction * ACCELERATION * delta)
			velocity = velocity.limit_length(MAX_SPEED)
			
		move_and_slide()
		
		# Rotate
		look_at(player.global_position)


func _on_detection_area_body_entered(body):
	player = body
#	player_chase = true


func _on_detection_area_body_exited(body):
	player = null
	player_chase = false


func _on_enemy_fell_off_the_screen(body):
	if body == self:
		player_chase = false


func _on_enemy_enters_the_screen(body):
	if body == self:
		player_chase = true
