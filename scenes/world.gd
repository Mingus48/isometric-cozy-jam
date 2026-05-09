extends Node2D
@export var layer1: TileMapLayer
@export var layer2: TileMapLayer

var layers: Array[TileMapLayer]
var switchLayer: int = 8

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	layers = [layer1, layer2]
	for layer: TileMapLayer in layers:
		setCollisionLayers(layer)
		addEdgeCollisions(layer)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta: float) -> void:
	#pass

func setCollisionLayers(layer: TileMapLayer) -> void:
	var i := layers.find(layer)
	layer.tile_set.set_physics_layer_collision_layer(0, 2 ** i)
	layer.tile_set.set_physics_layer_collision_layer(1, 2 ** (i + 1))
	layer.tile_set.set_physics_layer_collision_layer(2, 2 ** (switchLayer - 1))

func addEdgeCollisions(tMap: TileMapLayer) -> void:
	var filledTiles = tMap.get_used_cells()
	for filledT: Vector2i in filledTiles:
		if !tMap.get_cell_tile_data(filledT).z_index > 0:
			var neighbors := tMap.get_surrounding_cells(filledT)
			for neighbor: Vector2i in neighbors:
				if tMap.get_cell_source_id(neighbor) == -1:
					tMap.set_cell(neighbor, 0, Vector2(12, 0))
