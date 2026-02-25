extends StaticBody2D

func _ready() -> void:
	add_to_group("heat_tower")
	add_to_group("tower")
	get_parent().move_child(self, 2)
