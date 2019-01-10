extends Node

onready var inputData = get_parent().get_node("Inputdata")
onready var statusLabel = get_parent().get_node("StatusLabel")
onready var resultLabelOne = get_parent().get_node("ResultLabelPartOne")
onready var resultLabelTwo = get_parent().get_node("ResultLabelPartTwo")

var solved = false;
var dictoriSleeps = {};
var dictoriMinutes = {};

func _ready():
	part_1();
	part_2();
	pass

func _process(delta):
	if(!solved):
		
		pass


func part_1():
	var sortedArray = [];
	for i in range(inputData.get_line_count()):
		var inputLine = inputData.get_line(i);
		sortedArray.append(inputLine);
	sortedArray.sort();
	var currentGuard = "";
	var minuteSleep = 0;
	var tested = false;
	for i in range(sortedArray.size()):
		var splittedString = sortedArray[i].split(" ");
		if(splittedString.size() > 5):
			currentGuard = splittedString[3];
			if not splittedString[3] in dictoriSleeps:
				dictoriSleeps[currentGuard] = 0;
				dictoriMinutes[currentGuard] = [];
				for j in range(60):
					dictoriMinutes[currentGuard].append(0);	
		else:
			if(splittedString[2] == "falls" and splittedString[3] == "asleep"):
				minuteSleep = int(splittedString[1].split(":")[1].replace("]", ""));
			else:
				var minuteAwake = int(splittedString[1].split(":")[1].replace("]", ""));
				var minSleep = 0;
				minSleep = minuteAwake - minuteSleep;
				for j in range(minuteSleep, minuteAwake):
					dictoriMinutes[currentGuard][j] += 1;
				dictoriSleeps[currentGuard] = dictoriSleeps[currentGuard] + minSleep;
	var maxMinutesSleep = 0;
	var guardId = 0;
	for i in range(dictoriSleeps.size()):
		var value = dictoriSleeps[dictoriSleeps.keys()[i]];
		if(value > maxMinutesSleep):
			maxMinutesSleep = value;
			guardId = dictoriSleeps.keys()[i];
	var minuteSleptMost = 0;
	var mostSleep = 0;
	for i in range(60):
		if(dictoriMinutes[guardId][i] > mostSleep):
			minuteSleptMost = i;
			mostSleep = dictoriMinutes[guardId][i];
	var idInInt = int(guardId.replace("#", ""));
	resultLabelOne.text = str(idInInt)  + " x " + str(minuteSleptMost) + " = " + str(idInInt * (minuteSleptMost));
	
func part_2():
	var minuteMax = 0;
	var minuteMaxIndex = 0;
	var guardId = "";
	for i in range(dictoriSleeps.size()):
		var tempGuardId = dictoriSleeps.keys()[i];
		var guardMaxNumbers = 0;
		var guardMaxIndex = 0;
		for j in range(60):
			if(dictoriMinutes[tempGuardId][j] > guardMaxNumbers):
				guardMaxNumbers = dictoriMinutes[tempGuardId][j];
				guardMaxIndex = j;
		if(guardMaxNumbers > minuteMax):
			guardId = tempGuardId;
			minuteMax = guardMaxNumbers;
			minuteMaxIndex = guardMaxIndex;
	var idInInt = int(guardId.replace("#", ""));
	resultLabelTwo.text = str(idInInt) + " x " + str(minuteMaxIndex) + " = " + str(idInInt * minuteMaxIndex);
	pass;