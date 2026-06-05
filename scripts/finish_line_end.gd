extends Area3D

func _on_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		$CanvasLayer/Label.show()
		
		body.forward_speed = 0 
		body.velocity = Vector3.ZERO
		
		await get_tree().create_timer(2).timeout
