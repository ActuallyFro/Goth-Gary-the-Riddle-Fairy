extends Node

# global variable for muteTogle
var isMuted = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(event):
	if event.is_action_pressed("mute"):
		if isMuted:
			AudioServer.set_bus_mute(0, false)
			isMuted = !isMuted
		else:
			AudioServer.set_bus_mute(0, true)
			isMuted = !isMuted

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
