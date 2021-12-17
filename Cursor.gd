extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var TweenNode = $Tween
onready var ButtonHover = get_parent().get_node("Button")
var target
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	target = get_global_mouse_position()
	TweenNode.interpolate_property(self, "position", position, target, .2, Tween.TRANS_LINEAR, Tween.EASE_IN)
	TweenNode.start()
	if ButtonHover.is_hovered() == true:
		set_modulate(Color(1,1,0,1))
	else:
		set_modulate(Color(1,1,1,1))
	
