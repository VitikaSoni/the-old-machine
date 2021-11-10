extends KinematicBody2D
class_name Player
var direction=Vector2.ZERO
var speed=80
var collision
onready var playerStats=$Stats
onready var worldTimer=get_node("../Timer")
onready var webTileMap=get_node("../WebTileMap")
onready var position2D=$Position2D
onready var navTile=get_node("../Navigation2D/TileMap")
onready var arrayofPosition2d=[$Area2D/Position2D,$Area2D/Position2D2,$Area2D/Position2D3,$Area2D/Position2D4]
onready var camera2D=$Camera2D

func _ready() -> void:
	if Main.music:
		$AudioStreamPlayer2D.playing=true

func _physics_process(delta: float) -> void:
	direction.x=Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left")
	direction.y=Input.get_action_strength("ui_down")-Input.get_action_strength("ui_up")
	if direction.x<0:
		position2D.scale.x=-1
	elif direction.x>0:
		position2D.scale.x=1
		
	direction=move_and_slide(direction*speed)
	
	if Input.is_action_just_pressed("make_web") &&playerStats.webs>0:
		if webTileMap.get_cellv(webTileMap.world_to_map(position))!=0:
			webTileMap.set_cellv(webTileMap.world_to_map(position),0)
			playerStats.webs-=1
			
	if Input.is_action_just_pressed("toggle_camera"):
		set_physics_process(false)
		camera2D.set_physics_process(true)

		

func _on_Area2D_body_entered(dustTileMap: TileMap) -> void:
	for pos2D in arrayofPosition2d:
		var tile_pos=dustTileMap.world_to_map(pos2D.global_position)
		if dustTileMap.get_cellv(tile_pos)==0:
			dustTileMap.set_cellv(tile_pos,-1)
			navTile.set_cellv(tile_pos,0)
			
		
func queue_free():
	get_tree().change_scene("res://UI/YouLoseUI.tscn")
	









