extends Node

onready var inputData = get_parent().get_node("Inputdata")
onready var statusLabel = get_parent().get_node("StatusLabel")
onready var resultLabelOne = get_parent().get_node("ResultLabelPartOne")
onready var resultLabelTwo = get_parent().get_node("ResultLabelPartTwo")

var solved = false;

func _ready():
	part_1();
	part_2();

func _process(delta):
	if(!solved):
		
		pass
	

func part_1():
	var numbers_with_two = 0;
	var numbers_with_three = 0;
	for i in range(inputData.get_line_count()):
		var currentLine = inputData.get_line(i);
		var checkedCharacters = [];
		var twoChecked = false;
		var threeChecked = false;
		for j in range(currentLine.length()):
			if(!checkedCharacters.has(currentLine[j])):
				var count = 0;
				for k in range(currentLine.length()):
					if(currentLine[k] == currentLine[j]):
						count += 1;
				if(count == 2 and !twoChecked):
					numbers_with_two += 1;
					twoChecked = true;
				if(count == 3 and !threeChecked):
					numbers_with_three += 1;
					threeChecked = true;
				checkedCharacters.append(currentLine[j]);
			if(twoChecked and threeChecked):
				j = currentLine.length();
	resultLabelOne.text = str(numbers_with_two * numbers_with_three);
	pass

func part_2():
	for i in range(inputData.get_line_count()):
		for j in range(i, inputData.get_line_count()):
			var differenceInCharacter = 0;
			if(i != j):
				for k in range(inputData.get_line(i).length()):
					if(inputData.get_line(i)[k] != inputData.get_line(j)[k]):
						differenceInCharacter += 1;
					if(differenceInCharacter > 1):
						k = inputData.get_line(i).length();
			if(differenceInCharacter == 1):
				var resultString = "";
				for k in range(inputData.get_line(i).length()):
					if(inputData.get_line(i)[k] == inputData.get_line(j)[k]):
						resultString += inputData.get_line(i)[k];
				resultLabelTwo.text = resultString;
				return;
