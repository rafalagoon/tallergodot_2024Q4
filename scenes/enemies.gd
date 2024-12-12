extends Node3D


func _process(delta: float) -> void:
	var num:String = str(get_child_count())

	get_parent().get_node("EnemyCounter").text = num
