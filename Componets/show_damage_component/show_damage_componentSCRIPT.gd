extends Node2D

# VARIABLES BOOLEANS
var new_label = preload("res://Componets/show_damage_component/label_mov.tscn")

# VARIABLES ARRAYS

func new_show_damage(amount_text: int):
	var label_instance = new_label.instantiate()
	label_instance.set_amount(amount_text)
	label_instance.position = $init_point.position
	add_child(label_instance)

