extends StaticBody2D

var bullet = preload("res://towers/bullet.tscn")
var enemy_pos: Vector2
var enemies_in_range = []
var range_decreased = false
var attacking_stopped = false
var heat_sources = 0

func _ready() -> void:
	$icons.visible = false
	$icons2.visible = false
	$"muzzele shock".visible = false
	get_parent().move_child(self, 2)
	add_to_group("tower")

func spawn_bullet():
	var new_bullet = bullet.instantiate()
	new_bullet.dir = rotation
	new_bullet.pos = $"spawn_bullet".global_position
	new_bullet.rota = global_rotation
	get_tree().current_scene.add_child(new_bullet)

func _on_tower_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	enemy_pos = body.position
	enemies_in_range.append(body)

func _on_tower_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	enemies_in_range.erase(body)

func _on_timer_timeout() -> void:
	var target = get_nearest_enemy()
	if target:
		$"muzzele shock".visible = true
		spawn_bullet()
		await get_tree().create_timer(0.1).timeout
		$"muzzele shock".visible = false

func get_nearest_enemy():
	var nearest = null
	var min_dist = INF
	for enemy in enemies_in_range:
		var dist = global_position.distance_to(enemy.global_position)
		if dist < min_dist:
			min_dist = dist
			nearest = enemy
	return nearest

func _process(delta: float) -> void:
	var target = get_nearest_enemy()

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

	if target and not attacking_stopped:
		look_at(target.global_position)

	$icons.global_rotation = 0
	$icons.global_position = Vector2(global_position.x, global_position.y - 30)
	$icons2.global_rotation = 0
	$icons2.global_position = Vector2(global_position.x, global_position.y - 30)

	# FOG
	range_decreased = GlobalSignals.fog_on and not lit
	$tower/CollisionShape2D.scale = Vector2(0.5, 0.5) if range_decreased else Vector2(1, 1)
	$icons2.visible = range_decreased

	# SNOW STORM
	attacking_stopped = GlobalSignals.snow_on and not heated
	if attacking_stopped:
		$Timer.paused = true
		$icons.visible = true
		$AnimatedSprite2D.play("frozen gun")
	else:
		$Timer.paused = false
		$icons.visible = false
		$AnimatedSprite2D.play("defalt 2")
