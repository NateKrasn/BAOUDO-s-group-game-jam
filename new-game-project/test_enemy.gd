extends PathFollow2D
class_name test_enemy
signal minus_health

var speed = 70
@onready var anim = $AnimatedSprite2D 

func _physics_process(delta: float) -> void:
	var prev_pos = position
	progress += speed * delta
	var dir = (position - prev_pos).normalized()
	update_animation(dir)

func update_animation(dir: Vector2) -> void:
	if abs(dir.x) > abs(dir.y):
		if dir.x > 0:
			anim.play("right")
			anim.flip_h = false
		else:
			anim.play("right")
			anim.flip_h = true
	else:
		if dir.y > 0:
			anim.play("down")
		else:
			anim.play("up")

func _process(delta: float) -> void:
	if progress_ratio >= 1:
		GlobalSignals.emit_signal("bunker_take_damage")
		self.queue_free()
