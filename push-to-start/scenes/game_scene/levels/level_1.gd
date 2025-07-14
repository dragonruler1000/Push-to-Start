extends Node2D


func playerspawn():
    print("Player spawn called")
    print(self)
    get_viewport().get_camera().current = false
    $"Camera1".current = true