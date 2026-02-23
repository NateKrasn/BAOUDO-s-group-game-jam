extends CharacterBody2D



func _process(delta: float) -> void:
	if velocity.x > 0:
		$AnimatedSprite2D.play("right")
	if velocity.x < 0:
		$AnimatedSprite2D.play("left")
