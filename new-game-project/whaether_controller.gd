extends Node2D


var ready1 = false
var probability: int

func _ready() -> void:
	wheather_start_timer()
	$"fog warning".visible = false
	$"snow warning".visible = false

func _process(delta: float) -> void:
	if ready1:
		probability = randi_range(1, 100)
		if probability < 61:
			$"fog warning".visible = true
			await get_tree().create_timer(2).timeout
			$"fog warning".visible = false
			await get_tree().create_timer(1).timeout
			$fog.visible = true
			GlobalSignals.fog_on = true
			await get_tree().create_timer(5).timeout
			GlobalSignals.fog_on = false
			$fog.visible = false
		elif probability < 86:
			$"snow warning".visible = true
			await get_tree().create_timer(2).timeout
			$"snow warning".visible = false
			await get_tree().create_timer(1).timeout
			$snow.visible = true
			GlobalSignals.snow_on = true
			await get_tree().create_timer(5).timeout
			GlobalSignals.snow_on = false
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
