extends Area2D

@export var layer1: int = 1
@export var layer2: int = 2

# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		if body.collision_layer == layer1
