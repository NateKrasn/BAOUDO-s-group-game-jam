extends Path2D

var DEER = preload("res://test enemy.tscn")
var wolf = preload("res://wolf.tscn")
var cheetah = preload("res://cheeta.tscn")
var bat = preload("res://bat.tscn")



func _ready() -> void:
	await get_tree().create_timer(2).timeout
	spawn_enemies()
	await get_tree().create_timer(2).timeout
	spawn_wolf()
	await get_tree().create_timer(2).timeout
	spawn_cheetah()
	await get_tree().create_timer(2).timeout
	spawn_bat()
	await get_tree().create_timer(2).timeout
	spawn_enemies()
	await get_tree().create_timer(2).timeout
	spawn_enemies()
	await get_tree().create_timer(2).timeout

func spawn_enemies():
	var new_DEER = DEER.instantiate()
	add_child(new_DEER)

func spawn_wolf():
	var new_wolf = wolf.instantiate()
	add_child(new_wolf)

func spawn_cheetah():
	var new_cheetah = cheetah.instantiate()
	add_child(new_cheetah)


func spawn_bat():
	var new_bat = bat.instantiate()
	add_child(new_bat)
