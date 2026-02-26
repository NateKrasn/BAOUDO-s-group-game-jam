extends StaticBody2D

var range_decreased = false
var attacking_stopped = false

func _ready() -> void:
	$"attack area/CollisionShape2D".disabled = true
	$"attack area/CollisionShape2D/attack VFX".visible = false
	add_to_group("tower")
	get_parent().move_child(self, 3)

func _on_detection_area_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	pass

func _on_detection_area_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	pass

func _on_timer_timeout() -> void:
	$"attack area/CollisionShape2D".disabled = false
	$AnimatedSprite2D.play("attacking")
	$"attack area/CollisionShape2D/attack VFX".visible = true
	await get_tree().create_timer(1).timeout
	$"attack area/CollisionShape2D/attack VFX".visible = false
	$AnimatedSprite2D.play("idle")
	$"attack area/CollisionShape2D".disabled = true

func _process(delta: float) -> void:
	var heated = false
	for heat_tower in get_tree().get_nodes_in_group("heat_tower"):
		if global_position.distance_to(heat_tower.global_position) <= heat_tower.get_node("Area2D/CollisionShape2D").shape.radius:
			heated = true
			break

	var lit = false
	for light_tower in get_tree().get_nodes_in_group("light_tower"):
		if global_position.distance_to(light_tower.global_position) <= light_tower.get_node("Area2D/CollisionShape2D").shape.radius:
			lit = true
			break

	# FOG
	range_decreased = GlobalSignals.fog_on and not lit
	if range_decreased:
		$"attack area/CollisionShape2D".scale = Vector2(0.5, 0.5)
		$"detection area/CollisionShape2D".scale = Vector2(0.5, 0.5)
		$icons2.visible = true
		$icons2.play("both")
	else:
		$"attack area/CollisionShape2D".scale = Vector2(1, 1)
		$"detection area/CollisionShape2D".scale = Vector2(1, 1)
		$icons2.visible = false

	# SNOW STORM
	attacking_stopped = GlobalSignals.snow_on and not heated
	if attacking_stopped:
		$Timer.paused = true
		$icons.visible = true
		$icons.play("winter effect")
		$"frozen x-vfx".visible = true
	else:
		$"frozen x-vfx".visible = false
		$Timer.paused = false
		$icons.visible = false

func _on_attack_area_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.has_method("_take_damage"):
		body._take_damage(2)


func _on_button_pressed() -> void:
	GlobalSignals.currency += 85
	self.queue_free()
