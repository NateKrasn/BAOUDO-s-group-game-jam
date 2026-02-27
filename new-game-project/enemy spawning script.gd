extends Path2D

var DEER = preload("res://test enemy.tscn")
var speed = 100

func _ready() -> void:
	spawn_enemies()
	await get_tree().create_timer(2).timeout
	spawn_enemies()
	await get_tree().create_timer(2).timeout
	spawn_enemies()
	await get_tree().create_timer(2).timeout
	spawn_enemies()
	await get_tree().create_timer(2).timeout
	spawn_enemies()
	await get_tree().create_timer(2).timeout
	spawn_enemies()
	await get_tree().create_timer(2).timeout

func spawn_enemies():
	var new_DEER = DEER.instantiate()
	add_child(new_DEER)
