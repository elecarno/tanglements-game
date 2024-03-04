extends Control

@onready var input: LineEdit = get_node("input")

func _on_input_text_submitted(cmd):
	input.clear()
	
	match cmd:
		"hop": 
			if playerdata.pouch["hPills"] > 0:
				playerdata.hop()
