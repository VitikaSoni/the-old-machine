extends Node2D

onready var world=get_node("../../")
onready var gameUI=get_node("../../GameUI")
onready var itemLabel=gameUI.get_node("ItemPanel/ItemLabel")
onready var itemSprite=gameUI.get_node("ItemPanel/ItemSprite")
onready var webLabel=gameUI.get_node("WebLabel")
onready var itemPanel=get_node("../../GameUI/ItemPanel")

var collected_items=0 setget set_collected_items
var current_item="" setget set_current_item



func set_collected_items(value):
	collected_items=value
	itemLabel.text=str(value)+"/"+str(world.total_items)
	if value==world.total_items:
		get_tree().change_scene("res://UI/YouWinUI.tscn")
		print(str(int(world.name)+1))
	
func set_current_item(value):
	current_item=value
	if(value!=""):
		itemSprite.texture=load("res://Other/Collectible/Items/"+value+"/"+value+".png")
	else:
		itemSprite.texture=null
		

	
