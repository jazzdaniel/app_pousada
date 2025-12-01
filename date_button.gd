extends Button

var date:Dictionary#=Time.get_datetime_dict_from_system()
var calendar_ref

func _ready() ->void:
	
	if date:
		text=str(date.day)
		highlight_today()
		shadow_last_and_next_month()

func highlight_today():
	#print('called highlight today')
	if calendar_ref.year_today==date.year:
		#print('first test')
		if calendar_ref.month_today==date.month:
			#print('passed second test')
			if calendar_ref.day_today==date.day:
					#print ('passed last test')
					self.theme_type_variation=("button_calendar_today")
					

func shadow_last_and_next_month():
	if calendar_ref.selected_date.month != date.month:
			self.theme_type_variation=("button_calendar_not_this_month")
