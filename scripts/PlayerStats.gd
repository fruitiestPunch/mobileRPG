extends Node

var max_hp = 25 
var current_hp = max_hp setget set_hp
var max_ap = 3
var currentr_ap = max_ap setget set_ap
var max_mp = 10
var current_mp = max_mp setget set_mp

signal hp_changed(value)
signal ap_changed(value)
signal mp_changed(value)
signal end_turn

func set_hp(value):
	current_hp = min(value, max_hp)
	emit_signal("hp_changed", current_hp)

func set_ap(value):
	currentr_ap = min(value, max_ap)
	emit_signal("ap_changed", currentr_ap)
	
func set_mp(value):
	current_mp = min(value, max_mp)
	emit_signal("mp_changed", current_mp)
