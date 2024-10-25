extends Node2D

func _ready() -> void:
	pass

func _on_flip_button_pressed() -> void:
	$Club10.flip()


func _on_diamond_10_card_pressed() -> void:
	$Diamond10.flip()
