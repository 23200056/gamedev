extends Area3D

func _on_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		Global.score = 0
		get_tree().reload_current_scene.call_deferred()
