extends HBoxContainer

onready var label : Label = $"Label"
export(String) var label_text :String = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = label_text
