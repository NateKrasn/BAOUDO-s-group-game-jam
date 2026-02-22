extends StaticBody2D

var bullet = preload("res://bullet.tscn")
var dead = false


func _ready() -> void:
	pass



func _process(delta: float) -> void:
	pass



func spawn_bullet():
	var new_bullet = bullet.instantiate() as bullet
	add_child(new_bullet)



func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	dead = true
	while true:
		spawn_bullet()
		await get_tree().create_timer(0.5).timeout
		if not dead:
			break




func _on_area_2d_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	dead = false
