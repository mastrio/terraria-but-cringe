extends Node2D

# Ready
func _ready():
	var randomiser = round(randf() * 10)
	if (randomiser <= 7):
		$Sprite.show()
		$Sprite2.queue_free()
	elif (randomiser >= 8):
		$Sprite2.show()
		$Sprite.queue_free()
