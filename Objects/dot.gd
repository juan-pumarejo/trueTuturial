extends Path2D

@onready var path_follow_2d: PathFollow2D = $PathFollow2D
var loop : bool
signal lose
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	loop = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if loop:
		path_follow_2d.progress_ratio -= delta/10
	else:
		path_follow_2d.progress_ratio += delta/10
	if path_follow_2d.progress_ratio >= 1:
		loop = true
	if path_follow_2d.progress_ratio <= 0:
		loop = false


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		get_tree().change_scene_to_file("res://rooms/room0.tscn")
