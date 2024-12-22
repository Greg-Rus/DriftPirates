extends Control

func _on_rotate_clockwise_button_down() -> void:
	EventBus.On_Turn_Clockwise.emit()

func _on_rotate_counter_clockwise_button_down() -> void:
	EventBus.On_Turn_Counter_Clockwise.emit()

func _on_skip_turn_button_down() -> void:
	EventBus.On_Skip_Turn.emit()

func _on_engine_button_down() -> void:
	EventBus.On_Thruster.emit()

func _on_fire_left_button_down() -> void:
	EventBus.On_Fire_Left.emit()

func _on_fire_right_button_down() -> void:
	EventBus.On_Fire_Right.emit()
