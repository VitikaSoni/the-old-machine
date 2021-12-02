extends Panel

func _ready() -> void:
	$RetryButton.text+="("+str(int(Main.current_level_name)+1)+")"

func _on_LevelMenuButton_pressed() -> void:
	get_tree().change_scene("res://UI/MainMenu.tscn")

func _on_RetryButton_pressed() -> void:
	get_tree().change_scene("res://World/Levels/"+str(int(Main.current_level_name)+1)+".tscn")
