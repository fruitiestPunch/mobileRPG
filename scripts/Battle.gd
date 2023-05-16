extends Node

const Battle_Units = preload("res://assets/resources/Battle_Units.tres")

onready var textbox = $UI_Control/Textbox_Panel
onready var battle_action_buttons = $UI_Control/UI_GridContainer

func _ready():
	start_player_turn()

func start_enemy_turn():
	battle_action_buttons.hide()
	var enemy = Battle_Units.Enemy
	if(enemy):
		enemy.attack()
		yield(enemy, "end_turn")
	start_player_turn()

func start_player_turn():
	battle_action_buttons.show()
	var player_stats = Battle_Units.Player_Stats
	player_stats.current_ap = player_stats.max_ap
	yield(player_stats, "end_turn")
	start_enemy_turn()

func _on_Enemy_died():
	battle_action_buttons.hide()
