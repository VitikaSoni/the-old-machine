extends KinematicBody2D

export var speed=60
var path=[]
var threshold=8
var nav=null
var velocity=Vector2.ZERO

func _ready() -> void:
	yield(owner,"ready")
	nav=owner.nav
	
func _physics_process(delta: float) -> void:
	if path.size()>0:
		move_to_target()
		
func move_to_target():
	if global_position.distance_to(path[0])<threshold:
		path.remove(0)
	else:
		var direction=global_position.direction_to(path[0])
		velocity=direction*speed
		velocity=move_and_slide(speed*direction)
		
func get_target_path(target_pos):
	path=nav.get_simple_path(global_position,target_pos,false)
		

func _on_HitBox_body_entered(player: Player) -> void:
	player.queue_free()
	pass
