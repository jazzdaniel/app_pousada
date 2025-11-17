extends Panel

@export var reservation_button:Button
@export var note_button:Button
@export var entry_date:LineEdit
@export var exit_date:LineEdit
@export var room_id:Label
@export var origem_line_edit:LineEdit
@export var origem_pop_up:PopupMenu


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
	
	origem_line_edit.connect('focus_entered',func():origem_pop_up.show())
	
	


#region Source PopUp Menu

func _on_origem_pop_up_id_pressed(id: int) -> void:
	origem_line_edit.text=sources[id]
	origem_line_edit.release_focus()


func _on_origem_pop_up_focus_exited() -> void:
	origem_line_edit.release_focus()

#endregion
