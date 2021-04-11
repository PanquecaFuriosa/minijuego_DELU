extends TextureRect

onready var label = $"VBoxContainer/Label"
onready var GUI_Menu = get_parent().get_node("GUI/VBoxContainer/MarginContainer2/Menu")
onready var act_panel = get_parent().get_node("GUI/VBoxContainer/MarginContainer2/Menu/ActPanel")
onready var animation_player = $"VBoxContainer/Label/AnimationPlayer"

var rng = RandomNumberGenerator.new()
var speech_dialogs = {} # = {
#	"neutral": ["dilogo1", "dialogo2", "dialogo3"]
#}

var letters_animation = Animation.new()
var track_index = letters_animation.add_track(Animation.TYPE_VALUE)


func _ready():
	rng.randomize()
	visible = false
	GUI_Menu.connect("player_turn_ended", self, "_on_Enemy_Turn")
	#set_speech_dialogs("neutral", ["Squorch...", "Burble burb...", "*Slime sounds*", "*Sexy wiggle*"])



	
func change_speech(new_text):
	label.bbcode_text = "[wave amp=26 freq=10][shake rate=15 level=11]" + new_text 
	
	

func set_speech_dialogs(state, dialogs):
	speech_dialogs[state] = dialogs

func _on_Enemy_Turn():
	visible = true
	var current_state = act_panel.current_state
	if speech_dialogs.has(current_state):
		change_speech(speech_dialogs[current_state][rng.randi_range(0, len(speech_dialogs[current_state]) - 1)])
	animation_player.play("typing_letters2")
	yield(get_tree().create_timer(3), "timeout")
	visible = false

