extends Control


@export var page_container:Control
var home =preload("res://home.tscn")
var reservation = preload("res://reservation.tscn")


var child

func _ready() -> void:
	go_to_home()


func go_to_home():
	#remove current page
	clear_page_container()
	child=home.instantiate()
	
	print(child.room_selected)
	child.room_selected.connect(go_to_reservation)
	
	page_container.add_child(child)
	
func go_to_reservation(room:int=5,date:String="28/out/2025"):
	print(room,date)
	clear_page_container()
	child=reservation.instantiate()
	page_container.add_child(child)
	
	

#region Aux funcitons#
func clear_page_container():
	child=page_container.get_children()
	if child != []:
		child[0].queue_free()
#endregion

func tester():
	print('tester function')
