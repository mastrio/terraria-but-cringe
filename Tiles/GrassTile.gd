extends Node2D

func _on_GrassDetector_area_entered(area):
	if (area.editor_description == "tile type = grass" || area.editor_description == "tile type = dirt"):
		var dirt_tile = preload("res://Tiles//DirtTile.tscn")
		var dirt_tile_instance = dirt_tile.instance()
		dirt_tile_instance.position = self.position
		get_parent().add_child(dirt_tile_instance)
		queue_free()
