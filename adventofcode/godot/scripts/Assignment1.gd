extends Node

onready var inputData = get_parent().get_node("Inputdata")
onready var statusLabel = get_parent().get_node("StatusLabel")
onready var resultLabelOne = get_parent().get_node("ResultLabelPartOne")
onready var resultLabelTwo = get_parent().get_node("ResultLabelPartTwo")

var solved = false;
var part_two_sum = 0;
var part_two_sums = [];
var iterations = 0;

func _ready():
	part_1();

func _process(delta):
	if(!solved):
		iterations += 1;
		part_2();
		

func part_1():
	var sum = 0;
	for i in range(inputData.get_line_count()):
		sum += int(inputData.get_line(i));
	resultLabelOne.text = str(sum);
	pass

func part_2():
	for i in range(inputData.get_line_count()):
		part_two_sum += int(inputData.get_line(i));
		if(part_two_sums.has(part_two_sum)):
			resultLabelTwo.text = str(part_two_sum);
			solved = true;
			statusLabel.text = "Finished assignment 1, Iteration: "+str(iterations);
			return;
		part_two_sums.append(part_two_sum);
		statusLabel.text = "Running assignment 1, Iteration: "+str(iterations);