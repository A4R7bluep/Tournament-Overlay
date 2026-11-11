extends Window

@onready var P1NameEnter = $Control/HBoxContainer/P1NameEnter
@onready var P2NameEnter = $Control/HBoxContainer/P2NameEnter
@onready var P1Score = $Control/HBoxContainer/P1Score
@onready var P2Score = $Control/HBoxContainer/P2Score
@onready var SetName = $Control/HBoxContainer/SetName

signal update_settings(p1name : String, p2name : String,
	p1score : int, p2score : int, setName : String)

var SetIndex = 0
var SetsList = ["Pools", "Top 8", "Winner's Semis", "Loser's Top 8", 
	"Loser's Quarters", "Winner's Finals", "Loser's Semis", "Loser's Finals", "Grand Finals"]


func _on_close_requested() -> void:
	hide()


func _on_apply_button_pressed() -> void:
	update_settings.emit(
		P1NameEnter.text,
		P2NameEnter.text,
		P1Score.value,
		P2Score.value,
		SetName.text
	)


func _on_set_left_pressed() -> void:
	SetIndex -= 1
	SetName.text = SetsList[SetIndex]


func _on_set_right_pressed() -> void:
	SetIndex += 1
	SetName.text = SetsList[SetIndex]
