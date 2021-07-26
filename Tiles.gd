extends Node2D

func _input(event):
	# Placing Tile
	if event.is_action_pressed("place_tile"):
		var mouse_position = get_viewport().get_mouse_position()
		var tile = preload("res://Tiles//PlaceholderTile.tscn")
		var tile_instance = tile.instance()
		tile_instance.position = mouse_position
		get_parent().get_node("Tiles").add_child(tile_instance)
		#print(tile_instance.position)
