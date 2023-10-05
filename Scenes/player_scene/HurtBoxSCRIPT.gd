extends Area2D


@export var life_path: Node2D

func _ready():
	pass



func take_damage(amount: int):
	life_path.take_damage(amount)
