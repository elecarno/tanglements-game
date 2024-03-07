extends Control

@onready var display: Label = get_node("instance_display")

func _process(delta):
	instancedata.get_instance_data(playerdata.instance)
	#var region_data = gamedata.region_data[playerdata.instance][playerdata.region]
	#var type: String = "Outdoors"
	#if region_data[1]:
		#type = "Indoors"
	#display.text = region_data[0] + "\n" + str(playerdata.coords) + "\n" + type
	pass
