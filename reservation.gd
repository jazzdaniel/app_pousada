extends Panel

@export var reservation_button:Button
@export var entry_date:LineEdit
@export var exit_date:LineEdit
@export var room_id:Label
var base_entry_date:String='entry'
var base_exit_date:String='exit'

func _ready() -> void:
	entry_date.text=base_entry_date
	exit_date.text=base_exit_date
