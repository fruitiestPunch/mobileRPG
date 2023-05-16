extends "res://scripts/Action_Button.gd"

const Slash_object = preload("res://scenes/Slash_Effect.tscn")

func _on_Action_Button_pressed():
	var main = get_tree().current_scene
	var enemy = main.find_node("Enemy")
	var player_stats = main.find_node("PlayerStats")
	if(enemy and player_stats):
		player_stats.current_mp += 3
		player_stats.current_ap -= 1
		create_slash_effect(enemy.global_position)
		enemy.take_damage(4)

func create_slash_effect(position):
	var slash_instance = Slash_object.instance()
	var main = get_tree().current_scene
	main.add_child(slash_instance)
	slash_instance.global_position = position
