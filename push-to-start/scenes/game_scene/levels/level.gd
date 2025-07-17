extends Node

signal level_won
signal level_lost

var level_state : LevelState

func _on_lose_button_pressed() -> void:
	level_lost.emit()

func _on_win_button_pressed() -> void:
	level_won.emit()
	print("Level won!")

func open_tutorials() -> void:
	%TutorialManager.open_tutorials()
	level_state.tutorial_read = true

func _ready() -> void:
	level_state = GameState.get_level_state(scene_file_path)
	%ColorPickerButton.color = level_state.color
	%BackgroundColor.color = level_state.color
	if not level_state.tutorial_read:
		open_tutorials()
	
	# $player.playerspawn()

func _on_color_picker_button_color_changed(color : Color) -> void:
	%BackgroundColor.color = color
	level_state.color = color
	GlobalState.save()

func _on_tutorial_button_pressed() -> void:
	open_tutorials()


func _on_cameraview_2_body_entered(_body: Node2D) -> void:
	print("area 2  entered")
	$Camera2.make_current()


func _on_cameraview_1_body_entered(_body: Node2D) -> void:
	print("area 1 entered")
	$Camera1.make_current()


func _on_cameraview_3_body_entered(_body: Node2D) -> void:
	print("area 3 entered")
	$Camera3.make_current()


func _on_kill_box_body_entered(_body: Node2D) -> void:
	level_lost.emit()
	print("Kill box entered, level lost!")

func _on_level_end_area_body_entered(_body:Node2D) -> void:
	level_won.emit()
	print("Level end area entered, level won!")
