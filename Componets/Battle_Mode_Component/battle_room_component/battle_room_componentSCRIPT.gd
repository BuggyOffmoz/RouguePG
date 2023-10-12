extends Node2D
class_name BattleRoomComponent

@export_group("Battle slot manager")
@export var enemy_slot: Array[Marker2D]
@export var enemy_in_battle: Array[int]

var first_image_enemy
var second_image_enemy
var third_image_enemy

func _ready():
	pass


func start_battle():
	if enemy_in_battle.count(-1) == 3:
		print("No hay enemigos en batalla")
	else:
		$gui_ui_control.start_battle_transition()
		await get_tree().create_timer(1.5).timeout
		$gui_ui_control.finalize_battle_transition()
		$Camera2D.enabled = true
		enemy_share_image_path()
		load_enemy_sprites()


func enemy_share_image_path():
	get_tree().call_group("enemy_group","share_image_file")


func finish_battle():
	if enemy_in_battle.count(-1) == 3:
		$Camera2D.enabled = false
	else:
		print("Aun quedan enemigos!")


func verify_available_slots(enemy_id: int):
	if enemy_in_battle.has(-1):
		var slot = enemy_in_battle.find(-1)
		add_enemy_to_battle(slot,enemy_id)
		return(true)
	else:
		return(false)
		print("The battle not have space for the enemy: ",enemy_id)


func add_enemy_to_battle(slot: int,enemy_id: int):
	if slot >= 0:
		enemy_in_battle[slot] = enemy_id
		print(enemy_in_battle[slot])
	else:
		print("Error in battle_room_component")


func try_add_image_resource(aux_unic_id,aux_resource_path):
	var aux_slot: int
	if enemy_in_battle.has(aux_unic_id):
		aux_slot = enemy_in_battle.find(aux_unic_id)
		add_image_resource_path(aux_slot,aux_resource_path)
	else:
		pass
func add_image_resource_path(slot,resource_path):
	match slot:
		0:
			first_image_enemy = resource_path
		1:
			second_image_enemy = resource_path
		3:
			third_image_enemy = resource_path


func load_enemy_sprites():
	var image = Image.load_from_file(first_image_enemy)
	var texture = ImageTexture.create_from_image(image)
	$EnemySpriteManager/FirstSpriteEnemy.texture = texture

