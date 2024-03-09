extends Control

@onready var display: Label = get_node("instance_display")

func _process(_delta):
	var instance_data = instancedata.get_instance_data(playerdata.instance)
	var region_data = instance_data[playerdata.region]
	var type: String = "Outdoors"
	if region_data[1]:
		type = "Indoors"
		
	var distances: Array = []
	for i in range(0, instance_data.size()):
		if i != playerdata.region:
			var dist: float = round(playerdata.coords.distance_to(instance_data[1][2]))
			distances.append(instance_data[1][0].capitalize() + " (" + str(dist) + ")")

	display.text = region_data[0].capitalize() + "\n" + str(playerdata.coords) + "\n" + type + "\n\n" + str(distances[0])
