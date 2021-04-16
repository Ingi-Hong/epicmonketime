extends Node

#preload banana object
var BananaObject = preload("BananaObject.tscn")

#initial speed
var speed = 500

#the timer child node
var _timer = null

#how often bananas spawn
var timerTime = 0.69

#holds all objects
var objectarray = []

#Heat threshold, how much heat the meter can take
var heatThreshold = 100

#Current heat
var amtHeat = 0

#heat decay, amount heat decays per second, represented by a number not a percentage
var heat_decay = heatThreshold*0.001


# Called when the node enters the scene tree for the first time.
func _ready():
	
	print(self.get_path()) 
	set_process(true)
	randomize()
	
	_timer = Timer.new()
	add_child(_timer)

	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(timerTime)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()
	

#Instantiates a banana on random column, adds it to 
func SpawnRow():
	#first, pick random column to spawn banana on 
	var screenSize = get_tree().get_root().get_visible_rect().size
	var options = [screenSize.x/10, screenSize.x/2, screenSize.x/1.2]
	var rand_value = options[randi() % options.size()]
	#Put our vector into position variable 
	var position = Vector2(rand_value, -92)
	
	#Instance our banana at our position 
	var obj = BananaObject.instance()
	obj.position = position
	add_child(obj)
	objectarray.append(obj)

#when timeout times out spawn row 
func _on_Timer_timeout():
	SpawnRow()
	
signal heatChanged

