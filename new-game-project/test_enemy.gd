extends PathFollow2D
class_name test_enemy

signal minus_health
var speed = 100

func _physics_process(delta: float) -> void:
	progress += speed * delta


func _process(delta: float) -> void:
	if progress_ratio >= 1:
		GlobalSignals.emit_signal("bunker_take_damage")
		self.queue_free()
