extends Node

onready var inputData = get_parent().get_node("Inputdata")
onready var statusLabel = get_parent().get_node("StatusLabel")
onready var resultLabelOne = get_parent().get_node("ResultLabelPartOne")
onready var resultLabelTwo = get_parent().get_node("ResultLabelPartTwo")

var solved = false;
var array = [];

func _ready():
	for i in range(1000):
		array.append([]);
		for j in range(1000):
			array[i].append(0);
	part_1();
	part_2();

func _process(delta):
	if(!solved):
		
		pass

func part_2():
	for i in range(inputData.get_line_count()):
		var splittedString = inputData.get_line(i).split(" ");
		var x = int(splittedString[2].split(",")[0]);
		var y = int(splittedString[2].split(",")[1].replace(":", ""));
		var dimensions = splittedString[3].split("x");
		var dimX = int(dimensions[0]);
		var dimY = int(dimensions[1]);
		var singled = true;
		for j in range(x, x+dimX):
			for k in range(y, y+dimY):
				if(array[j][k] != 1):
					singled = false;
					j = x+dimX;
					k = y+dimY;
		if(singled):
			resultLabelTwo.text = splittedString[0];
			return;
	

func part_1():
	var overlaps = 0;
	for i in range(inputData.get_line_count()):
		var splittedString = inputData.get_line(i).split(" ");
		var x = int(splittedString[2].split(",")[0]);
		var y = int(splittedString[2].split(",")[1].replace(":", ""));
		var dimensions = splittedString[3].split("x");
		var dimX = int(dimensions[0]);
		var dimY = int(dimensions[1]);
		for j in range(x, x+dimX):
			for k in range(y, y+dimY):
					array[j][k] += 1;
	
	var count = 0;
	for i in range(array.size()):
		for j in range(array.size()):
			if(array[i][j] > 1):
				count += 1;
	resultLabelOne.text = str(count);