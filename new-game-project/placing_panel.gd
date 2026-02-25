extends Panel


@onready var tower_scene = preload("res://towers/bullet_tower.tscn")
@onready var visual_tower_scene = preload("res://visual_bullet_scene.tscn")
var tempTower = null
var realTower = null
const TOWER_COST = 100

func _on_bullet_tower_gui_input(event: InputEvent) -> void:

	# LEFT CLICK PRESS → Start placing tower
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if GlobalSignals.currency >= TOWER_COST and tempTower == null:
			
			var level = get_tree().get_root().get_node("test level")
			
			tempTower = visual_tower_scene.instantiate()
			level.add_child(tempTower)
			tempTower.global_position = get_global_mouse_position()



	# MOUSE MOVE → Move preview tower
	elif event is InputEventMouseMotion:
		if tempTower:
			tempTower.global_position = get_global_mouse_position()

	# LEFT CLICK RELEASE → Finalize placement
	elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
		if tempTower and realTower == null:
			var level = get_tree().get_root().get_node("test level")
			realTower = tower_scene.instantiate()
			level.add_child(realTower)
			realTower.global_position = get_global_mouse_position()

			GlobalSignals.currency -= TOWER_COST
			tempTower.queue_free()
			tempTower = null
			realTower = null
