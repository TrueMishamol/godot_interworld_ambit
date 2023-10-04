extends Node
class_name Randomizer


static func generate_number(min, max) -> float:
	var random_number_generator = RandomNumberGenerator.new()
	random_number_generator.randomize()
	return random_number_generator.randf_range(min, max)
