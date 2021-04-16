extends MarginContainer
onready var bar = $HBoxContainer/Bars/Bar/Gauge
onready var tween = $Tween

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var heat = get_node("/root/MainScript").heatThreshold
	bar.max_value = heat
	
	bar.value = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_MainScript_heatChanged():
	update_heat(get_node("/root/MainScript").amtHeat)

func update_heat(new_value):
	bar.value = max(new_value, 0) 

func decay(_delta):
	pass
	
