extends StaticBody2D
var bullet= preload("res://bullet.tscn")
var enemy_pos: Vector2
var enemies_in_range = []
var target = get_nearest_enemy()
var range_decreased = false
var allowed_to_fog = true
var attacking_stopped = false
var allowed_to_freeze = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$icons.visible = false
	$icons2.visible = false


	$"muzzele shock".visible = false
	get_parent().move_child(self, 2)
	add_to_group("tower")


# Called every frame. 'delta' is the elapsed time since the previous frame.
	
func spawn_bullet():
	var new_bullet = bullet.instantiate()
	new_bullet.dir=rotation
	new_bullet.pos=$"spawn_bullet".global_position
	new_bullet.rota=global_rotation
	get_tree().current_scene.add_child(new_bullet)
	


func _on_tower_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	enemy_pos = body.position
	enemies_in_range.append(body)
	


func _on_timer_timeout() -> void:
	var target = get_nearest_enemy()
	if target:
		$"muzzele shock".visible = true
		spawn_bullet()
		await get_tree().create_timer(0.1).timeout
		$"muzzele shock".visible = false




func _on_tower_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	enemies_in_range.erase(body)
	
func get_nearest_enemy():
	var nearest = null
	var min_dist = INF
	for enemy in enemies_in_range:
		var dist = global_position.distance_to(enemy.global_position)
		if dist < min_dist:
			min_dist=dist
			nearest = enemy
		return nearest 


func _process(delta: float) -> void:
	var target = get_nearest_enemy()
	if target and not attacking_stopped:
		look_at(target.global_position)
	$icons.global_rotation = 0
	$icons.global_position = Vector2(global_position.x, global_position.y - 30)
	$icons2.global_rotation = 0
	$icons2.global_position = Vector2(global_position.x, global_position.y - 30)


	#FOG
	if GlobalSignals.fog_on and allowed_to_fog:
		range_decreased = true
	if not GlobalSignals.fog_on:
		range_decreased = false

	if range_decreased:
		$tower/CollisionShape2D.scale = Vector2(0.5, 0.5)
		$icons2.visible = true
	if not range_decreased:
		$tower/CollisionShape2D.scale = Vector2(1, 1)
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
		$AnimatedSprite2D.play("frozen gun")
	if not attacking_stopped:
		$Timer.paused = false
		$AnimatedSprite2D.play("defalt 2")
		$icons.visible = false


func _add_light():
	allowed_to_fog = false
	range_decreased = false


func _add_heat():
	allowed_to_freeze = false
	attacking_stopped = false
