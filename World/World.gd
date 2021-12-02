extends Node2D

onready var nav=$Navigation2D
onready var player=$Player
onready var itemLabel=get_node("GameUI/ItemPanel/ItemLabel")
var total_items=0

func _ready() -> void:
	Main.current_level_name=name
	itemLabel.text="0/"+str(total_items)
	
func _on_Timer_timeout() :
	get_tree().call_group("Enemy","get_target_path",player.global_position)
