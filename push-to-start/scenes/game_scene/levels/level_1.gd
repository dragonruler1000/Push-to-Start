extends Node2D

func _ready():
	# This function is called when the node is added to the scene.
	print("Level 1 is ready!")
	var area2 = get_node("cameraview2")
	area2.connect("area_entered", self, "_on_cameraview_2_area_entered")

func _on_cameraview_2_area_entered(_area:Area2D) -> void:
	get_viewport().get_camera().current = false
	$"Camera2".current = true
	print("Camera switched to Camera2")
