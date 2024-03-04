extends Control

@onready var pouch_display: Label = get_node("pouch_display")

func _process(_delta):
	pouch_display.text = "%0d\n%0d\n%0d" % [playerdata.pouch["pPills"], playerdata.pouch["bPills"], playerdata.pouch["hPills"]]
