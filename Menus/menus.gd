extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		pass
		
		
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if self.is_visible_in_tree() :
			print('escape pressed, game unpaused')
			self.show()
			get_tree().paused = true
		else : 
			print('escape pressed, game paused')
			self.show()
			get_tree().paused = true

func _on_button_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/Temp.tscn")


func _on_button_settings_pressed() -> void:
	pass # Replace with function body.


func _on_button_quit_pressed() -> void:
	get_tree().quit()


func _on_button_resume_pressed() -> void:
	self.hide()
	#get_tree().paused = false
