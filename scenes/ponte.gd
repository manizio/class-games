extends Node2D



func _on_timer_timeout():
	$AnimationPlayer.play("fade")


func _on_animation_player_animation_finished(anim_name):
	$RigidBody2D/CollisionPolygon2D.disabled = true
	$BackTimer.start()

func _on_back_timer_timeout():
	$RigidBody2D/CollisionPolygon2D.disabled = false
	$RigidBody2D/Sprite2D.modulate = Color(1,1,1)
	
