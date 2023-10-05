extends CharacterBody2D


func set_amount(amount: int):
	$damage_amount_label.text = str(amount)
	$AnimationPlayer.play("up")


func self_quit():
	self.queue_free()
