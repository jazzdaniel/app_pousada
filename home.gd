extends Panel


@export var _1: Button
@export var _2: Button
@export var _3: Button
@export var _4: Button
@export var _5: Button
@export var _6: Button
@export var _7: Button
@export var _8: Button

@export var date_field:Label #should change to actual label later


signal room_selected(room_id:int,date:String)

func _ready() -> void:
	for i in range(1, 9):
		var btn = get("_" + str(i))
		btn.connect("pressed", Callable(self, "_on_room_pressed").bind(i))

func _on_room_pressed(room_number: int):
	room_selected.emit(room_number)
	#print('Today is:',Time.get_date_dict_from_system())
	
