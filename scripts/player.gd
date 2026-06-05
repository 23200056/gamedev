extends CharacterBody3D

@export var forward_speed: float = 8.0
@export var dodge_speed: float = 5.0
@export var jump_velocity: float = 6.0

# Get the gravity from project settings
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta: float) -> void:
	# 1. GRAVITY & AIR ANIMATIONS
	if not is_on_floor():
		velocity.y -= gravity * delta
		
		# Upward movement uses the start animation
		if velocity.y > 0:
			$UAL1_Standard/AnimationPlayer.play("Jump_Start",-1 ,2) 
		# Downward movement uses the falling animation
		else:
			$UAL1_Standard/AnimationPlayer.play("Jump",-1 ,2)

	# 2. JUMP TRIGGER & GROUND ANIMATION
	if is_on_floor():
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = jump_velocity
			$UAL1_Standard/AnimationPlayer.play("Jump_Start",-1 ,2)
		else:
			# If on the ground and not jumping, sprint dynamically based on speed
			$UAL1_Standard/AnimationPlayer.play("Sprint") 

	# 3. FORWARD MOVEMENT
	velocity.z = -forward_speed
	
	# 4. SIDE-TO-SIDE MOVEMENT & ROTATION
	var input_dir = Input.get_axis("ui_left", "ui_right")
	velocity.x = input_dir * dodge_speed
	
	# 180.0 is straight ahead. Turn 30 degrees depending on input direction.
	var target_rotation_y = 180.0 + (input_dir * -30.0)
	
	# lerpf() smoothly blends the current angle towards the target angle
	$UAL1_Standard.rotation_degrees.y = lerpf($UAL1_Standard.rotation_degrees.y, target_rotation_y, 12.0 * delta)

	# 5. EXECUTE MOVEMENT
	move_and_slide()
	
	# Death plane
	if global_position.y < -5.0:
		get_tree().reload_current_scene()
