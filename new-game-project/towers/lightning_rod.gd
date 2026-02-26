extends Sprite2D



func _ready() -> void:
	add_to_group("lightning_rod")
	get_parent().move_child(self, 2)


func _on_button_pressed() -> void:
	GlobalSignals.currency += 45
	self.queue_free()
