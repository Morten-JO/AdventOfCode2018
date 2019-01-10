extends Node

onready var inputData = get_parent().get_node("Inputdata")
onready var statusLabel = get_parent().get_node("StatusLabel")
onready var resultLabelOne = get_parent().get_node("ResultLabelPartOne")
onready var resultLabelTwo = get_parent().get_node("ResultLabelPartTwo")

var solved = false;
var input;
var alphabetArray = "abcdefghijklmnopqrstuvwxyz";
var shortestLetter = "";
var shortestLetterLength = 10000000;
var currentIndex = 0;

func _ready():
	part_1();
	part_2();
	pass

func _process(delta):
	if(!solved):
		var letter = str(alphabetArray[currentIndex]);
		var newInput = input.replace(letter, "").replace(letter.to_upper(), "");
		var index = 0;
		while(index < newInput.length()-1):
			if(index >= 0):
				var charFirst = str(newInput[index]);
				var charLast = str(newInput[index+1]);
				if(charLast != charFirst):
					if(charFirst.to_upper() == charLast or charFirst.to_lower() == charLast):
						newInput.erase(index, 2);
						index -= 3;
			index += 1;
		if(newInput.length() < shortestLetterLength):
			shortestLetterLength = newInput.length();
			shortestLetter = letter;
		statusLabel.text = "Currently solving with letter: "+str(letter);
		currentIndex += 1;
		if(currentIndex == alphabetArray.length()):
			solved = true;
			resultLabelTwo.text = "Letter: "+str(shortestLetter)+" - "+str(shortestLetterLength);
		pass


func part_1():
	var input = inputData.get_line(0);
	var before = input.length();
	var index = 0;
	while(index < input.length()-1):
		if(index >= 0):
			var charFirst = str(input[index]);
			var charLast = str(input[index+1]);
			if(charLast != charFirst):
				if(charFirst.to_upper() == charLast or charFirst.to_lower() == charLast):
					input.erase(index, 2);
					index -= 3;
		index += 1;
	var after = input.length();
	resultLabelOne.text = str(before)+" -> "+str(after);

func part_2():
	input = inputData.get_line(0);
	