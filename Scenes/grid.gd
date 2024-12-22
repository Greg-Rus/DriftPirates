class_name Grid
extends Node2D
@export var grid_width = 8
@export var grid_height = 8
@export var tile_size = 100
@export var tile_scale_factor = 0.5
@onready var tileSprite = preload("res://Scenes/grid_tile.tscn")

var grid = {}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
		
	spawn_grid_visuals()
	
func update_unit_positions():
	for value in grid.values():
		var unit = value as Unit
		var next_position = wrap_position(unit.get_next_position())
		move_unit(unit.grid_position, next_position)

func tile_size_scaled():
	return tile_size * tile_scale_factor

func spawn_grid_visuals():
	for x in grid_width:
		for y in grid_height:
			var tile_offset = Vector2(x,y)
			var tile_positoin = tile_offset * tile_size * tile_scale_factor
			var tile = tileSprite.instantiate() as Sprite2D
			tile.scale = Vector2(tile_scale_factor, tile_scale_factor)
			tile.position = tile_positoin
			add_child(tile)
	position = get_viewport_center() - Vector2(grid_width * tile_size * tile_scale_factor * 0.5,
	grid_height * tile_size * tile_scale_factor * 0.5)
	
func get_grid_to_local_position(grid_position: Vector2):
	return grid_position * tile_size_scaled()
	
func get_viewport_center() -> Vector2:
	var transform : Transform2D = get_viewport_transform()
	var scale : Vector2 = transform.get_scale()
	return -transform.origin / scale + get_viewport_rect().size / scale / 2
	
func move_unit(current_position: Vector2, next_position: Vector2):
	var unit = grid[current_position] as Unit
	grid.erase(current_position)
	grid[next_position] = unit
	unit.grid_position = next_position
	unit.position = get_grid_to_local_position(next_position)
	
func set_unit_at_grid_position(unit: Unit, grid_position: Vector2):
	grid[grid_position] = unit
	add_child(unit)
	unit.position = get_grid_to_local_position(grid_position)
	
func wrap_position(position: Vector2):
	if(position.x < 0):
		position.x = grid_width - 1
		
	if(position.x >= grid_width):
		position.x = 0
		
	if(position.y < 0):
		position.y = grid_height - 1
		
	if(position.y >= grid_height):
		position.y = 0
		
	return position
