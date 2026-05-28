extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AutoLoad.updateGrid.connect(load_grid)
func load_grid() -> void:
	for i in range(AutoLoad.grid.size()):
		for j in range(AutoLoad.grid[i].size()):
			if(not type_string(typeof(AutoLoad.grid[i][j])) == "bool"):
				var sprite = Sprite2D.new()
				var image = preload("res://resizedgrid.png")
				sprite.texture = image
				sprite.centered = false
				sprite.global_position = Vector2(j*image.get_width(),i*image.get_height())
				add_child(sprite)
func subIndex(array:Array,index:int,upTo:int = -1) -> Array:
	var toReturn = []
	for i in range(array.size()):
		toReturn.append(array[i][index])
		if(upTo>-1):
			if(i >= upTo):
				break
	return toReturn
func moveOneElement(array:Array,og:Array,offset:Array) -> Array:
	var newArray = array.duplicate_deep()
	var toCopy = array[og[1]][og[0]]
	newArray[og[1] + offset[1]][og[0] + offset[0]] = toCopy
	return newArray
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for i in range(AutoLoad.grid.size()):
		for j in range(AutoLoad.grid[i].size()):
			var cTile = AutoLoad.grid[i][j]
			if(type_string(typeof(cTile)) == "bool"):
				if(cTile == false):
					print("d")
					for k in range(subIndex(AutoLoad.grid, j, i-1).size(),0,-1):
						var ref = AutoLoad.grid[i - k][j]
						if(type_string(typeof(ref)) == "bool"):
							if(ref):
								break
							else:
								pass
						ref.move()
						AutoLoad.grid = moveOneElement(AutoLoad.grid,[j,i - k],[0,-1])
						var toprint = []
						for p in range(AutoLoad.grid.size()):
							toprint.append([])
							for x in range(AutoLoad.grid[p].size()):
								var refrence = AutoLoad.grid[p][x]
								if(type_string(typeof(refrence)) == "Object"):
									toprint[p].append(refrence.name())
								else:
									#toprint[p].append(type_string(typeof(refrence)))
									toprint[p].append(refrence)
						print(toprint)
