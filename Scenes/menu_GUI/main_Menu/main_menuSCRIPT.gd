extends Node2D

var option_scene_path = preload("res://Scenes/menu_GUI/settings_Ui/cofig_menu_ui.tscn")


var in_option = false

func _ready():
	get_tree().call_group("move_camera_group","move_camera",true,Vector2.ZERO)


func in_option_false():
	in_option = false

# SIGNALS
func _on_play_pressed():
	get_tree().call_group("select_ui_menu_return","ajustar_position_camara")

func _on_exit_pressed():
	get_tree().quit()


func _on_option_button_pressed():
	if in_option == true:
		pass
	else:
		in_option = true
		var option_instance = option_scene_path.instantiate()
		$mainMenuControl.add_child(option_instance)
