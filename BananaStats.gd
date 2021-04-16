extends Node

#Keeps track of all stats
var Amount_Bananas_Clicked = 0
var Time_Elapsed = 0

#Threshold for speeding up bananas
var banana_threshold = 4

#Multiplyers 
var banana_thresholdMultiplyer = 1.3 #How much the threshold goes up
var speedMultiplyer = 1.05 #How much the game speeds up each threshold 
var timerMultiplyer = 0.6 #How much the timer guys down each threshold 

# Called when the node enters the scene tree for the first time.
func _ready(): 
	print(self.get_path()) 
	pass # Replace with function body.

func _process(_delta):
	check_bananas()
	pass

func check_bananas():
	if Amount_Bananas_Clicked > banana_threshold:
		get_node("/root/MainScript").speed *= speedMultiplyer 
		banana_threshold *= banana_thresholdMultiplyer
		get_node("/root/MainScript")._timer.set_wait_time(get_node("/root/MainScript").timerTime * timerMultiplyer)

func _on_Timer_timeout():
	Time_Elapsed += 1
