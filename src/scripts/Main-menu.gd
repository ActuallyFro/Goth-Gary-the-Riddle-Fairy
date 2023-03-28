extends Node

# global variable for muteTogle
var isMuted = false

# Array for scenes
var GameStages = ["MainMenu", "Game", "GameOver", "PauseMenu"]
var MainMenuOptions = ["Play", "Options", "Quit"]
var menuMenuChoice = 0

var currentStage = GameStages[0]
var isMenuChanged = false

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

	if event.is_action_pressed("arrow_down"):
		if currentStage == "MainMenu":
			menuMenuChoice -= 1
			if menuMenuChoice < 0:
				menuMenuChoice = 2
			isMenuChanged = true
			
	if event.is_action_pressed("arrow_up"):
		if currentStage == "MainMenu":
			menuMenuChoice += 1
			if menuMenuChoice > 2:
				menuMenuChoice = 0
			isMenuChanged = true

	if isMenuChanged:
		# if currentStage == "MainMenu":
			# set all label colors to white
			
			# $MenuOptions/VBoxContainer/Play.label_settings.them
			# $Main-menu/MenuOptions/VBoxContainer/Options.font_color = Color(1,1,1)
			# $Main-menu/MenuOptions/VBoxContainer/Quit.font_color = Color(1,1,1)
			
			# switch
			# match menuMenuChoice:
			# 	0:
			# 		$Main-menu/MenuOptions/VBoxContainer/Play.font_color = Color(1,0,0)
			# 	1:
			# 		$Main-menu/MenuOptions/VBoxContainer/Options.font_color = Color(1,0,0)
			# 	2:
			# 		$Main-menu/MenuOptions/VBoxContainer/Quit.font_color = Color(1,0,0)
				# else:			
		isMenuChanged = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
