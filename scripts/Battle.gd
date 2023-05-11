extends Node

onready var enemy = $Enemy
onready var textbox = $UI_Control/Textbox_Panel
onready var sword_button = $UI_Control/Sword_Button

func _on_Sword_Button_pressed():
	if(enemy != null):
		enemy.hp -= 3

func _on_Enemy_died():
	enemy = null
	sword_button.disabled = true
	print("died")
