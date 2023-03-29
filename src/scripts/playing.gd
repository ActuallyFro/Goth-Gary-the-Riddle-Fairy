extends Node

#var file_data = {
#	"tutorial" : {
#		"name": "..."
#	}    
#}

var file_data
var current_question
var current_answer
var current_index = 0

#func saveJSON():
#	var file = FileAccess.open("res://resources/answers/Chapter1.csv", FileAccess.WRITE)
#	var json = JSON.new()
#	var json_string = json.stringify(file_data, "  ") 
#	file.store_line(json_string)

func loadJSON():
	if not FileAccess.file_exists("res://resources/answers/Chapter1.csv"):
#		saveJSON()
		return
	var file = FileAccess.open("res://resources/answers/Chapter1.csv", FileAccess.READ)

	if file.get_error() != OK:
		print("[ERROR] for loadJSON(): " + str(file.get_error()))
		return
	else:
		print("[DEBUG] File opened successfully")
#
	file_data = JSON.parse_string(file.get_as_text())

func _ready():
	loadJSON()

#	print("[DEBUG] Total objects in file_data: " + str(file_data.size()))
	var count=0
	for i in file_data:
		if count == current_index:
			for j in file_data[i]:
				if j == "question":
					current_question = str(file_data[i][j])
				if j == "answer":
					current_answer = str(file_data[i][j])
			break
		count += 1
#	print("[DEBUG] current_question " + current_question)
#	print("[DEBUG] current_answer " + current_answer)

	$RiddleArea/Question.text = current_question
	$RiddleArea/Input.grab_focus()



func _input(event):
	if event.is_action_pressed("enter"):
		var userInput = $RiddleArea/Input.text
		userInput = userInput.replace("\n", "")
		if userInput == current_answer:
			$RiddleArea/Answer.text = current_answer
		else:
			$RiddleArea/Answer.text = "Try Again..."
#		$RiddleArea/Input.text = $RiddleArea/Input.text.replace("\n", "")
#		$RiddleArea/Input.text = $RiddleArea/Input.text.replace("\r", "")
#		$RiddleArea/Answer.text = $RiddleArea/Answer.text = " "
		

	if event.is_action_pressed("quit"):
		get_tree().change_scene_to_file("res://src/scenes/main_nenu.tscn")

#func process(delta):
#	pass
