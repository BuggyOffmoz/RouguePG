extends Node2D

@export var door_id: int
@export var text_path = "res://Scenes/world_scenes/another_room.tscn"
@export var spawn_component: Spawn_Component

func interact():
	SaveClass.internal_data_save.ENTERED_DOOR = door_id
	get_tree().change_scene_to_file(text_path)

func verify_id(aux: int):
	if aux == door_id:
		spawn_component.spawn_player_position($player_spawn_door.global_position)
	else:
		pass
