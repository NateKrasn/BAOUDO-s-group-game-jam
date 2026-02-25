extends StaticBody2D

func _ready() -> void:
	add_to_group("tower")
	add_to_group("light_tower")
	get_parent().move_child(self, 2)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("tower"):
		body._on_light_area_entered()

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("tower"):
		body._on_light_area_exited()
