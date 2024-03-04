extends Control

@onready var status_display: Label = get_node("status_display")
@onready var timestamp: Label = get_node("timestamp")

func _process(_delta):
	var sick_str = "\n" + str(playerdata.sick * 100) + "%"
	var rad_str = "\n" + str(playerdata.rad * 100) + "%"
	status_display.text = "%.2f / %.2f" % [playerdata.hp, playerdata.MAX_HP] + sick_str + rad_str
	timestamp.text = str(gamedata.global_tick) + " (" + gamedata.instance_to_str(playerdata.instance) + ")"
