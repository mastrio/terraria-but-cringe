extends Node2D

# Variables
var step_amount = 35

# Input event
func _input(event):
	if event.is_action_pressed("click"):
		var tile = preload("res://Blocks//Tiles//GrassTile.tscn")
		var tile_instance = tile.instance()
		var mouse_position = get_viewport().get_mouse_position()
		tile_instance.position = Vector2(stepify(mouse_position.x, step_amount), stepify(mouse_position.y, step_amount))
		add_child(tile_instance)
		print(tile_instance.position)
