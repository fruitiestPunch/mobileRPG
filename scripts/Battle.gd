extends Node

onready var enemy = $Enemy
onready var textbox = $UI_Control/Textbox_Panel
onready var battle_action_buttons = $UI_Control/UI_GridContainer
onready var player_stats = $PlayerStats

func _ready():
	start_player_turn()

func start_enemy_turn():
	battle_action_buttons.hide()
	if(enemy != null):
		enemy.attack(player_stats)
		yield(enemy, "end_turn")
	start_player_turn()

func start_player_turn():
	battle_action_buttons.show()
	player_stats.current_ap = player_stats.max_ap
	yield(player_stats, "end_turn")
	start_enemy_turn()

func _on_Enemy_died():
	enemy = null
	battle_action_buttons.hide()
