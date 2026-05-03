extends CharacterBody2D
@onready var animSprite = $AnimatedSprite2D

var maxSpeed := 200
var accel := 25
var frict := 10
var dir := Vector2.ZERO
var lastDir := Vector2(1, 1)
var attackMode := false
var attackNum := 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	dir = Input.get_vector("left", "right", "up", "down")
	if dir != Vector2.ZERO && lastDir != dir:
		lastDir = dir
	attack()
	if attackMode:
		dir = Vector2.ZERO
	run(delta)
	move_and_slide()

func run(delta: float) -> void:
	var vWeight = Vector2.ZERO
	if dir:
		vWeight = delta * accel
		animate(dir, "run")
	else:
		vWeight = delta * frict
		if !attackMode:
			animate(lastDir, "idle")
	velocity = lerp(velocity, dir * maxSpeed, vWeight)

func animate(animDir: Vector2, type: String) -> void:
	var append := ""
	if animDir.y > 0:
		append += "d"
	elif animDir.y < 0:
		append += "u"
	if animDir.x > 0 :
		append += "r"
	elif animDir.x < 0:
		append += "l"
	animSprite.play(type + append)


func _on_animated_sprite_2d_animation_finished() -> void:
	if animSprite.animation.contains("attack"):
		attackMode = false

func attack() -> void:
	if Input.is_action_just_pressed("attack") && !attackMode:
		attackMode = true
		animate(lastDir, "attack" + str(attackNum + 1))
		#attackNum = 1 - attackNum
		dir = Vector2.ZERO
