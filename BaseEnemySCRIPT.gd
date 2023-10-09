extends CharacterBody2D
class_name BaseEnemy

# COMPONENTS REFERENCES
@export var player_detect_component: PlayerDetectAreaComponent
@export var self_animation_component: SpriteEnemyComponent


# VARIABLES INTS
@export var max_life: int
@export var life_actual_amount: int
@export var dextery: int
@export var viewer: int

# VARIABLES ARRAYS
@export var resistance: Array[String]


# VARIABLES BOOLEANS
var idle = true
var patrol = false
var in_alert = false
var chase_mode = false
var in_battle = false
@export var static_enemy = false
# FUNC

func _ready():
	pass


func _process(delta):
	if in_alert == true:
		in_alert = false
		in_battle = true
		self_animation_component.play_alert_animation()
		$wait_time.start()
	if in_battle == true:
		in_alert = false
		in_battle = false


func change_to_alert_mode():
	in_alert = true
	idle = false
	patrol = false

# SIGNALS



func _on_wait_time_timeout():
	in_alert = false
	chase_mode = true
	self_animation_component.play_movement_animation()
