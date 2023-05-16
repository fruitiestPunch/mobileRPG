extends "res://scripts/Action_Button.gd"

func _on_Action_Button_pressed():
	var main = get_tree().current_scene
	var player_stats = main.find_node("PlayerStats")
	if(player_stats and player_stats.current_mp >= 5):
		player_stats.current_hp += 5
		player_stats.current_mp -= 5
		player_stats.current_ap -= 1
