extends Node

var max_hp = 25 
var current_hp = max_hp setget set_hp
var max_ap = 3
var current_ap = max_ap setget set_ap
var max_mp = 25
var current_mp = max_mp setget set_mp

signal hp_changed(value)
signal ap_changed(value)
signal mp_changed(value)
signal end_turn

func set_hp(value):
	current_hp = clamp(value, 0, max_hp)
	emit_signal("hp_changed", current_hp)

func set_ap(value):
	current_ap = clamp(value, 0, max_ap)
	emit_signal("ap_changed", current_ap)
	if(current_ap == 0):
		emit_signal("end_turn")
	
func set_mp(value):
	current_mp = clamp(value, 0, max_mp)
	emit_signal("mp_changed", current_mp)
