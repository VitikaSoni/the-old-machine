extends Area2D

export var name=""
onready var sprite=$Sprite
onready var playerStats=get_node("../../Player/Stats")


func _on_ScrewBox_body_entered(body: Node) -> void:
	if(playerStats.screws>0):
		playerStats.screws-=1
		playerStats.current_item=""
		sprite.texture=load("res://Other/Boxes/ScrewBox(filled).png")
		yield(get_tree().create_timer(5),"timeout")
		queue_free()
			

func _on_BoltBox_body_entered(body: Node) -> void:
	if(playerStats.bolts>0):
		playerStats.bolts-=1
		playerStats.current_item=""
		sprite.texture=load("res://Other/Boxes/BoltBox(filled).png")
		yield(get_tree().create_timer(5),"timeout")
		queue_free()
