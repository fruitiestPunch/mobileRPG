extends "res://scripts/Action_Button.gd"

func _on_Action_Button_pressed():
	print('heal')
	var player_stats = Battle_Units.Player_Stats
	if(player_stats and player_stats.current_mp >= 5):
		player_stats.current_hp += 5
		player_stats.current_mp -= 5
		player_stats.current_ap -= 1
