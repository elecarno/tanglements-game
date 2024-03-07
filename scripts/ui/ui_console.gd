class_name console_controller
extends Control

@onready var input_edit: LineEdit = get_node("input")
@onready var scrollbar: VScrollBar = get_node("scroll").get_v_scroll_bar()
@onready var display: Label = get_node("scroll/console_display")

func _ready() -> void:
	scrollbar.connect("changed", handle_scrollbar_changed)

func _on_input_text_submitted(text: String):
	input_edit.clear()
	
	var input = text.lstrip(" ").rstrip(" ")
	var first_space: int = text.find(" ")
	var next_space: int = 0
	var command: String
	var arg: String
	
	if first_space == -1:
		command = input
	else:
		command = input.substr(0, first_space)
		arg = input.substr(first_space)
		arg = arg.lstrip(" ") 
		
	run_command(command, arg)

func run_command(command: String, arg: String):
	match command.to_lower():
		"hop":
			if arg == "p" or arg == "pill":
				if playerdata.pouch["hPills"] > 0:
					playerdata.hop(0)
			else:
				console_print("require argument: p, i, b")
					
	
func handle_scrollbar_changed():
	scrollbar.value = scrollbar.max_value

func console_print(str: String):
	display.text = display.text + "\n" + str
	print("console print: " + str)
