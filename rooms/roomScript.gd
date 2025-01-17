extends Node2D
class_name Room

@onready var start : Marker2D = $StartingPad
@onready var ending_pad: Node2D = $EndingPad
@onready var player: CharacterBody2D = $Player
@onready var coins: Node2D = $coins
@onready var displayed_coins: Label = $GUI/displayed_coins
@onready var displayed_level: Label = $GUI/displayed_level

@export var roomNumber : int
var coinCount : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.position = start.position
	coinCount = 0
	for coin in coins.get_children():
		coin.connect("collect",collectCoint)
		coinCount += 1
	if coinCount == 0:
		ending_pad.monitoring = true
		displayed_coins.text = str(coinCount)
		displayed_level.text = str(roomNumber)
	print(coinCount)
	print("yes")

func goNextRoom():
	get_tree().change_scene_to_file("res://rooms/room"+str(roomNumber)+".tscn")
func collectCoint():
	coinCount -= 1
	if coinCount == 0:
		ending_pad.monitoring = true
