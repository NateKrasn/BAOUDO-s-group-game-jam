extends Node2D


var ready1 = false
var probability: int

func _ready() -> void:
	wheather_start_timer()


func _process(delta: float) -> void:
	if ready1:
		probability = randi_range(1, 100)
		if probability < 61:
			$fog.visible = true
			await get_tree().create_timer(5).timeout
			$fog.visible = false
		elif probability < 86:
			$snow.visible = true
			await get_tree().create_timer(5).timeout
			$snow.visible = false
		elif probability < 101:
			$storm.visible = true
			await get_tree().create_timer(5).timeout
			$storm.visible = false


func wheather_start_timer():
	while true:
		await get_tree().create_timer(10).timeout
		ready1 = true
		await get_tree().create_timer(0.001).timeout
		ready1 = false
