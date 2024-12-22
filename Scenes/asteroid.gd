class_name Asteroid
extends Unit

@export var sprites : Array[Sprite2D] = []

static var asteorid_count : int = 0

func _ready():
	asteorid_count += 1
	var sprite_index = asteorid_count % sprites.size()
	for i in sprites.size():
		sprites[i].set_process(i == sprite_index)
		sprites[i].visible = i == sprite_index
