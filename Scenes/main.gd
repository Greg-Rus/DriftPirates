extends Node2D

@onready var grid: Grid = $Grid
@onready var player_prefab: PackedScene = preload("res://Scenes/player.tscn")
@export var player: Player
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = player_prefab.instantiate()
	grid.set_unit_at_grid_position(player, Vector2(0,0))
	EventBus.On_Skip_Turn.connect(end_turn)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func end_turn():
	grid.update_unit_positions()
