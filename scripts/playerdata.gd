extends Node

@onready var console_display: Label = get_tree().get_root().get_node("main/console/scroll/console_display")
@onready var console: console_controller = get_tree().get_root().get_node("main/console")

var hp: float = 100.0
var MAX_HP: int = 100
var sick: float = 0.0
var rad: float = 0.0

var instance = gamedata.Instance.A2
var region: int = 0
var coords: Vector2 = Vector2(0, 0)

var pouch: Dictionary = {
	"pPills": 12,
	"bPills": 5,
	"hPills": 5,
}

func _ready():
	gamedata.connect("tick", tick)
	
func tick():
	if check_for_gamma():
		rad += 0.0005

func hop(type: int):
	match type:
		0:
			var previous_instance = instance
			instance = gamedata.get_random_instance(instance)
			pouch["hPills"] -= 1
			var print_str: String = "used a pill and hopped from " + gamedata.instance_to_str(previous_instance) + " to " + gamedata.instance_to_str(instance)
			console.console_print(print_str)

func check_for_gamma():
	if instance == gamedata.Instance.G1 or instance == gamedata.Instance.G2 or instance == gamedata.Instance.G3:
		return true
	else:
		return false
