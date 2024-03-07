extends Control

@onready var instance_maps: Control = get_tree().get_root().get_node("main/instance_maps")

func get_instance_data(instance):
	for i in range(0, instance_maps.get_child_count()):
		if instance_maps.get_child(i).instance == instance:
			print("yees")
