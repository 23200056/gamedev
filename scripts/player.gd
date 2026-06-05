extends CharacterBody3D

@export var forward_speed: float = 8.0
const DODGE_SPEED = 7.0
const JUMP_VELOCITY = 4.5

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	velocity.z = -forward_speed

	var input_dir = Input.get_axis("ui_left", "ui_right")
	velocity.x = input_dir * DODGE_SPEED

	move_and_slide()

	if global_position.y < -5.0:
		get_tree().reload_current_scene()
