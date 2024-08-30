extends Area3D
var HealthAmount = 3 # update with item data later

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("this is health")


func _on_body_entered(body):
	print(body)
	if body.get_name() == 'Player':
		SignalBus._increase_player_health.emit(HealthAmount)
		queue_free() #delete an item from memory.
