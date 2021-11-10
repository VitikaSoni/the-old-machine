extends Panel


func _ready() -> void:
	$RetryButton.text+="("+Main.current_level_name+")"


func _on_LevelMenuButton_pressed() -> void:
	get_tree().change_scene("res://UI/MainMenu.tscn")


func _on_RetryButton_pressed() -> void:
	get_tree().change_scene("res://World/Levels/"+Main.current_level_name+".tscn")
