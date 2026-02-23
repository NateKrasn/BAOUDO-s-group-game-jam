extends StaticBody2D
var bullet= preload("res://bullet.tscn")
var enemy_pos: Vector2
var enemies_in_range = []
var target = get_nearest_enemy()
var range_decreased = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
	
func spawn_bullet():
	print("SPAWN")
	var new_bullet = bullet.instantiate()
	new_bullet.dir=rotation
	new_bullet.pos=$".".global_position
	new_bullet.rota=global_rotation
	get_tree().current_scene.add_child(new_bullet)
	


func _on_tower_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	enemy_pos = body.position
	enemies_in_range.append(body)
	


func _on_timer_timeout() -> void:
	var target = get_nearest_enemy()
	if target:
		spawn_bullet()



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
	if target:
		look_at(target.global_position)

	if GlobalSignals.fog_on:
		range_decreased = true
	if not GlobalSignals.fog_on:
		range_decreased = false

	if range_decreased:
		$tower/CollisionShape2D.scale = Vector2(0.5, 0.5)
	if not range_decreased:
		$tower/CollisionShape2D.scale = Vector2(1, 1)

func _add_light():
	while true:
		range_decreased = false
