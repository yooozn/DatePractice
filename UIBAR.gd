extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var conditional = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$UI.play("Idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_MainBarTrigger_mouse_entered():
	print("MouseEntered")
	$UI.play("ToMain")
	yield(get_tree().create_timer(.3),"timeout")
	$UI.play("Main")


func _on_MainBarTrigger_mouse_exited():
	print("MouseExited")
	$UI.play("ToIdle")
	yield(get_tree().create_timer(.3),"timeout")
	$UI.play("Idle")


func _on_MainBarTrigger_area_entered(area):
	if conditional == false:
		print("MouseEntered")
		$UI.play("ToMain")
		yield(get_tree().create_timer(.3),"timeout")
		conditional = true
		$UI.play("Main")


func _on_MainBarTrigger_area_exited(area):
	if conditional == true:
		print("MouseExited")
		$UI.play("ToIdle")
		yield(get_tree().create_timer(.3),"timeout")
		conditional = false
		$UI.play("Idle")
