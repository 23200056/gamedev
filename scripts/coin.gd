extends Area3D

func _process(delta: float) -> void:
	rotate_y(3.0 * delta)

func _on_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		Global.score += 10
		
		# 1. Turn off collision so the player can't collect it twice
		$CollisionShape3D.set_deferred("disabled", true)
		
		# 2. Hide the 3D model instantly
		hide()
		
		# 3. Play the sound
		$AudioStreamPlayer.play()
		
		# 4. Wait for the audio to finish playing
		await $AudioStreamPlayer.finished
		
		# 5. Delete the coin
		queue_free()
