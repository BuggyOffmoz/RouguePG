extends CharacterBody2D
class_name BaseEnemy

# COMPONENTS REFERENCES
@export var player_detect_component: PlayerDetectAreaComponent
@export var self_animation_component: SpriteEnemyComponent
@export var area_battle_component: AreaBattleComponent
@export var battle_room_component: BattleRoomComponent

@export var enemy_in_battle_sprite = "res://Assets/Enemy_Assets/Red_Basic_Fungus.png"
@export var enemy_name: String
var enemy_unic_id: int

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
@export var resistance_to_debuffs = false
@export var melee_attacks = false
@export var magic_attacks = false
@export_subgroup("Resistances")
@export_range(0,20) var melee_debuff: int
@export_range(0,20) var magic_debuff: int
@export_range(0,20) var ligth_debuff: int
@export_range(0,20) var dark_debuff: int
@export_range(0,20) var fire_debuff: int
@export_range(0,20) var water_debuff: int
@export_range(0,20) var venom_debuff: int

@export_group("Available Attacks")
@export_flags ("FIRE", "WATER", "EARTH") var test_flags: int = 0


# VARIABLES BOOLEANS
var idle = true
var patrol = false
var in_alert = false
var im_already_on_alert = false
var chase_mode = false
var in_battle = false

# FUNC

func _ready():
	get_battle_room_component()
	try_generate_unic_id()


func _process(delta):
	pass



func change_to_alert_mode():
	in_alert = true
	idle = false
	patrol = false
	if im_already_on_alert == false:
		$wait_time.start()
		im_already_on_alert = true
		self_animation_component.play_alert_animation()


func change_to_battle_mode():
	in_alert = false
	idle = false
	patrol = false
	try_self_add_to_battle()


func try_generate_unic_id():
	var aux_id: int
	var aux_accept_id = false
	while aux_accept_id == false:
		aux_id = randi_range(1,1000)
		aux_accept_id = SaveClass.try_add_enemy_id(aux_id)
		if aux_accept_id == true:
			enemy_unic_id = aux_id

func get_battle_room_component():
	battle_room_component = get_parent().get_parent().battle_room_component


func try_self_add_to_battle():
	if battle_room_component.verify_available_slots(enemy_unic_id) == true:
		in_battle = true
		battle_room_component.start_battle()
	else:
		pass


func share_image_file():
	if in_battle == true:
		battle_room_component.try_add_image_resource(enemy_unic_id,enemy_in_battle_sprite)
	else:
		pass


# SIGNALS

func _on_wait_time_timeout():
	in_alert = false
	chase_mode = true
	self_animation_component.play_movement_animation()
