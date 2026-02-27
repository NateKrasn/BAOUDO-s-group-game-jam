extends Control

var pressed_alr: bool
var pressed_alr2: bool

func _ready() -> void:
	pressed_alr = false
	pressed_alr2 = true

func _on_buy_button_pressed() -> void:
	if not pressed_alr:
		$"placing panel".visible = false
		pressed_alr = true
	elif pressed_alr:
		$"placing panel".visible = true
		pressed_alr = false


func _on_button_pressed() -> void:
	$"main menu show".visible = true
	get_tree().paused = true


func _on_button_2_pressed() -> void:
	$"main menu show".visible = false
	get_tree().paused = false


func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")
