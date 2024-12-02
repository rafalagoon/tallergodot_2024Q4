extends Node3D

@export var SPEED:float = 20


func _process(delta: float) -> void:
	translate(Vector3.FORWARD*SPEED*delta)
	


func _on_timer_timeout() -> void:
	queue_free()


func _on_area_3d_body_entered(body: Node3D) -> void:
	body.queue_free()
	queue_free()
