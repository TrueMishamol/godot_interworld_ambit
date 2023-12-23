extends TextureButton


@export var Level: LevelInfoResource
@export var CustomLabel: String

@onready var _label: Label = $Label


func  _ready():
	_update_label()

func _on_pressed():
	if Level == null:
		return
	get_tree().set_deferred("paused", false)
	get_tree().change_scene_to_packed(Level.Scene)

func _update_label():
	if CustomLabel == "":
		if Level != null:
			_label.text = Level.Name
	else:
		_label.text = CustomLabel

func set_level(level: LevelInfoResource):
	Level = level
	_update_label()
