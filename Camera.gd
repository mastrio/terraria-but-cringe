extends Node2D

func _physics_process(_delta):
	self.position = get_parent().get_node("Player").position
	$Coords.text = str(round(get_parent().get_node("Player").position.x)) + ", " + str(round(get_parent().get_node("Player").position.y))
