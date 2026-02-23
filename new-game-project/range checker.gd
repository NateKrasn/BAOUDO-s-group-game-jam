extends CollisionShape2D



func _process(delta: float) -> void:
	if GlobalSignals.showing_ranges:
		$Sprite2D.visible = true
	if not GlobalSignals.showing_ranges:
		$Sprite2D.visible = false
