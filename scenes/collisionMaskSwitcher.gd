extends Area2D

#signal newLayer

# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	print("bodies: ")
	for body: Node2D in get_overlapping_bodies():
		print(body)

func _on_body_entered(body: Node2D) -> void:
	print(body)
