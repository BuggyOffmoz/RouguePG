extends Control




## VARIABLES BOOL
#var save_one_ocupated = false
#var visible_label_description_button: bool = false
#
#
#func _ready():
#	asignar_datos_ranuras()
#
#func _process(delta):
#	visible_mode_label_description_button()
#	move_label_description_button()
#
#
#func visible_mode_label_description_button():
#	$description_button.visible = visible_label_description_button
#
#
#func move_label_description_button():
#	$description_button.global_position.y = get_global_mouse_position().y + 20
#	$description_button.global_position.x = get_global_mouse_position().x + 15
#
#
#func sobre_escribir_descripcion(auxString: String, auxBolean: bool):
#	visible_label_description_button = auxBolean
#	$description_button.text = (auxString)
#
#func ajustar_position_camara():
#	get_tree().call_group("move_camera_group","move_camera",false,$menu_select_position.global_position)
#
#func asignar_datos_ranuras():
#	pass
#
#
#
#
## SEÑALES
## --------------------------------------------------------------------------------------------------
#func _on_write_button_mouse_entered():
#	sobre_escribir_descripcion("Sobre escribir guardado!",true)
#	$SaveOne/GridContainer/write_button.modulate = Color.BLACK
#func _on_write_button_mouse_exited():
#	sobre_escribir_descripcion(" ",false)
#	$SaveOne/GridContainer/write_button.modulate = Color.WHITE
#
#
#func _on_load_button_mouse_entered():
#	sobre_escribir_descripcion("Cargar partida.",true)
#	$SaveOne/GridContainer/load_button.modulate = Color.BLACK
#func _on_load_button_mouse_exited():
#	sobre_escribir_descripcion(" ",false)
#	$SaveOne/GridContainer/load_button.modulate = Color.WHITE
#
#
#func _on_delete_button_mouse_entered():
#	sobre_escribir_descripcion("¡BORRAR PARTIDA!",true)
#	$description_button.add_theme_color_override("font_color","pink")
#	$SaveOne/GridContainer/delete_button.modulate = Color.PINK
#func _on_delete_button_mouse_exited():
#	sobre_escribir_descripcion(" ",false)
#	$SaveOne/GridContainer/delete_button.modulate = Color.WHITE
#	$description_button.add_theme_color_override("font_color","white")
#
#
func _on_back_pressed():
	get_tree().call_group("move_camera_group","move_camera",true,Vector2.ZERO)


func _on_load_pressed():
	get_tree().change_scene_to_file("res://Scenes/world_scenes/init_world.tscn")
