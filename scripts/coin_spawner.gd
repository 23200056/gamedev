extends Node3D

@export var coin_scene: PackedScene
@export var coin_count: int = 20
@export var start_z: float = 85.0   # Starts slightly closer than the first trap
@export var spacing_z: float = 7.0  # Offsets the rhythm from the traps

var lanes = [-3.0, 0.0, 3.0]

func _ready():
	if not coin_scene: return
	
	var current_z = start_z
	for i in range(coin_count):
		var coin = coin_scene.instantiate()
		add_child(coin)
		
		var random_lane = lanes[randi() % lanes.size()]
		coin.position = Vector3(random_lane, 1.0, current_z)
		current_z -= spacing_z
