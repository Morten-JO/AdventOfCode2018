extends Node

onready var solveButton = get_node("SolveButton")
onready var assignmentSelect = get_node("AssignmentSelect")
onready var inputData = get_node("Inputdata")
onready var statusLabel = get_node("StatusLabel")
onready var resultLabelOne = get_node("ResultLabelPartOne")
onready var resultLabelTwo = get_node("ResultLabelPartTwo")

func _ready():
	solveButton.connect("pressed", self, "solveButtonPressed")
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func solveButtonPressed():
	if(assignmentSelect.value > 0 && assignmentSelect.value < 26):
		for i in range(24):
			if(self.has_node("Assignment"+str(i+1))):
				self.remove_child("Assignment"+str(i+1));
		var selected = assignmentSelect.value;
		var toLoad = "res://nodes/Assignment"+str(selected)+".tscn";
		print("load: "+toLoad)
		var res = load(toLoad);
		if(res != null):
			var nodeLoad = res.instance()
			self.add_child(nodeLoad);