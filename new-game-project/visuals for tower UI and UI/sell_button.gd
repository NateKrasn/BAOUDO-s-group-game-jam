extends Button

var pressed_alr: bool

func _ready() -> void:
	pressed_alr = false

func _on_pressed() -> void:
	if not pressed_alr:
		GlobalSignals.selling = true
		pressed_alr = true
	elif pressed_alr:
		GlobalSignals.selling = false
		pressed_alr = false
