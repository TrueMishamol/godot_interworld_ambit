extends Control


@export var LevelList: LevelListResource
@export var ButtonSceneSwitch: PackedScene


@onready var _container: Container = $ScrollContainer/GridContainer


func _ready():
	for level in LevelList.LevelList:
		var button = ButtonSceneSwitch.instantiate()
		_container.add_child(button)
		
		button.set_level(level)
