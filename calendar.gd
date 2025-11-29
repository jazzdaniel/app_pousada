extends Control

@export var month_year_label:Label
@export var column_box:HBoxContainer
@export var previous_button:Button
@export var next_button:Button


const date_button_scene:PackedScene=preload("res://date_button.tscn")
const month_names:Array=['janeiro','fevereiro','março',\
'abril','maio','junho','julho','agosto','setembro','outubro',\
'novembro','dezembro']
const seconds_in_a_day:int=86400

var selected_date=Time.get_date_dict_from_system()

func _ready() -> void:
	previous_button.pressed.connect(go_to_previous_month)
	next_button.pressed.connect(go_to_next_month)
	#print(selected_date)
	set_calendar()
	

func set_calendar():
	set_month_year_label()
	var first_day_of_the_month=get_first_day_of_month(selected_date)
	var first_day_of_the_month_unix=Time.get_unix_time_from_datetime_dict(first_day_of_the_month)
	var first_week_day_of_month:int=first_day_of_the_month.weekday -1
	if first_week_day_of_month==-1:
		first_week_day_of_month=6
	
	#first monday of the calendar can be in the previous month
	var first_monday_of_calendar=Time.get_datetime_dict_from_unix_time(first_day_of_the_month_unix - seconds_in_a_day*(first_week_day_of_month))
	#print(first_monday)
	var calculate_date=first_monday_of_calendar
	
	for i in 5*7: # 5 rows of a 7 days week
		add_date_button(calculate_date,i%7)
		calculate_date=get_next_day(calculate_date)
		
		
	
	if selected_date.month !=calculate_date.month:return
	
	#the next block runs only if, by the end of the operation
	#we're still in the same month
	#that means wee need a extra row, one of those long months
	
	for i in 7: # 5 rows of a 7 days week
		add_date_button(calculate_date,i%7)
		calculate_date=get_next_day(calculate_date)
	
		
		
func add_date_button(date:Dictionary,index:int):
		var date_button=date_button_scene.instantiate()
		date_button.date=date
		column_box.get_children()[index].add_child(date_button)
		

func get_next_day(date:Dictionary):
	var next_day_unix_time=Time.get_unix_time_from_datetime_dict(date)+seconds_in_a_day
	return Time.get_datetime_dict_from_unix_time(next_day_unix_time)
	
	
	
func set_month_year_label():
	month_year_label.text=(month_names[selected_date.month-1]+' '\
	+str(selected_date.year))

func go_to_previous_month():
	selected_date.month-=1
	refresh_calendar()
func go_to_next_month():
	selected_date.month+=1
	refresh_calendar()
	
	
func get_first_day_of_month(date:Dictionary):
	#changing the day to 1 doesn't change the weekday,
	#that's why the conversion is needed
	
	date.day=1
	#print(date)
	var selected_unix_time=Time.get_unix_time_from_datetime_dict(date)
	#print(Time.get_datetime_dict_from_unix_time(selected_unix_time))
	return Time.get_datetime_dict_from_unix_time(selected_unix_time)

func refresh_calendar():
	if selected_date.month>12:
		selected_date.month=1
		selected_date.year+=1
	elif selected_date.month<1:
		selected_date.month=12
		selected_date.year-=1
		
	for column in column_box.get_children():
		for node in column.get_children():
			if node is Label:continue
			node.queue_free()
	set_calendar()
