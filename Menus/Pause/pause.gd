extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if get_tree().paused == true :
			print('escape pressed, game unpaused')
			self.hide()
			get_tree().paused = false
		else : 
			print('escape pressed, game paused')
			self.show()
			get_tree().paused = true 


func _on_button_settings_pressed() -> void:
	pass # Replace with function body.


func _on_button_quit_pressed() -> void:
	get_tree().quit()


func _on_button_resume_pressed() -> void:
	get_tree().paused = false
	self.hide()
