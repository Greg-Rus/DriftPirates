class_name Unit
extends Node2D
@export var velocity: Vector2 = Vector2(0,0)
@export var heading: Vector2 = Vector2(1,0)
@export var max_hit_points: int = 1
@export var current_hit_points: int = 1
@export var max_action_points: int = 1
@export var current_action_points: int = 1
@export var grid_position: Vector2
@onready var sprite: Sprite2D = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_action_points = max_action_points
	current_hit_points = max_hit_points
	
func set_velicity(new_velocity: Vector2):
	velocity = new_velocity
	
func get_next_position():
	return grid_position + velocity
	
func update_rotation(rotation_increment: int):
	rotation_degrees = wrapi(rotation_degrees + rotation_increment, 0, 360)
	if(rotation_degrees == 360):
		rotation_degrees = 0
	heading = get_heading()

func get_heading():
	if(rotation_degrees == 0):
		return Vector2(1,0)
		
	if(rotation_degrees == 90):
		return Vector2(0,1)
		
	if(rotation_degrees == 180):
		return Vector2(-1,0)
		
	if(rotation_degrees == 270):
		return Vector2(0,-1)
