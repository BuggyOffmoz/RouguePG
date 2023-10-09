extends Node2D

var connected_rooms = {
	Vector2(1,0): null,
	Vector2(-1,0): null,
	Vector2(0,1): null,
	Vector2(0,-1): null
}

var connections = 0
