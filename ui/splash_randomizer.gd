extends Label


var text_variants := ["text1", "text2", "text3"]


func _ready():
	_show_random_text()

func _show_random_text():
	text = text_variants[randi() % text_variants.size()]
