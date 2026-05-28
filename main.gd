extends Node
func _ready() -> void:
	var tempGrid = [[0,0,0,0],[0,false,0,0],[0,false,0,false]]
	AutoLoad.grid = tempGrid
	for i in range(tempGrid.size()):
		for j in range(tempGrid[i].size()):
			if(type_string(typeof(tempGrid[i][j])) == "int"):
				var tempTile = preload("res://tile.tscn").instantiate()
				tempTile.global_position.x += preload("res://resizedgrid.png").get_width()*j
				tempTile.global_position.y += preload("res://resizedgrid.png").get_height()*i
				add_child(tempTile)
				AutoLoad.grid[i][j] = tempTile
				
			
	AutoLoad.updateGrid.emit()
func _process(delta: float) -> void:
	pass
