class_name Player
extends Unit

@onready var unit: Unit = $Unit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventBus.On_Turn_Clockwise.connect(turn_clockwise)
	EventBus.On_Turn_Counter_Clockwise.connect(turn_counter_clockwise)
	EventBus.On_Thruster.connect(set_thruster_velocity)
	EventBus.On_Fire_Right.connect(fire_right)
	EventBus.On_Fire_Left.connect(fire_left)

func set_thruster_velocity():
	velocity = heading

func turn_clockwise():
	update_rotation(90)
	
func turn_counter_clockwise():
	update_rotation(-90)

func fire_right():
	velocity = heading.rotated(deg_to_rad(-90))
	
func fire_left():
	velocity = heading.rotated(deg_to_rad(90))
