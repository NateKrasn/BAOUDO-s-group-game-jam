extends StaticBody2D
var bullet= preload("res://bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func spawn_bullet():
	var new_bullet = bullet.instantiate() as BULLET
	add_child(new_bullet) 


func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	while true:
		spawn_bullet()
		await get_tree().create_timer(0.5).timeout
