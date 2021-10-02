extends Node2D

onready var animatedsprite = $AnimatedSprite

func _ready() -> void:
	animatedsprite.play("Idle")
