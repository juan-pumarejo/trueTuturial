extends Area2D
signal collect



func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		emit_signal("collect")
	queue_free()
