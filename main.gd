extends Control


var Player1Score : int = 0
var Player2Score : int = 0
var Player1Name : String = ""
var Player2Name : String = ""

var SetIndex = 0
var SetsList = ["Pools", "Top 8", "Winner's Semis", "Loser's Top 8", 
	"Loser's Quarters", "Winner's Finals", "Loser's Semis", "Loser's Finals", "Grand Finals"]
var SetStr = "Pools"

@onready var LeftName = $HBoxContainer/LeftNamePanel/Label
@onready var LeftScore = $HBoxContainer/LeftScorePanel/Label
@onready var RightName = $HBoxContainer/RightNamePanel/Label
@onready var RightScore = $HBoxContainer/RightScorePanel/Label
@onready var SetName = $HBoxContainer/SetName/Label
@onready var SettingsWindow = $SettingsWindow

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	open_settings()


func _process(_delta: float) -> void:
	handle_input()


func handle_input() -> void:
	if Input.is_action_just_pressed("IncreasePlayer1Score"):
		Player1Score += 1
		update_ui()
	if Input.is_action_just_pressed("DecreasePlayer1Score") and (Player1Score - 1) >= 0:
		Player1Score -= 1
		update_ui()
	
	if Input.is_action_just_pressed("IncreasePlayer2Score"):
		Player2Score += 1
		update_ui()
	if Input.is_action_just_pressed("DecreasePlayer2Score") and (Player2Score - 1) >= 0:
		Player2Score -= 1
		update_ui()
	
	if Input.is_action_just_pressed("ResetScores"):
		Player1Score = 0
		Player2Score = 0
		update_ui()
	if Input.is_action_just_pressed("SwapNames"):
		var tmp = Player1Name
		Player1Name = Player2Name
		Player2Name = tmp
		
		tmp = Player1Score
		Player1Score = Player2Score
		Player2Score = tmp
		update_ui()
	
	if Input.is_action_just_pressed("SetNameForward") and (SetIndex + 1) < len(SetsList):
		SetIndex += 1
		SetStr = SetsList[SetIndex]
		update_ui()
	if Input.is_action_just_pressed("SetNameBackward") and (SetIndex - 1) >= 0:
		SetIndex -= 1
		SetStr = SetsList[SetIndex]
		update_ui()
	
	if Input.is_action_just_pressed("OpenSettings"):
		open_settings()

func open_settings():
	get_viewport().gui_embed_subwindows = false
	SettingsWindow.visible = true
	SettingsWindow.grab_focus()

func update_ui() -> void:
	LeftName.text = Player1Name
	LeftScore.text = str(Player1Score)
	RightName.text = Player2Name
	RightScore.text = str(Player2Score)
	SetName.text = SetStr


func _on_settings_window_update_settings(p1name: String, p2name: String, p1score: int, p2score: int, setName: String) -> void:
	Player1Name = p1name
	Player2Name = p2name
	Player1Score = p1score
	Player2Score = p2score
	SetStr = setName
	update_ui()
