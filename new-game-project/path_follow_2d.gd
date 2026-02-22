extends Path2D

var ENEMY = preload("res://test enemy.tscn")
var speed = 100

func _ready() -> void:
	spawn_enemies()
	await get_tree().create_timer(2).timeout



func spawn_enemies():
	var new_EMENY = ENEMY.instantiate() as test_enemy
	add_child(new_EMENY)
