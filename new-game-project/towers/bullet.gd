extends CharacterBody2D

var speed = 1000
var pos: Vector2
var rota: float
var dir: float
@export var bullet: PackedScene

func _ready() -> void:
	global_position = pos
	global_rotation = rota
func _physics_process(delta: float) -> void:
	velocity= Vector2(speed,0).rotated(dir)
	move_and_slide()


func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.has_method("_take_damage"):
		body._take_damage(1)
		self.queue_free()
	if body.has_method("_take_bullet_damage"):
		body._take_bullet_damage(1)
		self.queue_free()
