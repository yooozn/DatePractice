extends Node2D

var conditional = false

func _ready():
	$UI.play("Idle")

func _on_Trigger_area_entered(area):
	if conditional == false:
		$UI.play("ToMain")
		yield(get_tree().create_timer(.3),"timeout")
		$UI.play("Main")
		conditional = true


func _on_Trigger_area_exited(area):
	if conditional == true:
		$UI.play("ToIdle")
		yield(get_tree().create_timer(.3),"timeout")
		$UI.play("Idle")
		conditional = false
