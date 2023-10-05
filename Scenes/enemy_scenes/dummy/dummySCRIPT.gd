extends RigidBody2D


var life = 100



func take_damage(amount: int):
	life -= amount
	$show_damage_component.new_show_damage(10)



func _on_attack_timer_timeout():
	if $hitBox/CollisionShape2D.disabled == false:
		$hitBox/CollisionShape2D.disabled = true
	else:
		$hitBox/CollisionShape2D.disabled = false


func _on_hit_box_area_entered(area):
	area.take_damage(10)

