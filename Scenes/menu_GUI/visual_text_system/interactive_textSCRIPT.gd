extends CanvasLayer


func _input(event):
	
	if event is InputEventMouseButton:
		disappear_text()
	
#	if event is InputEventKey:
#		if event.is_action_pressed("exit_button"):
#			pass
#		elif event.is_action_released("exit_button") or event.is_action_released("E"):
#			pass
#		elif event.is_echo():
#			pass
#		else:
#			disappear_text()



func appear_text():
	$".".visible = true
	animated_text()

func animated_text():
	$animation.play("idle_text")


func add_text(text_aux: String,mode_int: int):
	$RichTextLabel.text = text_aux
	appear_text()
	get_tree().paused = true


func disappear_text():
	$".".visible = false
	get_tree().paused = false
