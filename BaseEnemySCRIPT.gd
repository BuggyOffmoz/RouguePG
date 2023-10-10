extends CharacterBody2D
class_name BaseEnemy

# COMPONENTS REFERENCES
@export var player_detect_component: PlayerDetectAreaComponent
@export var self_animation_component: SpriteEnemyComponent



# VARIABLES INTS
@export_category("Basic Create Enemy")
@export_group("Stats")
@export_range(0,10000) var max_life: int
var life_actual_amount: int
var max_melee_atack: int
var min_melee_atack: int
var max_magic_atack: int
var min_magic_atack: int
@export_range(0,500) var max_Mana: int
@export_range(0,15) var strength: int
@export_range(0,15) var dextery: int
@export_range(0,15) var intelligence: int
@export_range(0,15) var focus: int
@export_range(0,15) var accuracy: int


@export_group("Flags")
@export_enum("Fungus","Henchman", "Normal", "Command", "Boss") var enemy_range: String
@export var static_enemy = false
@export var resistance_to_buffs = false
@export_subgroup("Resistances")
@export_range(0,20) var melee_debuff: int
@export_range(0,20) var magic_debuff: int
@export_range(0,20) var ligth_debuff: int
@export_range(0,20) var dark_debuff: int
@export_range(0,20) var fire_debuff: int
@export_range(0,20) var water_debuff: int
@export_range(0,20) var venom_debuff: int

# VARIABLES BOOLEANS
var idle = true
var patrol = false
var in_alert = false
var chase_mode = false
var in_battle = false

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
