extends Node2D

# CONSTANTS INT
const max_life = 500

# VARIABLES INT
var actual_life: int

# VARIABLES BOOLEANS
@onready var is_ready = SaveClass.internal_data_save.IS_LIFE_SAVED

func _ready():

	if is_ready == false:
		print("vida guardada")
		actual_life = max_life
		SaveClass.internal_data_save.ACTUAL_LIFE = actual_life
		SaveClass.internal_data_save.IS_LIFE_SAVED = true
	else:
		print("vida cargada")
		actual_life = SaveClass.internal_data_save.ACTUAL_LIFE
	init_update_gui()


func init_update_gui():
	$"../../gui_ui_control".update_max_life(max_life)
	$"../../gui_ui_control".update_life(actual_life)
	


func take_damage(amount: int):
	if 0 >= (actual_life - amount):
		actual_life = 0
		$"../..".queue_free()
	else:
		actual_life -= amount
		SaveClass.internal_data_save.ACTUAL_LIFE = actual_life
		$"../../show_damage_component".new_show_damage(amount)
		$"../../gui_ui_control".update_life(actual_life)


func get_max_life():
	return(max_life)

func get_actual_life():
	return(actual_life)
