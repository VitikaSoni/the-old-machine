extends Panel


func _on_Button_pressed() -> void:
	get_tree().change_scene("res://UI/LevelsUI.tscn")


func _on_Button2_pressed() -> void:
	get_tree().change_scene("res://UI/About.tscn")


func _on_Button3_pressed() -> void:
	get_tree().change_scene("res://UI/Story.tscn")
