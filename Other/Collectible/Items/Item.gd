extends Area2D

onready var Screw=load("res://Other/Collectible/Items/Screw/Screw.tscn")
onready var Bolt=load("res://Other/Collectible/Items/Bolt/Bolt.tscn")
onready var GearWheel=load("res://Other/Collectible/Items/GearWheel/GearWheel.tscn")
onready var playerStats=get_node("../../Player/Stats")
onready var collectibles=get_node("../")
onready var gameUI=get_node("../../GameUI")
onready var itemSprite=gameUI.get_node("ItemPanel/ItemSprite")
var can_collect=true


func drop_previous_item():
	var item
	if(playerStats.current_item=="Screw"):
		item=Screw.instance()
	elif(playerStats.current_item=="Bolt"):
		item=Bolt.instance()
	elif(playerStats.current_item=="GearWheel"):
		item=GearWheel.instance()
	if(item!=null):
		item.global_position=global_position
		item.can_collect=false
		collectibles.add_child(item)
		
func _on_Item_body_entered(body: Node) -> void:
	if can_collect:
		drop_previous_item()
		playerStats.current_item=name
		queue_free()

func _on_Item_body_exited(body: Node) -> void:
	can_collect=true
