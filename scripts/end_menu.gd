extends Control

func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_level_1_button_pressed() -> void:
	Global.score = 0
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")


func _on_level_2_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_2.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()
