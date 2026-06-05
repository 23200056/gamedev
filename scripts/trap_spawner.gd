extends Node3D

@export var trap_scene: PackedScene
@export var trap_count: int = 10        
@export var start_z: float = 70.0       
@export var spacing_z: float = 15.0     

var lanes = [-3.0, 0.0, 3.0]            

func _ready():
	if not trap_scene:
		push_error("Trap scene is not assigned in the inspector!")
		return

	var current_z = start_z

	for i in range(trap_count):
		var trap = trap_scene.instantiate()
		add_child(trap)

		# Pick a random lane for the trap
		var random_lane = lanes[randi() % lanes.size()]
		
		# Position it. Y is 0.5 so it sits on top of the floor
		trap.position = Vector3(random_lane, 0.5, current_z)

		# Move further down the track (Negative Z is forward)
		current_z -= spacing_z
