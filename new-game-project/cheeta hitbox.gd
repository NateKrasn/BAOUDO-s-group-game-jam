extends CharacterBody2D


var health = 6
signal die

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if health <= 0:
		emit_signal("die")
	
func _take_damage(damage):
	health-= 1 * damage
