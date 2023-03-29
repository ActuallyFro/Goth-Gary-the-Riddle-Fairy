extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$RiddleArea/Input.grab_focus()
	pass

func _input(event):
	if event.is_action_pressed("enter"):
		$RiddleArea/Input.text = $RiddleArea/Answer.text.replace("\n", "")
		$RiddleArea/Input.text = $RiddleArea/Answer.text.replace("\r", "")
#		$RiddleArea/Answer.text = $RiddleArea/Answer.text = " "
		$RiddleArea/Answer.text = "Darkness"

	if event.is_action_pressed("quit"):
		get_tree().change_scene_to_file("res://src/scenes/main_nenu.tscn")

#func process(delta):
#	pass
