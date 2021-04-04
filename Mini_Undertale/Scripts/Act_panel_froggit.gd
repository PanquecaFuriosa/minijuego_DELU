extends "res://Escenas/GUI/ActPanel.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	._ready()
	enemy_name = "Froggit"
	encounter_dialog = "Froggit hopped close!"
	
	set_neutral_state(["Froggit hops to and fro.", "You are intimidated by Froggit's raw strength.", "You are intimidated by Froggit's raw strength. Only kidding.", "Froggit doesn't seem to know why it's here.", "* The battlefield is filled with the smell of mustard seed."], ["current"], false)
	set_spare_state(["Froggit seems reluctant to fight you."], ["current"])
	set_new_state("Low HP.", ["Froggit is trying to run away."], ["current"], false)
	play_state(states.get("neutral")) 
	set_spare_requirement("Check", 1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
