extends CharacterBody3D


var SPEED:float = 2.0
var PLAYER_DIST:float = 4.0

var health:float = 100


func _ready() -> void:
	$Body/AnimationPlayer.play("idle")


func _process(delta: float) -> void:
	if Globals.Player != null:
		look_at(Globals.Player.position)
	
	
	
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if position.distance_to(Globals.Player.position) <= PLAYER_DIST:
		translate(Vector3.FORWARD*SPEED*delta)
	
	
	move_and_slide()



func _on_area_3d_body_entered(body: Node3D) -> void:
	print("Hola, que tal?")


func _on_explosion_finished() -> void:
	queue_free()
