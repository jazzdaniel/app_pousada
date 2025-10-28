extends Control

#@export var _1: Button
#@export var _2: Button
#@export var _3: Button
#@export var _4: Button
#@export var _5: Button
#@export var _6: Button
#@export var _7: Button
#@export var _8: Button
#@export var date_field:Label #should change to actual label later
#
#var reservation_page=load('res://reserva.tscn')
#
#func _ready() -> void:
	#for i in range(1, 9):
		#var btn = get("_" + str(i))
		#btn.connect("pressed", Callable(self, "_on_room_pressed").bind(i))
#
#func _on_room_pressed(room_number: int):
	#var date = date_field.text
	#var new_scene = reservation_page.instantiate()
	#new_scene.set_room_data(room_number, date)
	#get_tree().root.add_child(new_scene)
	#get_tree().current_scene.queue_free()
	#get_tree().current_scene = new_scene
	#
