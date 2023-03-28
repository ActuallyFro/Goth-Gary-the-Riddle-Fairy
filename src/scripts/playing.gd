extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("enter"):
#		$RiddleArea/Answer.text = $RiddleArea/Answer.text.replace("\n", "")
#		$RiddleArea/Answer.text = $RiddleArea/Answer.text = " "
		$RiddleArea/Answer.text = "Darkness"

	if event.is_action_pressed("quit"):
		get_tree().change_scene_to_file("res://src/scenes/main_nenu.tscn")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
