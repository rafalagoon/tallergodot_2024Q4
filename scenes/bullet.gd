extends Node3D

@export var SPEED:float = 20


func _process(delta: float) -> void:
	translate(Vector3.FORWARD*SPEED*delta)
	


func _on_timer_timeout() -> void:
	queue_free()


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.health <= 0:
		return
	
	print_rich("[rainbow]Uno menos[/rainbow]")
	
	body.health = 0
	
	body.get_node("Body").visible = false
	body.get_node("Explosion").emitting = true
	body.get_node("CollisionShape3D").set_deferred("disabled", true)
	
	queue_free()
