extends Node2D

func _transition():
	$AnimationPlayer.play("Transition1")
	print("transition")
