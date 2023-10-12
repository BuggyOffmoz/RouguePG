extends Node2D

# Node reference
@export var stat_manager: Node


# CONSTANTS INT
const max_life = 100

# VARIABLES INT
var actual_life: int

# VARIABLES BOOLEANS
@onready var is_ready = SaveClass.internal_data_save.IS_LIFE_SAVED

func _ready():

	if is_ready == false:
		stat_manager.life_actual_amount = max_life
		SaveClass.internal_data_save.ACTUAL_LIFE = stat_manager.life_actual_amount
		SaveClass.internal_data_save.IS_LIFE_SAVED = true
	else:
		stat_manager.life_actual_amount = SaveClass.internal_data_save.ACTUAL_LIFE
	init_update_gui()


func init_update_gui():
	$"../../gui_ui_control".update_max_life(max_life)
	$"../../gui_ui_control".update_life(actual_life)
	


func take_damage(amount: int):
	if 0 >= (stat_manager.life_actual_amount - amount):
		stat_manager.life_actual_amount = 0
		$"../..".queue_free()
	else:
		stat_manager.life_actual_amount -= amount
		SaveClass.internal_data_save.ACTUAL_LIFE = actual_life
		$"../../show_damage_component".new_show_damage(amount)
		$"../../gui_ui_control".update_life(actual_life)


func get_max_life():
	return(max_life)

func get_actual_life():
	return(actual_life)
