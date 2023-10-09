extends Node

var room = preload("res://Scenes/generation_of_rooms/rooms.tscn")

var min_rooms = 7
var max_rooms = 10

var generation_chance  = 60

func generate(seed_room):
	seed(seed_room)
	var dungeon = {}
	var size = floor(randf_range(min_rooms, max_rooms))
	
	dungeon[Vector2(0,0)] = room.instantiate()
	size -= 1
	
	while(size > 0):
		for i in dungeon.keys():
			if(randf_range(0,100) < generation_chance):
				var direction = randf_range(0,4)
				if(direction < 1):
					var new_room_position = i + Vector2(1, 0)
					if(!dungeon.has(new_room_position)):
						dungeon[new_room_position] = room.instantiate()
						size -= 1
					if(dungeon.get(i).connected_rooms.get(Vector2(1, 0)) == null):
						connect_rooms(dungeon.get(i), dungeon.get(new_room_position), Vector2(1, 0))
				elif(direction < 2):
					var new_room_position = i + Vector2(-1, 0)
					if(!dungeon.has(new_room_position)):
						dungeon[new_room_position] = room.instantiate()
						size -= 1
					if(dungeon.get(i).connected_rooms.get(Vector2(-1, 0)) == null):
						connect_rooms(dungeon.get(i), dungeon.get(new_room_position), Vector2(-1, 0))
				elif(direction < 3):
					var new_room_position = i + Vector2(0, 1)
					if(!dungeon.has(new_room_position)):
						dungeon[new_room_position] = room.instantiate()
						size -= 1
					if(dungeon.get(i).connected_rooms.get(Vector2(0, 1)) == null):
						connect_rooms(dungeon.get(i), dungeon.get(new_room_position), Vector2(0, 1))
				elif(direction < 4):
					var new_room_position = i + Vector2(0, -1)
					if(!dungeon.has(new_room_position)):
						dungeon[new_room_position] = room.instantiate()
						size -= 1
					if(dungeon.get(i).connected_rooms.get(Vector2(0, -1)) == null):
						connect_rooms(dungeon.get(i), dungeon.get(new_room_position), Vector2(0, -1))
						
	return dungeon
	
	
func connect_rooms(room1, room2, direction):
	room1.connected_rooms[direction] = room2
	room2.connected_rooms[-direction] = room1
	room1.connections += 1
	room2.connections += 1
