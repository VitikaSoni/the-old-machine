extends Panel

onready var buttons=$Buttons

func _ready() -> void:
	$CheckBox.pressed=Main.music
	var i=0
	for button in buttons.get_children():
		button.get_node("Label").text=str(i)
		i+=1


	


func _on_CheckBox_toggled(button_pressed: bool) -> void:
	Main.music=button_pressed
