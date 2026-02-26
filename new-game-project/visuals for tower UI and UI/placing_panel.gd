extends Panel


var tempTower = null
var realTower = null
@onready var tower_scene = preload("res://towers/bullet_tower.tscn")
@onready var visual_tower_scene = preload("res://visuals for tower UI and UI/visual_bullet_tower_scene.tscn")
@onready var aoe_scene = preload("res://towers/AOE tower.tscn")
@onready var visual_aoe_scene = preload("res://visuals for tower UI and UI/visual_aoe_tower_scene.tscn")
@onready var tower_scene2 = preload("res://towers/bullet_tower2.tscn")
@onready var visual_tower_scene2 = preload("res://visuals for tower UI and UI/visual_bullet_tower_2_scene.tscn")
@onready var aoe_scene2 = preload("res://towers/aoe_tower2.tscn")
@onready var visual_aoe_scene2 = preload("res://visuals for tower UI and UI/visual_aoe_2_scene.tscn")
@onready var lightning_scene = preload("res://towers/lightning rod.tscn")
@onready var visual_lightning_scene = preload("res://visuals for tower UI and UI/visual_lightning_rod.tscn")
@onready var heat_scene = preload("res://towers/heat_tower.tscn")
@onready var visual_heat_scene = preload("res://visuals for tower UI and UI/visual_heat_tower.tscn")
@onready var light_scene = preload("res://towers/light_tower.tscn")
@onready var visual_light_scene = preload("res://visuals for tower UI and UI/visual_light_tower.tscn")



func _on_bullet_tower_gui_input(event: InputEvent) -> void:
	# LEFT CLICK PRESS → Start placing tower
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if GlobalSignals.currency >= 25 and tempTower == null:
			
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

			GlobalSignals.currency -= 25
			tempTower.queue_free()
			tempTower = null
			realTower = null


func _on_aoe_tower_panal_gui_input(event: InputEvent) -> void:
	# LEFT CLICK PRESS → Start placing tower
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if GlobalSignals.currency >= 30 and tempTower == null:
			
			var level = get_tree().get_root().get_node("test level")
			
			tempTower = visual_aoe_scene.instantiate()
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
			realTower = aoe_scene.instantiate()
			level.add_child(realTower)
			realTower.global_position = get_global_mouse_position()

			GlobalSignals.currency -= 30
			tempTower.queue_free()
			tempTower = null
			realTower = null


func _on_bullet_tower_2_panal_gui_input(event: InputEvent) -> void:
		# LEFT CLICK PRESS → Start placing tower
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if GlobalSignals.currency >= 75 and tempTower == null:
			
			var level = get_tree().get_root().get_node("test level")
			
			tempTower = visual_tower_scene2.instantiate()
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
			realTower = tower_scene2.instantiate()
			level.add_child(realTower)
			realTower.global_position = get_global_mouse_position()

			GlobalSignals.currency -= 75
			tempTower.queue_free()
			tempTower = null
			realTower = null


func _on_aoe_tower_2_panal_gui_input(event: InputEvent) -> void:
		# LEFT CLICK PRESS → Start placing tower
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if GlobalSignals.currency >= 90 and tempTower == null:
			
			var level = get_tree().get_root().get_node("test level")
			
			tempTower = visual_aoe_scene2.instantiate()
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
			realTower = aoe_scene2.instantiate()
			level.add_child(realTower)
			realTower.global_position = get_global_mouse_position()

			GlobalSignals.currency -= 90
			tempTower.queue_free()
			tempTower = null
			realTower = null


func _on_bullet_tower_2_panal_2_gui_input(event: InputEvent) -> void:
			# LEFT CLICK PRESS → Start placing tower
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if GlobalSignals.currency >= 50 and tempTower == null:
			
			var level = get_tree().get_root().get_node("test level")
			
			tempTower = visual_lightning_scene.instantiate()
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
			realTower = lightning_scene.instantiate()
			level.add_child(realTower)
			realTower.global_position = get_global_mouse_position()

			GlobalSignals.currency -= 50
			tempTower.queue_free()
			tempTower = null
			realTower = null


func _on_heat_tower_panel_gui_input(event: InputEvent) -> void:
				# LEFT CLICK PRESS → Start placing tower
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if GlobalSignals.currency >= 50 and tempTower == null:
			
			var level = get_tree().get_root().get_node("test level")
			
			tempTower = visual_heat_scene.instantiate()
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
			realTower = heat_scene.instantiate()
			level.add_child(realTower)
			realTower.global_position = get_global_mouse_position()

			GlobalSignals.currency -= 50
			tempTower.queue_free()
			tempTower = null
			realTower = null


func _on_light_panel_gui_input(event: InputEvent) -> void:
					# LEFT CLICK PRESS → Start placing tower
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if GlobalSignals.currency >= 50 and tempTower == null:
			
			var level = get_tree().get_root().get_node("test level")
			
			tempTower = visual_light_scene.instantiate()
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
			realTower = light_scene.instantiate()
			level.add_child(realTower)
			realTower.global_position = get_global_mouse_position()

			GlobalSignals.currency -= 50
			tempTower.queue_free()
			tempTower = null
			realTower = null
