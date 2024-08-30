extends Area3D
var DamageAmount = 2 # will replace with enemy data
#
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("this is enemy")

func _on_body_entered(body):
	print(body)
	if body.get_name() == 'Player':
		SignalBus._decrease_player_health.emit(DamageAmount)
		#queue_free() #delete an item from memory.
