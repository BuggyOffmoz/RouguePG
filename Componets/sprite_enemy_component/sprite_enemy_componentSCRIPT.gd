extends Sprite2D
class_name SpriteEnemyComponent




func _ready():
	$AnimationPlayer.play("idle_animation")


func play_alert_animation():
	$AnimationPlayer.play("alert_animation")


func play_idle_animation():
	$AnimationPlayer.play("idle_animation")


func play_movement_animation():
	$AnimationPlayer.play("movement_animation")
