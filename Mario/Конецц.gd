extends Node2D





func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://меню.tscn")


func _on_restart_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
