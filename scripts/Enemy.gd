extends Node2D

const Battle_Units = preload("res://assets/resources/Battle_Units.tres")

onready var hp_label = $HP_Label
onready var animation_player = $AnimationPlayer

export(int) var hp = 30 setget set_hp
export(int) var attack_value = 7

signal died
signal end_turn

func attack() -> void:
	print('attack')
	yield(get_tree().create_timer(0.4), "timeout")
	print('after 1st yield')
	animation_player.play("Attack_Animation")
	print('after animation')
	yield(animation_player, "animation_finished")
	print('after 2nd yield')
	emit_signal("end_turn")

func set_hp(value):
	hp = value
	#if(hp_label):
	#	hp_label.text = "hp" + str(value)
	call_deferred("set_label", value)

func set_label(value):
	hp_label.text = "hp" + str(value)

func take_damage(value):
	self.hp -= value
	if(is_dead()):
		emit_signal("died")
		print('queued to free')
		queue_free()
		print('freed')
	else:
		animation_player.play("Shake_Animation")

func is_dead():
	return hp <= 0

func deal_damage():
	Battle_Units.Player_Stats.current_hp -= attack_value

func _ready():
	Battle_Units.Enemy = self

func _exit_tree():
	print('exited tree')
	Battle_Units.Enemy = null
