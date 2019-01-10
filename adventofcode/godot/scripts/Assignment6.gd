extends Node

onready var inputData = get_parent().get_node("Inputdata")
onready var statusLabel = get_parent().get_node("StatusLabel")
onready var resultLabelOne = get_parent().get_node("ResultLabelPartOne")
onready var resultLabelTwo = get_parent().get_node("ResultLabelPartTwo")

var solved = false;

func _ready():
	part_1();
	pass

func _process(delta):
	if(!solved):
		
		pass


func part_1():
	var maxSizeX = 0;
	var maxSizeY = 0;
	var inputLinesX = [];
	var inputLinesY = [];
	var finiteIndex = [];
	for i in range(inputData.get_line_count()):
		var input = inputData.get_line(i);
		var inputSplitted = input.split(", ");
		var x = int(inputSplitted[0]);
		var y = int(inputSplitted[1]);
		inputLinesX.append(x);
		inputLinesY.append(y);
		finiteIndex.append(i+1);
		if(maxSizeX <= x):
			maxSizeX = x+1;
		if(maxSizeY <= y):
			maxSizeY = y+1;
	var array = [];
	print("maxsize: "+str(maxSizeX)+" , "+str(maxSizeY));
	for i in range(maxSizeX):
		array.append([]);
		for j in range(maxSizeY):
			array[i].append(0);
	for i in range(inputData.get_line_count()):
		var input = inputData.get_line(i);
		var inputSplitted = input.split(", ");
		var x = int(inputSplitted[0]);
		var y = int(inputSplitted[1]);
		array[x][y] = i+1;
	for i in range(array.size()):
		for j in range(array[i].size()):
			var closestIndex = -1;
			var closestLength = 9000000;
			var same = false;
			for k in range(inputLinesX.size()):
				var lengthToPoint = abs(inputLinesX[k] - i) + abs(inputLinesY[k] - j);
				if lengthToPoint < closestLength:
					closestLength = lengthToPoint;
					closestIndex = k+1;
					same = false;
				elif lengthToPoint == closestLength:
					same = true;
			if(!same):
				array[i][j] = closestIndex;
			else:
				array[i][j] = 0;
	
	for i in range(array.size()):
		var closestIndex = -1;
		var closestLength = 9000000;
		var tempArray = []
		for k in range(inputLinesX.size()):
			var lengthToPoint = abs(inputLinesX[k] - i) + abs(inputLinesY[k] + -1);
			if lengthToPoint < closestLength:
				closestLength = lengthToPoint;
				closestIndex = k+1;
				tempArray = [];
				tempArray.append(k+1);
			elif lengthToPoint == closestLength:
				tempArray.append(k+1);
		if(tempArray.size() == 1):
			if tempArray[0] in finiteIndex:
				var index = finiteIndex.find(tempArray[0]);
				if(index != -1):
					finiteIndex.remove(index);
		print("closing for 1: " + str(i) + ",-1"+":"+str(tempArray));
		closestIndex = -1;
		closestLength = 9000000;
		tempArray = []
		for k in range(inputLinesX.size()):
			var lengthToPoint = abs(inputLinesX[k] - i) + abs(inputLinesY[k] - array[0].size());
			if lengthToPoint < closestLength:
				closestLength = lengthToPoint;
				closestIndex = k+1;
				tempArray = [];
				tempArray.append(k+1);
			elif lengthToPoint == closestLength:
				tempArray.append(k+1);
		if(tempArray.size() == 1):
			if tempArray[0] in finiteIndex:
				var index = finiteIndex.find(tempArray[0]);
				if(index != -1):
					finiteIndex.remove(index);
		print("closing for 2: " + str(i) + ",size()"+":"+str(tempArray));
	for i in range(array[0].size()):
		var closestIndex = -1;
		var closestLength = 9000000;
		var tempArray = []
		for k in range(inputLinesX.size()):
			var lengthToPoint = abs(inputLinesX[k] + -1) + abs(inputLinesY[k] - i);
			if lengthToPoint < closestLength:
				closestLength = lengthToPoint;
				closestIndex = k+1;
				tempArray = [];
				tempArray.append(k+1);
			elif lengthToPoint == closestLength:
				tempArray.append(k+1);
		if(tempArray.size() == 1):
			if tempArray[0] in finiteIndex:
				var index = finiteIndex.find(tempArray[0]);
				if(index != -1):
					finiteIndex.remove(index);
		print("closing for 3: -1," + str(i)+":"+str(tempArray));
		closestIndex = -1;
		closestLength = 9000000;
		tempArray = []
		for k in range(inputLinesX.size()):
			var lengthToPoint = abs(inputLinesX[k] - array.size()) + abs(inputLinesY[k] - i);
			if lengthToPoint < closestLength:
				closestLength = lengthToPoint;
				closestIndex = k+1;
				tempArray = [];
				tempArray.append(k+1);
			elif lengthToPoint == closestLength:
				tempArray.append(k+1);
		if(tempArray.size() == 1):
			if tempArray[0] in finiteIndex:
				var index = finiteIndex.find(tempArray[0]);
				if(index != -1):
					finiteIndex.remove(index);
		print("closing for 4: size()," + str(i) +":"+str(tempArray));
	var maxVar = 0;
	var index = 0;
	print(finiteIndex);
	for i in range(finiteIndex.size()):
		print("fin: "+str(finiteIndex[i]));
		var tempVar = 0;
		for j in range(array.size()):
			for k in range(array[j].size()):
				if(array[j][k] == (finiteIndex[i])):
					tempVar += 1;
		if(tempVar > maxVar):
			maxVar = tempVar;
			index = finiteIndex[i];
	for i in range(array[0].size()):
		var toPrint = "";
		for j in range(array.size()):
			toPrint += str(array[j][i]);
		print(toPrint);
	resultLabelOne.text = "index: "+str(index)+" : "+str(maxVar);
	
	
	
	
	