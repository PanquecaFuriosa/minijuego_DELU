extends "res://Menu.gd"


func _ready():
	._ready()
	add_option("Moldsmal.", "fight", null)
	add_option("doctor pepper", "item", null)
	add_option("the souls of the damned", "item", null)
	add_option("un peluche", "item", null)
	add_option("Moldsmal.", "selection", null)
	add_option_page(
		["Check", "Imitate", "Flirt"] , ["Life is difficult for this enemy. Stereotypical: Curvaceously attractive, but no brains...", """* You lie immobile with Moldsmal.
		* You feel like you understand the world a little better.""" , """* You wiggle your hips.
		* Moldsmal wiggles back.
		* What a meaningful conversation!"""], "act"
	)
