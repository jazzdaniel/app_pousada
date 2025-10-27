extends Control

var room_number: int
var date: String

func set_room_data(room: int, d: String) -> void:
	room_number = room
	date = d

func _ready():
	print("Loaded reservation for room %d on %s" % [room_number, date])
