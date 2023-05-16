extends Node2D

const Battle_Units = preload("res://assets/resources/Battle_Units.tres")

onready var hp_label = $HP_Label
onready var animation_player = $AnimationPlayer

var hp = 30 setget set_hp
var animation_target = null
var attack_value = 7

signal died
signal end_turn

func attack() -> void:
	yield(get_tree().create_timer(0.4), "timeout")
	animation_player.play("Attack_Animation")
	yield(animation_player, "animation_finished")
	emit_signal("end_turn")

func set_hp(new_hp):
	hp = new_hp
	hp_label.text = str(hp) + "hp"

func take_damage(value):
	self.hp -= value
	if(is_dead()):
		emit_signal("died")
		queue_free()
	else:
		animation_player.play("Shake_Animation")

func is_dead():
	return hp <= 0

func deal_damage():
	Battle_Units.Player_Stats.current_hp -= attack_value

func _ready():
	Battle_Units.Enemy = self

func _exit_tree():
	Battle_Units.Enemy = null
