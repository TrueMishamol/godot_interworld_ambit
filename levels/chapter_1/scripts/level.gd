extends Node2D


@onready var _dialogue_box = $DialogueBox


func _ready():
	if !_dialogue_box.running:
		_dialogue_box.start("MISHAMOL")
