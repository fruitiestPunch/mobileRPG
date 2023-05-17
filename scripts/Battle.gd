extends Node

const Battle_Units = preload("res://assets/resources/Battle_Units.tres")

var enemy_died = false

onready var textbox = $UI_Control/Textbox_Panel
onready var battle_action_buttons = $UI_Control/UI_GridContainer
onready var animation_player = $AnimationPlayer
onready var next_room_button = $UI_Control/Stats_Panel/CenterContainer/Next_Room_Button
onready var enemy_position = $Enemy_Poistion2D

export(Array, PackedScene) var enemies = []

func _ready():
	start_player_turn()
	var enemy = Battle_Units.Enemy
	if(enemy):
		enemy.connect("died", self, "_on_Enemy_died")

func start_enemy_turn():
	battle_action_buttons.hide()
	var enemy = Battle_Units.Enemy
	print(enemy)
	print('queued'+ str(enemy.is_queued_for_deletion()))
	print('died'+str(enemy_died))
	if(enemy and not enemy_died):
		print('queued'+ str(enemy.is_queued_for_deletion()))
		print('died'+str(enemy_died))
		enemy.attack()
		yield(enemy, "end_turn")
	start_player_turn()

func start_player_turn():
	battle_action_buttons.show()
	var player_stats = Battle_Units.Player_Stats
	player_stats.current_ap = player_stats.max_ap
	yield(player_stats, "end_turn")
	start_enemy_turn()

func create_new_enemy():
	enemies.shuffle()
	var Enemy_object = enemies.front()
	var enemy_instance = Enemy_object.instance()
	enemy_position.add_child(enemy_instance)
	enemy_instance.connect("died", self, "_on_Enemy_died")

func _on_Enemy_died():
	enemy_died = true
	var player_stats = Battle_Units.Player_Stats
	next_room_button.show()
	battle_action_buttons.hide()
	player_stats.current_ap = player_stats.max_ap

func _on_Next_Room_Button_pressed():
	enemy_died = false
	next_room_button.hide()
	animation_player.play("Fade_To_New_Room_Animation")
	yield(animation_player, "animation_finished")
	var player_stats = Battle_Units.Player_Stats
	player_stats.current_ap = player_stats.max_ap
	battle_action_buttons.show()
	create_new_enemy()
	start_player_turn()
