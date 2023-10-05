extends Node2D
class_name Spawn_Component

@export var parent: Node2D
var spawn_position: Vector2

func _ready():
	verify_id_doors()
	var player_instanciate = SaveClass.pj
	player_instanciate.global_position = spawn_position
	self.add_child(player_instanciate)


func verify_id_doors():
	var aux = SaveClass.internal_data_save.ENTERED_DOOR
	get_tree().call_group("door_group","verify_id",aux)


func spawn_player_position(aux_vector: Vector2):
	spawn_position = aux_vector
