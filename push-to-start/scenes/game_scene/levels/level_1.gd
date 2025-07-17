extends Node2D

func _ready():
	# This function is called when the node is added to the scene.
	print("Level 1 is ready!")

func _on_cameraview_2_body_entered(_body: Node2D) -> void:
	print("area 2  entered")
	$Camera2.make_current()


func _on_cameraview_1_body_entered(_body: Node2D) -> void:
	print("area 1 entered")
	$Camera1.make_current()


func _on_cameraview_3_body_entered(_body: Node2D) -> void:
	print("area 3 entered")
	$Camera3.make_current()
