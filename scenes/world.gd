extends Node2D
@onready var ground := $Ground

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	addEdgeCollisions(ground)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func addEdgeCollisions(tMap: TileMapLayer) -> void:
	var filledTiles = tMap.get_used_cells()
	for filledT: Vector2i in filledTiles:
		if !tMap.get_cell_tile_data(filledT).z_index > 0:
			var neighbors := tMap.get_surrounding_cells(filledT)
			for neighbor: Vector2i in neighbors:
				if tMap.get_cell_source_id(neighbor) == -1:
					tMap.set_cell(neighbor, 0, Vector2(12, 0))
