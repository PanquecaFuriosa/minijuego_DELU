extends "res://Menu.gd"

func _ready():
	._ready()
	add_option("Doggo.", "fight", null)
	add_option("doctor pepper", "item", null)
	add_option("the souls of the damned", "item", null)
	add_option("un peluche", "item", null)
	add_option("Doggo.", "selection", null)
	add_option_page(
		["Check", "Pet"] , ["How can you resist petting the dog?", """* You pet Doggo."""], "act")
