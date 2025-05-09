extends Area2D
var countdown = false
const maxTime = 30
var currentTime = 5
var winScreen:CanvasLayer
var timer:Label
var loseScreen: CanvasLayer

func _ready() -> void:
	winScreen = get_tree().get_first_node_in_group("winscreen")
	timer = get_tree().get_first_node_in_group("timer")
	loseScreen = get_tree().get_first_node_in_group("losescreen")
func _process(delta: float) -> void:
	if countdown and currentTime > 0:
		currentTime-=delta
		if currentTime < 0:
			currentTime = 0
		timer.text = "the cops will arrive in : "+str(int(currentTime))+" seconds"
	if not countdown:
		timer.text = ""
	if currentTime == 0:
		loseScreen.visible = true
		timer.visible = false
		

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("gold"): # Replace with function body.
		countdown = true
	if body.is_in_group("car") and countdown:
		get_tree().get_first_node_in_group("winscreen").visible= true
		countdown = false
