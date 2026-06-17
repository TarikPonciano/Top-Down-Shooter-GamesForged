extends Timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var wait_time_calculado = wait_time - (0.05 * (Global.round-1))
	
	if wait_time_calculado >= 0.2:
		wait_time = wait_time_calculado
	else:
		wait_time = 0.2
