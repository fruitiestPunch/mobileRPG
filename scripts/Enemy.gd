extends Node2D

onready var hp_label = $HP_Label

var hp = 30 setget set_hp

func set_hp(new_hp):
	hp = new_hp
	hp_label.text = str(hp) + "hp"

