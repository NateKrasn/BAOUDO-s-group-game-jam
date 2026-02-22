extends CharacterBody2D

class_name BULLET
var speed = 100

func _physics_process(delta: float) -> void:
	velocity.x= speed 
	move_and_slide()


func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.has_method("_take_damage"):
		body._take_damage()
		self.queue_free()
