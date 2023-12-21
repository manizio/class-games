extends Node2D

func _process(delta):

	var limit_left = 100  
	var limit_right = 500
	var limit_top = 100
	var limit_bottom = 500

	var current_pos = position


	current_pos.x = clamp(current_pos.x, limit_left, limit_right)
	current_pos.y = clamp(current_pos.y, limit_top, limit_bottom)

	position = current_pos  # Define a nova posição do NPC dentro dos limites da cena
