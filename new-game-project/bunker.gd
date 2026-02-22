extends Area2D

var bunker_health = 10


func _ready() -> void:
	GlobalSignals.bunker_take_damage.connect(bunker_take_damage)


func _process(delta: float) -> void:
	if bunker_health <= 0:
		self.queue_free()


func bunker_take_damage():
	bunker_health -= 1
	print(bunker_health)
