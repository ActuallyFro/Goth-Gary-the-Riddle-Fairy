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

var is_waiting_to_continue = false

#func saveJSON():
#	var file = FileAccess.open("res://resources/answers/Chapter1.csv", FileAccess.WRITE)
#	var json = JSON.new()
#	var json_string = json.stringify(file_data, "  ") 
#	file.store_line(json_string)

func loadNextQuestion():
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
	$RiddleArea/Question.text = current_question
	$RiddleArea/Answer.text = ""
	
	print("[DEBUG] current_question " + current_question)
	print("[DEBUG] current_answer " + current_answer)

	$RiddleArea/Input.grab_focus()
	

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
	loadNextQuestion()


func _input(event):
	if event.is_action_pressed("enter"):
		if is_waiting_to_continue:
			is_waiting_to_continue = false
			current_index += 1
			loadNextQuestion()

		else:
			var userInput = $RiddleArea/Input.text
			# userInput = userInput.replace("\n", "")

			if userInput.to_lower() == current_answer.to_lower():
				$RiddleArea/Answer.text = current_answer
				is_waiting_to_continue = true
			else:
				$RiddleArea/Answer.text = "Try Again..."

			userInput = ""
#		$RiddleArea/Input.text = $RiddleArea/Input.text.replace("\n", "")
#		$RiddleArea/Input.text = $RiddleArea/Input.text.replace("\r", "")
#		$RiddleArea/Answer.text = $RiddleArea/Answer.text = " "
		

	if event.is_action_pressed("quit"):
		get_tree().change_scene_to_file("res://src/scenes/main_nenu.tscn")

#func process(delta):
#	pass
