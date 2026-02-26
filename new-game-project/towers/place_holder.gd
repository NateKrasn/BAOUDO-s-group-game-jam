extends Sprite2D



func _process(delta: float) -> void:
	if GlobalSignals.selling:
		visible = true
	else:
		visible = false
