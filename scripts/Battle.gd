extends Node

#onready var hp_Label = $Enemy/HP_Label
onready var enemy = $Enemy

func _on_Sword_Button_pressed():
	enemy.hp += 3
	#hp_Label.text = "15hp"
