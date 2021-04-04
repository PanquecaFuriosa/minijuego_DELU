extends "res://Menu.gd"

func _ready():
	._ready()
	add_option("mushu", "fight", null)
	add_option("doctor pepper", "item", null)
	add_option("the souls of the damned", "item", null)
	add_option("un peluche", "item", null)
	add_option("Froggit.", "selection", null)
	add_option_page(
		["Check", "Compliment", "Threat"] , ["Life is difficult for this enemy.", "* Froggit didn't understand what you said, but was flattered anyway.", "* Froggit didn't understand what you said, but was scared anyway."], "act"
	)
