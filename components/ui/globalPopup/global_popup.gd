extends CanvasLayer

var transparency: float = 0
var transparencyTo: float = 0
func hidePopup():
	transparencyTo = 0
func showPopup(content: Control):
	if content.has_signal("done"):
		if "title" in content:
			$main/main/MarginContainer/Control/Label.text = content.title
		content.reparent($main/main/MarginContainer/Control/content)
		content.position = Vector2.ZERO
		transparencyTo = 1
		var data = await content.done
		transparencyTo = 0
		return data
	return
	
func _process(delta: float) -> void:
	transparency = lerp(transparency, transparencyTo, delta * 8) 
	$main/bars.modulate.a = transparency
	$main/main.modulate.a = transparency
	$main/main.size = $main/anchorTextbox.size * transparency
	$main/main.position = ( ($main/anchorTextbox.position) + ($main/anchorTextbox.size - $main/main.size) / 2 )
	if transparencyTo == 0 and transparency <= 0.001:
		var content = $main/main/MarginContainer/Control/content
		if content.get_children(): content.get_child(0).queue_free()
		hide()
	else: show()
