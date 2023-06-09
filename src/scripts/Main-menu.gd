extends Node

var isMuted = false
#var GameStages = ["MainMenu", "Game", "GameOver", "PauseMenu"]
var MainMenuOptions = ["Play", "Options", "Quit"]
var menuMenuChoice = 0

var isMenuChanged = false
var isPlaySelected = false
var isQuitSelected = false

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
		get_tree().quit()

	if event.is_action_pressed("arrow_up"):
		menuMenuChoice -= 1
		if menuMenuChoice < 0:
			menuMenuChoice = 2
		isMenuChanged = true
			
			
	if event.is_action_pressed("arrow_down"):
		menuMenuChoice += 1
		if menuMenuChoice > 2:
			menuMenuChoice = 0
		isMenuChanged = true

	if event.is_action_pressed("enter"):
		match menuMenuChoice:
			0:
				$SFX/Screech.play()
				isPlaySelected = true
			2:
				$SFX/Crow.play()
				isQuitSelected = true

	if isMenuChanged:
		$MenuOptions/VBoxContainer/Play.add_theme_color_override("font_color",Color(1,1,1))
		$MenuOptions/VBoxContainer/Options.add_theme_color_override("font_color",Color(1,1,1))
		$MenuOptions/VBoxContainer/Quit.add_theme_color_override("font_color",Color(1,1,1))
		$SFX/Crow1.play()

		match menuMenuChoice:
			0:
				$MenuOptions/VBoxContainer/Play.add_theme_color_override("font_color",Color(1,0,0))
			1:
				$MenuOptions/VBoxContainer/Options.add_theme_color_override("font_color",Color(1,0,0))
			2:
				$MenuOptions/VBoxContainer/Quit.add_theme_color_override("font_color",Color(1,0,0))
		isMenuChanged = false

func _process(_delta):
	if isPlaySelected:
		if !$SFX/Screech.is_playing():
			get_tree().change_scene_to_file("res://src/scenes/playing.tscn")
	if isQuitSelected:
		if !$SFX/Crow.is_playing():
			get_tree().quit()
	pass
