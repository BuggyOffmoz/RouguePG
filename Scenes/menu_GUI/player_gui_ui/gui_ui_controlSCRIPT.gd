extends CanvasLayer
# PRELOADS----------------------------------------------------------------------

var option_scene_path = preload("res://Scenes/menu_GUI/settings_Ui/cofig_menu_ui.tscn")
@export var lifecomponent: Node2D

# VARIABLES BOOLEANS------------------------------------------------------------
var is_paused = false
var is_config = false
var default = true

#INT
var max_life: int


func _input(event):
	
	
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			$LEFT_click.self_modulate = Color.WHITE
		elif event.button_index == MOUSE_BUTTON_LEFT and event.is_released():
			$LEFT_click.self_modulate = Color.BLACK
		
		if event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			$RIGTH_click.self_modulate = Color.WHITE
		elif event.button_index == MOUSE_BUTTON_RIGHT and event.is_released():
			$RIGTH_click.self_modulate = Color.BLACK
	
	
	
	if event is InputEventKey:
		
		if event.is_action_pressed("exit_button"):
			if is_paused == false and is_config == false:
				is_paused = true
				pupop_exit_menu()
			elif is_paused == true and is_config == false: 
				is_paused = false
				pupop_exit_menu()
		
		
		if event.is_action_pressed("a_ui"):
			$A_panel.modulate = Color.WHITE
		if event.is_action_pressed("d_ui"):
			$D_panel.modulate = Color.WHITE
		if event.is_action_pressed("w_ui"):
			$W_panel.modulate = Color.WHITE
		if event.is_action_pressed("s_ui"):
			$S_panel.modulate = Color.WHITE
			
			
		if event.is_action_released("a_ui"):
			$A_panel.modulate = Color.BLACK
		if event.is_action_released("d_ui"):
			$D_panel.modulate = Color.BLACK
		if event.is_action_released("w_ui"):
			$W_panel.modulate = Color.BLACK
		if event.is_action_released("s_ui"):
			$S_panel.modulate = Color.BLACK


func dash_panel(aux: int):
	match aux:
		0:
			$dash_panel.modulate = Color.BLACK
		1:
			$dash_panel.modulate = Color.WHITE
		2:
			$dash_panel.modulate = Color.DIM_GRAY


func actualize_actual_weapon(aux: int):
	delete_actual_weapon()
	match aux:
		1:
			$one.self_modulate = Color.WHITE
		2:
			$two.self_modulate = Color.WHITE
		3:
			$three.self_modulate = Color.WHITE
		4:
			$four.self_modulate = Color.WHITE


func delete_actual_weapon():
	$one.self_modulate = Color.BLACK
	$two.self_modulate = Color.BLACK
	$three.self_modulate = Color.BLACK
	$four.self_modulate = Color.BLACK


func pupop_exit_menu():
	
	$exit_menu.visible = is_paused
	print(is_paused)
	if is_paused == true:
		get_tree().paused = true
	elif is_paused == false:
		get_tree().paused = false

func in_option_false():
	is_config = false

func update_max_life(amount: int):
	$ProgressBar.max_value = amount

func update_life(amount: int):
	$ProgressBar.set_value_no_signal(amount)

# SIGNALS-----------------------------------------------------------------------

func _on_continue_button_pressed():
	is_paused = false
	$exit_menu.visible = is_paused
	get_tree().paused = false


func _on_exit_button_pressed():
	is_paused = false
	$exit_menu.visible = is_paused
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/menu_GUI/main_Menu/main_menu.tscn")


func _on_option_button_pressed():
		var option_instance = option_scene_path.instantiate()
		is_config = true
		$".".add_child(option_instance)
