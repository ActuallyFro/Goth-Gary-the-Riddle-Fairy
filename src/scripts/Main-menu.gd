extends Node

# global variable for muteTogle
var isMuted = false

# Array for scenes
var GameStages = ["MainMenu", "Game", "GameOver", "PauseMenu"]
var currentStage = GameStages[0]

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

	if event.is_action_pressed("quit"):
		# Quit if at main menu
		if currentStage == "MainMenu":
			get_tree().quit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
