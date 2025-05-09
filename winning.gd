extends Area2D
var countdown = false
const maxTime = 30
var currentTime = 30

func _process(delta: float) -> void:
	if countdown and currentTime > 0:
		currentTime-=delta

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("gold"): # Replace with function body.
		countdown = true
	if body.is_in_group("car") and countdown:
		get_tree().get_first_node_in_group("winscreen").visible= true
		countdown = false
