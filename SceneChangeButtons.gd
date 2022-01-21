extends Node2D



func _on_Multiply_pressed():
	Transition._transition()
	Settings.multiply = true
	Settings.divide = false
	Settings.date = false
	yield(get_tree().create_timer(.76),"timeout")
#	if Settings.date == false:
#		Settings.multiply = true
#		Settings.divide = false
#	if:
	get_tree().change_scene("res://DivisionPractice.tscn")

func _on_Divide_pressed():
	Transition._transition()
	Settings.divide = true
	Settings.multiply = false
	Settings.date = false
	yield(get_tree().create_timer(.76),"timeout")
#	if Settings.date == false:
#		Settings.multiply = false
#		Settings.divide = true
#		Settings.date = false
#	else:
	get_tree().change_scene("res://DivisionPractice.tscn")

func _on_Dates_pressed():
	Transition._transition()
	Settings.date = true
	yield(get_tree().create_timer(.76),"timeout")
	get_tree().change_scene("res://DatePractice.tscn")
