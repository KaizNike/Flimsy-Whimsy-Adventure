extends Control

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
var scene_str = "0"
var scene = 0
var text: String = ""
var option1: String = ""
var option2: String = ""
var option3: String = ""
var option4: String = ""
var inv = []
var inv_str: String = "[]"

var loops = {"pie": 0}
var starting = true

func init_text():
	$DebugScene.set_text(scene_str)
	$DebugInv.set_text(inv_str)
	$GameTextLabel.set_text(text)
	$OptionOneButton.set_text(option1)
	$OptionTwoButton.set_text(option2)
	$OptionThreeButton.set_text(option3)
	$OptionFourButton.set_text(option4)
	
func clear_text():
	text = ""
	option1 = ""
	option2 = ""
	option3 = ""
	option4 = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$BackButton.grab_focus()
	TTS.stop()
#	TTS.speak("You are playing a short adventure, if you'd like to contribute writings see the Github link. "+text+" option 1 "+option1+" option 2 "+option2+" option 3 "+option3+" option 4 "+option4)
#	if Automain.debug == false:
#		$DebugInv.visible = false
#		$DebugScene.visible = false
	if Automain.gotoScene != 0:
		scene = Automain.gotoScene
		game()
		return
	game()
	
	#pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func game():
	scene_str = str(scene)
	clear_text()
	# You grab a pie
	if scene == 0:
		text = "You see a pie on the ground. What do you do?"
		option1 = "Grab the pie"
		option2 = "Eat the pie"
		option3 = "Give the pie away"
		option4 = "Place pie on windowsill"
		init_text()
		scene = 1
	if scene == 2:
#		scene_str = "2"
#		inv += 1
		inv.push_back("pie")
#		inv.push_back("cake")
#		inv.push_back("baked good")
		inv_str = str(inv)
		text = "You grab the pie, carrying it in your mighty arms. A goblin hassles you, what do you do?"
		option1 = "Give him the pie"
		option2 = "Eat the pie in his face"
		option3 = "Steal the goblin"
		option4 = "Ask Directions"
		init_text()
	# You eat a pie
	if scene == 3:
#		scene_str = "3"
		text = "You eat all of the pie at once, it tastes of chestnuts and raisins, your favorite. There is now a sad goblin in front of you, what do you do?"
		option1 = "Tell the goblin a story"
		option2 = "Fight the goblin"
		option3 = "Steal the goblin"
		option4 = "Ask Directions"
		init_text()
	# You give the pie away
	if scene == 4:
#		scene_str = "4"
		text = "You decide to give away the pie to someone in need, this goblin here seems to be hungry so you give it to them. In joyous thanks the goblin gives you directions. It tells you of a castle to the south, a city to the north, a swamp of misery to the west and a magic fountain to the east. It highly recommends the fountain."
		option1 = "Go North"
		option2 = "Go South"
		option3 = "Go West"
		option4 = "Go East"
		init_text()
	# Place pie on windowsill
	# op1 - Pie Loop
	if scene == 5:
#		scene_str = "5"
		text = "You place the pie on the windowsill, where it belongs, it shines a magnificent light. YOU ARE DEAD, RETURN TO MENU."
		option1 = "Get back up, you aren't dead"
#		option2 = ""
#		option3 = ""
#		option4 = ""
		init_text()
	if scene == 6:
		text = "How silly of me. Anyways, after admiring a well placed pie, you head off on a random direction."
		option1 = "Go off"
		init_text()
	# Exit Pie loop
	if scene == 7:
		text = "There is a fork in the path you just took..."
		option1 = "Neither"
		if loops.pie > 7:
			option2 = "Go up, of course"
		init_text()
	# Pie loop grow
	if scene == 8:
		text = "You pick neither back and instead head back to the glorious pie on the windowsill."
		option1 = "I want to go on an adventure"
		loops.pie += 1
		init_text()
		
	# In heaven
	if scene == 100:
		text = "You arrive in the Heavens, now what?"
		option1 = "Visit God"
		option2 = "Slide into hell"
		option3 = "Climb Olympus"
		option4 = "Rise even higher"
	# Visiting God
	if scene == 101:
		pass
	# To hell
	if scene == 102:
		text = ""
	TTS.speak(text+" option 1 "+option1+" option 2 "+option2+" option 3 "+option3+" option 4 "+option4)



func _on_BackButton_pressed() -> void:
	get_tree().change_scene("res://src/HUD/Start.tscn")


func _on_OptionOneButton_pressed() -> void:
	# Grab the pie
	if scene == 1:
		scene = 2
		game()
#	Not dead
	elif scene == 5:
		scene = 6
		game()


func _on_OptionTwoButton_pressed() -> void:
	# "Eat the pie"
	if scene == 1:
		scene = 3
		game()


func _on_OptionThreeButton_pressed() -> void:
	# Give the pie away
	if scene == 1:
		scene = 4
		game()


func _on_OptionFourButton_pressed() -> void:
	# Place pie on windowsill
	if scene == 1:
		scene = 5
		game()


func _on_debug_on():
	print("Debug is now on")
