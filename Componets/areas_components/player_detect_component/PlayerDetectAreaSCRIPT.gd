extends Area2D
class_name PlayerDetectAreaComponent

# COMPONENTS REFERENCES
@export var base_enemy_component: BaseEnemy

func _ready():
	pass


func _on_area_entered(area):
	if base_enemy_component.chase_mode == true:
		pass
	else:
		var float_aux = area.get_parent().get_parent().hiddent_percent
		var percent = randf()
		if percent > float_aux:
			base_enemy_component.change_to_alert_mode()

