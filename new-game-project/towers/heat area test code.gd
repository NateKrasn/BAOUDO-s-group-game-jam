extends Area2D


func get_overlapping_bodies(body: Node2D):
	if body.has_method("_add_heat"):
		body._add_heat()
