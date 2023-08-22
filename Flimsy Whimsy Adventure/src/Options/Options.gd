extends Control

signal music_on
signal music_off

signal debug_on
signal debug_off

signal sound_on
signal sound_off

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$BackButton.grab_focus()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_BackButton_pressed() -> void:
	get_tree().change_scene("res://src/HUD/Start.tscn")


func _on_MusicCheck_toggled(button_pressed: bool) -> void:
	if button_pressed == true:
		Automain.music = true
		TTS.speak("Music on.")
		print("Music " + str(Automain.music))
	if button_pressed == false:
		Automain.music = false
		TTS.speak("Music off.")
		print("Music " + str(Automain.music))


func _on_SoundCheck_toggled(button_pressed: bool) -> void:
	if button_pressed == true:
		Automain.sound = true
		TTS.speak("Sound returned.")
		print("Sound " + str(Automain.sound))
	if button_pressed == false:
		Automain.sound = false
		print("Sound " + str(Automain.sound))
	

func _on_DebugCheck_toggled(button_pressed: bool) -> void:
	if button_pressed == true:
		Automain.debug = true
		TTS.speak("Debug mode on.")
		print("Debug " + str(Automain.debug))
		
#		emit_signal("debug_on")
	if button_pressed == false:
		Automain.debug = false
		TTS.speak("Debug mode off.")
		print("Debug " + str(Automain.debug))





func _on_VoiceCheck_toggled(button_pressed):
	TTS.muted = !TTS.muted
	if TTS.muted == false:
		TTS.speak("Voice returned.")
	pass # Replace with function body.
