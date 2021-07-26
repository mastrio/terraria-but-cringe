extends Node2D

# Variables
var step_amount = 34
export var tile_to_spawn = preload("res://Tiles//GrassTile.tscn")

# Ready
func _ready():
	var tile = tile_to_spawn
	var tile_instance = tile.instance()
	tile_instance.position = Vector2(stepify(self.position.x, step_amount), stepify(self.position.y, step_amount))
	get_parent().add_child(tile_instance)
	self.queue_free()
