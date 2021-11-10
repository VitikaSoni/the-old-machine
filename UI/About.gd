extends Panel

func _on_LinkButton_pressed() -> void:
	OS.shell_open("https://www.youtube.com/channel/UCduXwGSz5SLfoD0JqMs6DVA")


func _on_Button_pressed() -> void:
	get_tree().change_scene("res://UI/MainMenu.tscn")
