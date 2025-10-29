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
	
	child.room_selected.connect(go_to_reservation)
	
	page_container.add_child(child)
	
func go_to_reservation(room:int,date:String="28/out/25"):
	clear_page_container()
	child=reservation.instantiate()
	
	child.reservation_button.pressed.connect(go_to_home)
	
	child.data_entrada=date
	child.room_id.text="Quarto " + str(room)
	
	
	page_container.add_child(child)
	
	

#region Aux funcitons#
func clear_page_container():
	
	if page_container.get_child(0):
		page_container.get_child(0).queue_free()

#endregion
