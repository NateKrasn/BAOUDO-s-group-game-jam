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
		if probability < 46:
			$"fog warning".visible = true
			await get_tree().create_timer(4).timeout
			$"fog warning".visible = false
			await get_tree().create_timer(1).timeout
			$fog.visible = true
			GlobalSignals.fog_on = true
			await get_tree().create_timer(5).timeout
			GlobalSignals.fog_on = false
			$fog.visible = false
		elif probability < 86:
			$"snow warning".visible = true
			await get_tree().create_timer(4).timeout
			$"snow warning".visible = false
			await get_tree().create_timer(1).timeout
			$snow.visible = true
			GlobalSignals.snow_on = true
			await get_tree().create_timer(5).timeout
			GlobalSignals.snow_on = false
			$snow.visible = false
		elif probability < 101:
			$"lightning warning".visible = true
			await get_tree().create_timer(4.0).timeout
			$"lightning warning".visible = false
			await get_tree().create_timer(1).timeout
			$storm.visible = true
			start_lightning(5.0)
			await get_tree().create_timer(5.0).timeout
			$storm.visible = false


func wheather_start_timer():
	while true:
		await get_tree().create_timer(10).timeout
		ready1 = true
		await get_tree().create_timer(0.001).timeout
		ready1 = false



func start_lightning(duration: float) -> void:
	var end_time = Time.get_ticks_msec() + duration * 1000
	while Time.get_ticks_msec() < end_time:
		await get_tree().create_timer(1).timeout
		if Time.get_ticks_msec() < end_time:
			strike_tower()
			print("strike_tower")

func strike_tower() -> void:
	var rods = get_tree().get_nodes_in_group("lightning_rod")
	var towers = get_tree().get_nodes_in_group("tower")
	
	var target = null
	if rods.size() > 0:
		target = rods[randi() % rods.size()] # pick random rod
	elif towers.size() > 0:
		target = towers[randi() % towers.size()] # fallback to towers


	if target:
		$"lightning VFX".visible = false
		$"lightning VFX".position = to_local(target.global_position)
		await get_tree().process_frame  # wait one frame to ensure position is applied
		$"lightning VFX".visible = true
		await get_tree().create_timer(0.5).timeout
		$"lightning VFX".visible = false
		target.queue_free()
