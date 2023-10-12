extends Area2D
class_name AreaBattleComponent

@export var parent_base_enemy_component: BaseEnemy



func _on_area_entered(area):
	parent_base_enemy_component.change_to_battle_mode()
