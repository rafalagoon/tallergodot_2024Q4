extends CharacterBody3D


func _ready() -> void:
	$Body/AnimationPlayer.play("idle")
	

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	move_and_slide()



func _on_area_3d_body_entered(body: Node3D) -> void:
	print("Hola, que tal?")
