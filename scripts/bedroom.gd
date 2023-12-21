extends Node2D

@onready var tile_rect = $TileMap.get_used_rect()
@onready var size_rect = $TileMap.tile_set.tile_size
@onready var character = $Character
#@onready var camera = $TileMap/Camera2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#camera.position.x = (tile_rect.end.x * size_rect.x)/2
	#camera.position.y = (tile_rect.end.y * size_rect.y)/2
	#print(tile_rect.SIDE_TOP)
	#print(tile_rect.position.y)
	#print(tile_rect.position.y + tile_rect.size.y)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	character.limit_movement((tile_rect.position.x + 1) * size_rect.x, 
							(tile_rect.position.y + 1) * size_rect.y, 
							(tile_rect.end.x - 1) * size_rect.x, 
							(tile_rect.end.y - 1) * size_rect.y)
	#camera.limit_bottom = tile_rect.position.y + tile_rect.size.y
	#camera.limit_top = tile_rect.position.y

	#camera.limit_left = tile_rect.position.x
	#camera.limit_right = tile_rect.position.x + tile_rect.size.x 
