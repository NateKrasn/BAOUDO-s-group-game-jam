extends PathFollow2D
class_name test_enemy

var speed = 100

func _physics_process(delta: float) -> void:
	progress += speed * delta
