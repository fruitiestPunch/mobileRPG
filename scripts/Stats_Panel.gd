extends Panel

onready var hp_label = $Stats_HBoxContainer/Hp_Label
onready var ap_label = $Stats_HBoxContainer/Ap_Label
onready var mp_label = $Stats_HBoxContainer/Mp_Label


func _on_PlayerStats_ap_changed(value):
	ap_label.text = "AP" + "\n" + str(value)

func _on_PlayerStats_hp_changed(value):
	hp_label.text = "HP" + "\n" + str(value)

func _on_PlayerStats_mp_changed(value):
	mp_label.text = "MP" + "\n" + str(value)
