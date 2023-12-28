extends Node2D


@onready var _dialogue_box = %DialogueBox


func _ready():
	#if not dialogue_box.running:
		#dialogue_box.start()
	
	if !_dialogue_box.running:
		_dialogue_box.start("MISHAMOL")
		print ("dialogue should run")
