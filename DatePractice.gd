extends Node2D

var state = 2
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rng = RandomNumberGenerator.new()
var finaldayString = ""
var history = {}
var list = ""
var time = 0
var count = 0
var date

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("colors")
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	Settings.date = true
	$UIBARRIGHT/DAhighlight.visible = true

func _process(delta):
	if state == 1:
		time += delta
		$DateText2.visible = true
		$DateText2.text = str(stepify(time,.1))
		$CenterContainer2/DayWeek.visible = false
	else:
		$DateText2.visible = true


func _on_Button_pressed():
	print(state)
	if state == 0 or state == 2:
		count += 1
		time = 0
		$Text.play("2")
		state = 1
		rng.randomize()
		var year = rng.randi_range(1,5000)
		var month = rng.randi_range(1, 12)
		var day = rng.randi_range(1,28)
		var dayRemainder
		var targetday
		var finalDay
		var startNum = 2
		var leapyear = false
		var thousands
		var hundreds
		var tens
		var ones
		var thousandRemainder
		var tensOnes
		date = (str(day) + "/" + str(month) + "/" + str(year))
		$CenterContainer/DateText.text = str(day) + " / " + str(month) + " / " + str(year)
		if len(str(year)) == 4:
			thousands = int(str(year)[0]) * 1000
			hundreds = int(str(year)[1]) * 100
			tens = int(str(year)[2]) * 10
			ones = int(str(year)[3])
			thousandRemainder = (thousands + hundreds) % 400
			tensOnes = tens + ones
			# print(thousands)
			# print(hundreds)
			# print(tens)
			# print(ones)
			# print(thousands % 400)
			if thousandRemainder != 0:
				if thousandRemainder == 300:
					startNum = 3
					# print("Thousand Remainder is 300")
				elif thousandRemainder == 200:
					startNum = 5
					# print("Thousand Remainder is 200")
				else:
					startNum = 0
					# print("Thousand Remainder is 100")
			var tensOnesRemainder = (tensOnes + int(floor(tensOnes / 4))) % 7 # 68 + 17 = 85 = 1
			if tensOnes % 4 == 0:
				leapyear = true
			else:
				leapyear = false
			startNum = startNum + tensOnesRemainder # 3
			# print("TensOnes Remainder: " + str(tensOnesRemainder))
			# print("Start Num final: " + str(startNum))
		elif len(str(year)) == 3:
			leapyear = false
			startNum = 2
			hundreds = int(str(year)[0]) * 100
			tens = int(str(year)[1]) * 10
			ones = int(str(year)[2])
			thousandRemainder = hundreds % 400
			tensOnes = tens + ones
			# print(thousands)
			# print(hundreds)
			# print(tens)
			# print(ones)
			# print(thousands % 400)
			if thousandRemainder != 0:
				if thousandRemainder == 300:
					startNum = 3
					# print("Thousand Remainder is 300")
				elif thousandRemainder == 200:
					startNum = 5
					# print("Thousand Remainder is 200")
				else:
					startNum = 0
					# print("Thousand Remainder is 100")
			var tensOnesRemainder = (tensOnes + int(floor(tensOnes / 4))) % 7
			if tensOnes % 4 == 0:
				leapyear = true
			else:
				leapyear = false

			# print("Start Num Start: " + str(startNum))
			startNum = startNum + tensOnesRemainder
			# print("TensOnes Remainder: " + str(tensOnesRemainder))
			# print("Start Num final: " + str(startNum))
		elif len(str(year)) == 2:
			leapyear = false
			startNum = 2
			tens = int(str(year)[0]) * 10
			ones = int(str(year)[1])
			tensOnes = tens + ones
			# print(thousands)
			# print(hundreds)
			# print(tens)
			# print(ones)
			# print(thousands % 400)
			var tensOnesRemainder = (tensOnes + int(floor(tensOnes / 4))) % 7
			if tensOnes % 4 == 0:
				leapyear = true
			else:
				leapyear = false
			# print("Start Num Start: " + str(startNum))
			startNum = startNum + tensOnesRemainder
			# print("TensOnes Remainder: " + str(tensOnesRemainder))
			# print("Start Num final: " + str(startNum))
		elif len(str(year)) == 1:
			leapyear = false
			startNum = 2
			ones = int(str(year)[0])
			tensOnes = ones
			# print(thousands)
			# print(hundreds)
			# print(tens)
			# print(ones)
			# print(thousands % 400)
			var tensOnesRemainder = (tensOnes + int(floor(tensOnes / 4))) % 7
			if tensOnes % 4 == 0:
				leapyear = true
			else:
				leapyear = false
			startNum = startNum + tensOnesRemainder

		if month == 1:
			if leapyear == true:
				targetday = 4
			else:
				targetday = 3
		elif month == 2:
			if leapyear == true:
				targetday = 29
			else:
				targetday = 28
		elif month == 3:
			targetday = 14
		elif month == 4:
			targetday = 4
		elif month == 5:
			targetday = 9
		elif month == 6:
			targetday = 6
		elif month == 7:
			targetday = 11
		elif month == 8:
			targetday = 8
		elif month == 9:
			targetday = 5
		elif month == 10:
			targetday = 10
		elif month == 11:
			targetday = 7
		else:
			targetday = 12
		# print("Target Day: " + str(targetday))
		dayRemainder = posmod((day - targetday),7) ##### -4
		# print("Day Remainder: " + str(dayRemainder))
		finalDay = abs(posmod((dayRemainder + startNum),7))
		# print("Final day: " + str(finalDay))
		if finalDay == 0:
			print("Sunday")
			finaldayString = "Sunday"
		elif finalDay == 1:
			print("Monday")
			finaldayString = "Monday"
		elif finalDay == 2:
			print("Tuesday")
			finaldayString = "Tuesday"
		elif finalDay == 3:
			print("Wednesday")
			finaldayString = "Wednesday"
		elif finalDay == 4:
			print("Thursday")
			finaldayString = "Thursday"
		elif finalDay == 5:
			print("Friday")
			finaldayString = "Friday"
		else:
			print("Saturday")
			finaldayString = "Saturday"
	elif state == 1:
		state = 0
		$CenterContainer2/DayWeek.visible = true
		$CenterContainer2/DayWeek.text = finaldayString
		$Text.play("1")
		var element = {"date":date,"day":finaldayString,"time":str(stepify(time,.1)),"answer":""}
		history[str(count)] = element
		var listTemp = ["\n"]
#		print(history)
		for i in history:
#			print(history[i])
#			if history[i].size() > 1:
#				listTemp.append(" ")
			for x in history[i]:
#				print(history[i][x])
				listTemp.append(history[i][x])
				listTemp.append('\n')
#		listTemp = str(listTemp) + '\n'
		print(listTemp)
		list = str(listTemp)
		list = list.replace("[","")
		list = list.replace("]","")
		list = list.replace(",","")
		$UIBARLEFT/Labels/Label1.text = str(list)
		print(list)
