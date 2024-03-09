extends Node

@onready var instance_maps: Node2D = get_tree().get_root().get_node("main/instance_maps")

func get_instance_data(instance):
	var instance_data: Array = []
	
	for i in range(0, instance_maps.get_child_count()):
		if instance_maps.get_child(i).instance == instance:
			var instance_node: c_instance = instance_maps.get_child(i)
			for j in range(0, instance_node.get_child_count()):
				var region_node: c_region = instance_node.get_child(j)
				var region_data: Array = [region_node.name, region_node.indoors, region_node.position, region_node.size]
				instance_data.append(region_data)
				
	return instance_data
