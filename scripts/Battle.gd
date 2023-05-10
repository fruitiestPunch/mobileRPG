extends Node

onready var hp_Label = $Enemy/HP_Label

func _on_Sword_Button_pressed():
	hp_Label.text = "15hp"
