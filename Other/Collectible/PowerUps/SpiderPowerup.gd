extends Area2D

onready var gameUI=get_node("../../GameUI")
onready var player=get_node("../../Player")
onready var playerstats=player.get_node("Stats")

func _on_SpiderPowerup_body_entered(body: Node) -> void:
	playerstats.webs+=1
	
	
