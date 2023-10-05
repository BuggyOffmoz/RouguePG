extends Node2D


var interactuable = false


func interact():
	if interactuable == false:
		pass
	else:
		self.get_parent().interact()


func _on_detect_interactable_player_area_area_entered(area):
	$interact_label_text.visible = true
	interactuable = true


func _on_detect_interactable_player_area_area_exited(area):
	$interact_label_text.visible = false
	interactuable = false
