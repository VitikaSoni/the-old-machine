extends Camera2D

var direction=Vector2.ZERO
const SPEED=5
onready var player=get_node("../")

func _ready() -> void:
	set_physics_process(false)
	
func _physics_process(delta: float) -> void:
	direction.x=Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left")
	direction.y=Input.get_action_strength("ui_down")-Input.get_action_strength("ui_up")
	global_position+=SPEED*direction
	if Input.is_action_just_released("toggle_camera"):
		global_position=player.global_position
		player.set_physics_process(true)
		set_physics_process(false)
		
		
