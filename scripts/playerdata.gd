extends Node

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

func hop():
	var previous_instance = instance
	instance = gamedata.get_random_instance(instance)
	pouch["hPills"] -= 1
	print("player hopped from " + gamedata.instance_to_str(previous_instance) + " to " + gamedata.instance_to_str(instance))

func check_for_gamma():
	if instance == gamedata.Instance.G1 or instance == gamedata.Instance.G2 or instance == gamedata.Instance.G3:
		return true
	else:
		return false
