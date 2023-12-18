extends Label


var text_variants := [
	"don't fly out!",
	"slippery slippy",
	"interworld danger!",
	]


func _ready():
	_show_random_text()

func _show_random_text():
	text = text_variants[randi() % text_variants.size()]
