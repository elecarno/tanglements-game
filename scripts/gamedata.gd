extends Node

var global_tick: int = 0
var global_tick_float: float = 0.0

enum Instance {
	A1, A2, A3,
	B1, B2,
	G1, G2, G3,
	D1, D2,
}

signal tick()

func _process(delta):
	global_tick_float += (1 * delta)
	var floored_tick = floori(global_tick_float)
	if floored_tick != global_tick:
		global_tick = floored_tick
		emit_signal("tick")

func instance_to_str(instance):
	match instance:
		Instance.A1: return "α-1"
		Instance.A2: return "α-2"
		Instance.A3: return "α-3"
		Instance.B1: return "β-1"
		Instance.B2: return "β-2"
		Instance.G1: return "γ-1"
		Instance.G2: return "γ-2"
		Instance.G3: return "γ-3"
		Instance.D1: return "Δ-1"
		Instance.D2: return "Δ-2"
	#return "N/A"

func get_random_instance(exclude_value: Instance) -> Instance:
	var values = Instance.values()  # Get an array of all enum values
	values.remove_at(values.find(exclude_value))  # Remove the excluded value

	# Get a random index from the modified array
	randomize()
	var random_index = randi() % values.size()

	# Return the randomly selected enum value
	return values[random_index]
