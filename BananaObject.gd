extends Area2D
# Called when the node enters the scene tree for the first time.


func _ready():
	set_process_input(true)

#When pressed...
func _on_Banana_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			#Compare to object array
			if (get_node("/root/MainScript").objectarray.empty()):
				pass
			else:
				if self != get_node("/root/MainScript").objectarray[0]:
					pass
				else:
					#call press
					press()
	if event is InputEventScreenTouch:
		if event.is_pressed():
			#Compare to object array
			if self != get_node("/root/MainScript").objectarray[0]:
				pass
			else:
				#call press
				press()

#removes from object array, frees object
func press():
	if (get_node("/root/MainScript").objectarray.empty()):
		pass
	else:
		get_node("/root/MainScript").objectarray.remove(0)
		
	queue_free()
	get_node("/root/MainScript/BananaStats").Amount_Bananas_Clicked += 1

func _process(delta):
	
	#If the player misses a banana and it goes off screen
	if (self.position.y > 1380):
		#remove from array, delete
		get_node("/root/MainScript").objectarray.remove(0)
		queue_free()
		#Increase heat, send signal that heat changed
		get_node("/root/MainScript").amtHeat += 5
		get_node("/root/MainScript").emit_signal("heatChanged")

	self.position = self.position.move_toward(Vector2(self.position.x, 1385), delta * get_node("/root/MainScript").speed)



