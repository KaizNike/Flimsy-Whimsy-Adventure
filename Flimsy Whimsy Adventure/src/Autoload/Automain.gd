extends Node

var debug = false
var sound = true
var music = true
var gotoScene: int = 0
var currentScene setget scene_change

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func scene_change(new_scene):
	if new_scene == "mainmenu":
		$elevator.play()
	pass
