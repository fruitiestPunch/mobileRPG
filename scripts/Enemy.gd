extends Node2D

onready var hp_label = $HP_Label
onready var animation_player = $AnimationPlayer

var hp = 30 setget set_hp

signal died

func set_hp(new_hp):
	hp = new_hp
	hp_label.text = str(hp) + "hp"
	if(hp <= 0):
		emit_signal("died")
		queue_free()
	else:
		animation_player.play("Shake_Animation")
		yield(animation_player, "animation_finished")
		animation_player.play("Attack_Animation")
		yield(animation_player, "animation_finished")
		var battle = get_tree().current_scene
		var player_stats = battle.find_node("PlayerStats")
		player_stats.current_hp -= 3
