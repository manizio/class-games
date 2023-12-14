extends Node2D

@onready var character = $Character
@onready var bg = $Background

var char_pos = 0
var bg_rect = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	bg_rect = bg.get_rect()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	character.limit_movement(bg_rect.position.x, bg_rect.position.y, bg_rect.size.x, bg_rect.size.y)	
