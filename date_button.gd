extends Button

var date:Dictionary#=Time.get_datetime_dict_from_system()
var calendar_ref

func _ready() ->void:
	
	text=str(date.day)
