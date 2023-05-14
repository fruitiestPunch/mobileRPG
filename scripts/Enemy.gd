extends Node2D

onready var hp_label = $HP_Label
onready var animation_player = $AnimationPlayer

var hp = 30 setget set_hp
var animation_target = null
var attack_value = 7

signal died
signal end_turn

func attack(stats_target) -> void:
	yield(get_tree().create_timer(0.4), "timeout")
	animation_player.play("Attack_Animation")
	self.animation_target = stats_target
	yield(animation_player, "animation_finished")
	self.animation_target = null
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
	self.animation_target.current_hp -= attack_value
	print("deal dmg")
