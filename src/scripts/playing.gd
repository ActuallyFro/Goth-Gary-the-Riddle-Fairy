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
#	# print file status
#	if file.get_error() != OK:
#		print("Error: " + str(file.get_error()))
#		return
#	else:
#		print("File opened successfully")
#
	file_data = JSON.parse_string(file.get_as_text())
#	# print file_data
	# print(data)
	# Print total objects in file_data
	print("[DEBUG] Total objects in file_data: " + str(file_data.size()))
	# iterate over all objects in file_data
	for i in file_data:
		print("[DEBUG] Object " + str(i) + ": " + str(file_data[i]))
#		current_question=str(file_data[0].question)
#		current_answer=str(file_data[0].answer)
#		print("[DEBUG] Current question: " + current_question)
#		print("[DEBUG] Current answer: " + current_answer)

#	file_data = data

func _ready():
	loadJSON()

	#	if file_data.tutorial.has("name"):
	# print(file_data)

	$RiddleArea/Input.grab_focus()

	# var Chpt1_QandA = GetChapter1QandA()
#	var file = FileAccess.open("res://resources/answers/Chapter1.csv", FileAccess.READ)



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
