extends Node2D

@onready var grid: Grid = $Grid
@onready var player_prefab: PackedScene = preload("res://Scenes/player.tscn")
@onready var asteroid_prefab: PackedScene = preload("res://Scenes/asteroid.tscn")
@export var player: Player
@export var asteroid_count: int = 5
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_asteroids()
	spawn_player()
	
func spawn_player():
	player = player_prefab.instantiate()
	grid.set_unit_at_grid_position(player, Vector2(grid.grid_width / 2, grid.grid_height -1))
	EventBus.On_Skip_Turn.connect(end_turn)
	
func spawn_asteroids():
	var avalable_rows = {}
	var avalable_columns = {}
	for i in grid.grid_height - 1:
		avalable_rows[i] = true
	for i in grid.grid_width:
		avalable_columns[i] = true
		
	for i in asteroid_count:
		var x = avalable_columns.keys().pick_random()
		avalable_columns.erase(x)
		var y = avalable_rows.keys().pick_random()
		avalable_rows.erase(y)
		var position = Vector2(x,y)
		var asteroid = asteroid_prefab.instantiate() as Asteroid
		asteroid.set_velicity(Constants.caridanl_directions.pick_random())
		grid.set_unit_at_grid_position(asteroid, position)
	
func end_turn():
	grid.update_unit_positions()
