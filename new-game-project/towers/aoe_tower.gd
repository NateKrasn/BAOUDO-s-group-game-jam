extends StaticBody2D



var range_decreased = false
var allowed_to_fog = true
var attacking_stopped = false
var allowed_to_freeze = true
var allowed_to_attack = true


func _ready() -> void:
	$"attack area/CollisionShape2D".disabled = true
	$"attack area/CollisionShape2D/attack VFX".visible = false
	add_to_group("tower")
	get_parent().move_child(self, 2)

func _on_detection_area_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	pass


func _on_detection_area_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	pass


func _on_timer_timeout() -> void:
	if allowed_to_attack:
		$"attack area/CollisionShape2D".disabled = false
		$AnimatedSprite2D.play("attacking")
		$"attack area/CollisionShape2D/attack VFX".visible = true
		await get_tree().create_timer(1).timeout
		$"attack area/CollisionShape2D/attack VFX".visible = false
		$AnimatedSprite2D.play("idle")
		$"attack area/CollisionShape2D".disabled = true



func _process(delta: float) -> void:
	#FOG
	if GlobalSignals.fog_on and allowed_to_fog:
		range_decreased = true
	if not GlobalSignals.fog_on:
		range_decreased = false

	if range_decreased:
		$"attack area/CollisionShape2D".scale = Vector2(0.5, 0.5)
		$"detection area/CollisionShape2D".scale = Vector2(0.5, 0.5)
		$icons2.visible = true
		$icons2.play("both")
	if not range_decreased:
		$"attack area/CollisionShape2D".scale = Vector2(1, 1)
		$"detection area/CollisionShape2D".scale = Vector2(1, 1)
		$icons2.visible = false



	#SNOW STORM
	if GlobalSignals.snow_on and allowed_to_freeze:
		attacking_stopped = true
	if not GlobalSignals.snow_on:
		attacking_stopped = false

	if attacking_stopped:
		await get_tree().create_timer(randf_range(1.0, 3.0)).timeout
		$Timer.paused = true
		$icons.visible = true
		$icons.play("winter effect")
		$"frozen x-vfx".visible = true
	if not attacking_stopped:
		$"frozen x-vfx".visible = false
		$Timer.paused = false
		$icons.visible = false


func _add_light():
	allowed_to_fog = false
	range_decreased = false


func _add_heat():
	allowed_to_freeze = false
	attacking_stopped = false


func _on_attack_area_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.has_method("_take_damage"):
		body._take_damage(3)
