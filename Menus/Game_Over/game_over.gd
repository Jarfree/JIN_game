extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_quit_pressed() -> void:
	get_tree().quit()

func _on_button_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Menus/Start_screen/Start_screen.tscn")
