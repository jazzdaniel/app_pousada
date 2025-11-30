extends Button

var date:Dictionary#=Time.get_datetime_dict_from_system()
var calendar_ref

func _ready() ->void:
	
	text=str(date.day)
	highlight_today()

func highlight_today():
	print('called highlight today')
	if calendar_ref.year_today==date.year:
		print('first test')
		if calendar_ref.month_today==date.month:
			print('passed second test')
			if calendar_ref.day_today==date.day:
					print ('passed last test')
					self.theme_type_variation=("button_callendar_today")
					
