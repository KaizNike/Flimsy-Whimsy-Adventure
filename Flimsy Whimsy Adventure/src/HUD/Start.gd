extends Control

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$GameNameLabel.grab_focus()
	Automain.scene_change("mainmenu")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_StartButton_pressed() -> void:
	#print("New Game Pressed!")		#Works
	get_tree().change_scene("res://src/HUD/Game.tscn")


func _on_OptionsButton_pressed() -> void:
	get_tree().change_scene("res://src/Options/Options.tscn")


func _on_HelpButton_pressed() -> void:
	get_tree().change_scene("res://src/Help/Help.tscn")


func _on_QuitButton_pressed() -> void:
	get_tree().quit()
