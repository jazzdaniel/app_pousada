extends Panel
class_name Calendar

@export var reservation_button:Button
@export var note_button:Button
@export var entry_date:Button
@export var exit_date:Button
@export var room_id:Label
@export var comment_pop_up:PopupPanel
@export var ok_button_text_edit:Button
@export var comment_text_edit:TextEdit


var calendar_scene=preload("res://calendar.tscn")

var nome:String
var telefone:String
var data_entrada:String
var data_saida:String
var numero_hospedes:int
var cpf:String
var dias_permanencia:int
var valor_diaria:int
var valor_total:int
var obs:String

var reservation_array:Array



var sources={
	0:'telefone',
	1:'airbnb',
	2:'booking'
	}
	



func _ready() -> void:
	entry_date.text=data_entrada
	exit_date.text=data_saida
	reservation_array=[nome, telefone, data_entrada,data_saida,\
	numero_hospedes,cpf,dias_permanencia,valor_diaria,valor_total,obs]
	print(JSON.stringify(reservation_array))
	
	entry_date.pressed.connect(_open_entry_calendar)
	exit_date.pressed.connect(_open_exit_calendar)
	
	


#region Source PopUp Menu


#endregion


func _on_comentário_pressed() -> void:
	comment_pop_up.show()
	comment_text_edit.grab_focus()


func _on_ok_button_text_edit_pressed() -> void:
	comment_pop_up.hide()
	
func _open_entry_calendar():
	var instance=calendar_scene.instantiate()
	add_child(instance)
	
	pass
func _open_exit_calendar():
	pass
