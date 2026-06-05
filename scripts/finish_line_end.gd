extends Area3D

func _on_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		print("Game Beaten! Looping to start...")
		get_tree().change_scene_to_file("res://level_1.tscn")
