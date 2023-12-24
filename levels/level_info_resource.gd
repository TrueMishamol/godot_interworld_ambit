extends Resource

class_name LevelInfoResource

@export var Name: String = ""
#@export_file("*.tscn","*.scn") var Scene: String = ""
#@export_file("*.tscn","*.scn") var Scene: String = ""
#@export var Scene: PackedScene = null
@export_file("*.tscn","*.scn") var Path: String = "res://levels/menu/main_menu.tscn"
@export var Description: String = ""

#@export_group(String, FILE, "*.tscn,*.scn") var file_path setget set_file_path
