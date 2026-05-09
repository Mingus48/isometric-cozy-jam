extends Area2D

signal changeLayer(layer: int)

# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_body_entered(body: TileMapLayer) -> void:
	#print(body)
	get_parent().z_index = body.z_index + 1
	emit_signal("changeLayer", body.tile_set.get_physics_layer_collision_layer(1))
	#print(body.z_index)
	#print(get_parent().z_index)

func _on_body_exited(_body: TileMapLayer) -> void:
	#print(body)
	pass
