extends Sprite2D
var tileName = "no"
func name() -> String:
	return tileName

func _ready() -> void:
	pass

func move():
	#global_position += preload("res://resizedgrid.png").get_size()
	global_position.y += preload("res://resizedgrid.png").get_height()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
