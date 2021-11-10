extends TextureButton

onready var label=$Label

func _on_TextureButton_pressed() -> void:
	get_tree().change_scene("res://World/Levels/"+str(label.text)+".tscn")
