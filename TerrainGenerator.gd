extends Node

const LENGTH = 80
const WIDTH = 45

const TILES = {
	"grass": 0,
	"sand": 1,
	"snow": 2
}

export(OpenSimplexNoise) var open_simplex_noise: OpenSimplexNoise
export(NodePath) var tilemap_path: NodePath

var tilemap: TileMap


func _ready():
	randomize()
	tilemap = get_node(tilemap_path)
	open_simplex_noise.seed = randi()
	
	_generate_world()


func _generate_world():
	for x in LENGTH:
		for y in WIDTH:
			tilemap.set_cellv(Vector2(x, y), _get_tile_index(open_simplex_noise.get_noise_2d(float(x), float(y))))
	
	tilemap.update_bitmask_region()

func _get_tile_index(noise_value):
	if noise_value < -0.1:
		return TILES.sand
	if noise_value < 0.4:
		return TILES.grass
	return TILES.snow
