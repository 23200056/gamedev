extends Area3D

func _on_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		Global.level_2_checkpoint_score = Global.score
		body.forward_speed = 0.0
		
		var hud_label = get_tree().root.find_child("ClearedLabel", true, false)
		if hud_label:
			hud_label.show()
		
		await get_tree().create_timer(2.5).timeout
		get_tree().change_scene_to_file("res://scenes/level_2.tscn")
