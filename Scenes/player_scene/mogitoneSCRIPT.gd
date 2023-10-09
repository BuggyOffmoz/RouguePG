extends CharacterBody2D



# VARIABLES INTS----------------------------------------------------------------
@export var speed: int = 200
var actual_weapon = 1
var entered_door: int


# VARIABLES BOOLEAN
var is_door_entered = false
var is_attacking = false
var is_attack_cooldown = false
var is_dash: bool = false
var is_dash_cooldown = false


# VARIABLES FLOATS
var hiddent_percent = 0.2

# VARIABLES VECTORES------------------------------------------------------------
var direction: Vector2 = Vector2(0,0)
var last_direction: Vector2 = Vector2(0,0)
# FUNCTIONS---------------------------------------------------------------------

func _ready():
	SaveClass.pj = $".".duplicate()

func _input(event):
	
	direction.x = Input.get_axis("a_ui","d_ui")
	direction.y = Input.get_axis("w_ui","s_ui")
	verify_h_flip()
	
	if event.is_action_pressed("E"):
		SaveClass.pj = $".".duplicate()
		get_tree().call_group("interactable_group","interact")
	
	if event.is_action_pressed("one"):
		actual_weapon = 1
		$gui_ui_control.actualize_actual_weapon(1)
	if event.is_action_pressed("two"):
		actual_weapon = 2
		$gui_ui_control.actualize_actual_weapon(2)
	if event.is_action_pressed("three"):
		actual_weapon = 3
		$gui_ui_control.actualize_actual_weapon(3)
	if event.is_action_pressed("four"):
		actual_weapon = 4
		$gui_ui_control.actualize_actual_weapon(4)
	
	if event.is_action_pressed("shift") and is_dash == false and is_dash_cooldown == false:
		last_direction = direction
		$gui_ui_control.dash_panel(1)
		is_dash = true
		speed = 700
		$player_animator.play("roll")
		$Timers/dash_timer.start()
		
	
	if event is InputEventMouseButton:
		if (event.button_index == MOUSE_BUTTON_LEFT
		and event.pressed 
		and is_dash == false 
		and is_attacking == false 
		and is_attack_cooldown == false):
			atacar()


func _process(delta):
	if not is_dash:
		normal_movement_player(delta)
	elif is_dash == true:
		dash_movement_player(delta)


func normal_movement_player(delta):
	velocity = direction.normalized() * speed
	move_and_slide()


func dash_movement_player(delta):
	velocity = last_direction.normalized() * speed
	move_and_slide()


func verify_h_flip():
	if direction.x == -1:
		$Areas/HittBox/Collision_attack.position.x = -35.0
	elif direction.x == 1:
		$Areas/HittBox/Collision_attack.position.x = 35.0



func change_is_door():
	is_door_entered = true


func atacar():
	$player_animator.play("attack")
	is_attacking = true
#	$HurtBox/Collision_attack.disabled = false
#	timer.start()

func finishing_attack():
	is_attack_cooldown = true
	$Timers/attack_cooldown.start()
	is_attacking = false


func change_speed():
	var tween : Tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	tween.tween_property($".","speed",100,0.4)


func final_speed():
	is_dash = false
	speed = 200


func morirse():
	pass

# SIGNALS-----------------------------------------------------------------------

func _on_dash_timer_timeout():
	$Timers/dash_cooldown.start()
	$gui_ui_control.dash_panel(2)
	is_dash_cooldown = true
	
	speed = 200
	
func _on_dash_cooldown_timeout():
	$gui_ui_control.dash_panel(0)
	is_dash_cooldown = false


func _on_hurt_box_area_entered(area):
	area.get_parent().take_damage(10)


func _on_attack_cooldown_timeout():
	is_attack_cooldown = false


func _on_area_detect_timeout():
	if $Areas/enemy_detect_this_area/CollisionShape2D.disabled == false:
		$Areas/enemy_detect_this_area/CollisionShape2D.disabled = true
	else:
		$Areas/enemy_detect_this_area/CollisionShape2D.disabled = false
