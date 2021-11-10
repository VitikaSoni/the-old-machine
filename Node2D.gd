extends Node2D

onready var tileMap=$TileMap
var x=0
var y=0
var w=0
var h=0
onready var area2D=$Area2D
var t_e=0
enum {UP,DOWN,LEFT,RIGHT}

func _ready() -> void:
	randomize()
	make_box(0,0,15,8,-1)
	
	
func make_box(posx,posy,width,height,tunnel_expect):
	x=posx
	y=posy
	h=height
	w=width
	t_e=tunnel_expect
	#making up and down edge
	for i in range(posx,posx+width):
		tileMap.set_cellv(Vector2(i,posy),0)
		tileMap.set_cellv(Vector2(i,posy+h-1),0)
	
	#making left and right edge
	for j in range(posy+1,posy+height-1):
		tileMap.set_cellv(Vector2(posx,j),0)
		tileMap.set_cellv(Vector2(posx+width-1,j),0)
		
	#opening a tunnel
	

func _on_Area2D_body_entered(body: Node) -> void:
	var open_space_pos=Vector2.ZERO
	var tunnel_edge=t_e
	while tunnel_edge==t_e:
		tunnel_edge=int(rand_range(UP,RIGHT))
	match tunnel_edge:
		UP:
			open_space_pos=Vector2(int(rand_range(x+1,x+w-2)),y)
			tileMap.set_cellv(Vector2(open_space_pos.x-1,open_space_pos.y-1),0)
			tileMap.set_cellv(Vector2(open_space_pos.x+2,open_space_pos.y-1),0)
			make_box(int(rand_range(open_space_pos.x-w+1,open_space_pos.x)),open_space_pos.y-1-h,15,8,DOWN)
			tileMap.set_cellv(Vector2(open_space_pos.x,open_space_pos.y-2),-1)
			tileMap.set_cellv(Vector2(open_space_pos.x+1,open_space_pos.y-2),-1)
			
		DOWN:
			open_space_pos=Vector2(int(rand_range(x+1,x+w-2)),y+h-1)
			tileMap.set_cellv(Vector2(open_space_pos.x-1,open_space_pos.y+1),0)
			tileMap.set_cellv(Vector2(open_space_pos.x+2,open_space_pos.y+1),0)
			make_box(int(rand_range(open_space_pos.x-w+1,open_space_pos.x)),open_space_pos.y+2,15,8,UP)
			tileMap.set_cellv(Vector2(open_space_pos.x,open_space_pos.y+2),-1)
			tileMap.set_cellv(Vector2(open_space_pos.x+1,open_space_pos.y+2),-1)
			
		LEFT:
			open_space_pos=Vector2(x,int(rand_range(y+1,y+h-2)))
			tileMap.set_cellv(Vector2(open_space_pos.x-1,open_space_pos.y+2),0)
			tileMap.set_cellv(Vector2(open_space_pos.x-1,open_space_pos.y-1),0)
			make_box(open_space_pos.x-1-w,int(rand_range(open_space_pos.y-h+1,open_space_pos.y)),15,8,RIGHT)
			tileMap.set_cellv(Vector2(open_space_pos.x-2,open_space_pos.y),-1)
			tileMap.set_cellv(Vector2(open_space_pos.x-2,open_space_pos.y+1),-1)
			
		RIGHT:
			open_space_pos=Vector2(x+w-1,int(rand_range(y+1,y+h-2)))
			tileMap.set_cellv(Vector2(open_space_pos.x+1,open_space_pos.y-1),0)
			tileMap.set_cellv(Vector2(open_space_pos.x+1,open_space_pos.y+2),0)
			make_box(open_space_pos.x+2,int(rand_range(open_space_pos.y-h+1,open_space_pos.y)),15,8,LEFT)
			tileMap.set_cellv(Vector2(open_space_pos.x+2,open_space_pos.y),-1)
			tileMap.set_cellv(Vector2(open_space_pos.x+2,open_space_pos.y+1),-1)
			
	area2D.get_node("CollisionShape2D").global_position=tileMap.map_to_world(open_space_pos)
	tileMap.set_cellv(open_space_pos,-1)
	if tunnel_edge==UP or tunnel_edge==DOWN:
		tileMap.set_cellv(Vector2(open_space_pos.x+1,open_space_pos.y),-1)
		area2D.get_node("CollisionShape2D").global_position=tileMap.map_to_world(Vector2(open_space_pos.x+1,open_space_pos.y))
	else:
		tileMap.set_cellv(Vector2(open_space_pos.x,open_space_pos.y+1),-1)
		area2D.get_node("CollisionShape2D").global_position=tileMap.map_to_world(Vector2(open_space_pos.x,open_space_pos.y+1))
		
		
		
