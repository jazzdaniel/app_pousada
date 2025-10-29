extends Panel

@export var reservation_button:Button
@export var note_button:Button
@export var entry_date:LineEdit
@export var exit_date:LineEdit
@export var room_id:Label



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

func _ready() -> void:
	entry_date.text=data_entrada
	exit_date.text=data_saida
	reservation_array=[nome, telefone, data_entrada,data_saida,\
	numero_hospedes,cpf,dias_permanencia,valor_diaria,valor_total,obs]
	print(JSON.stringify(reservation_array))
