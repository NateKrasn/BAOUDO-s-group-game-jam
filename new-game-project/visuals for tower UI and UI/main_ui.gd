extends Control

var pressed_alr: bool

func _ready() -> void:
	pressed_alr = false


func _on_buy_button_pressed() -> void:
	if not pressed_alr:
		$"placing panel".visible = false
		pressed_alr = true
	elif pressed_alr:
		$"placing panel".visible = true
		pressed_alr = false
