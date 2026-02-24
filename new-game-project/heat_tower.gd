extends StaticBody2D


func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.has_method("_add_heat"):
		body._add_heat()
