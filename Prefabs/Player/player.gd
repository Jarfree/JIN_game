extends CharacterBody3D

# Character Stats  -------------------------------------------------------------

# Player Stats: set parameters and start values
var maxExp = 1000
var exp = 0
var maxHealth = 50
var health = 10
var speed = 5
var meleeDmg = 4
var rangeDmg = 7
var jumpVelocity = 4.5
var hasCompanion = false
var level = 1

var PlayerData = {
	"EXP" :  exp,
	"MaxHealth" : maxHealth, 
	"Health" : health, 
	"Speed" : speed,
	"Melee" : meleeDmg,
	"Range" : rangeDmg,
	"JumpVelocity" : jumpVelocity,
	"HasCompanion" : hasCompanion,
	"Level" : level,
}

# General Function -------------------------------------------------------------

# Init : called when the note enters the scene tree for the first time
func _ready():
	print("Player Ready!")
	# connect all signals from the SignalBus file
	SignalBus._increase_player_health.connect(_on_increase_player_health)
	SignalBus._decrease_player_health.connect(_on_decrease_player_health)

# PLAYER HEALTH: ---------------------------------------------------------------

func _on_increase_player_health(HealthAmount):
	set_plyr_health(health + HealthAmount)

func _on_decrease_player_health(DamageAmount):
	set_plyr_health(health - DamageAmount)

func player_died():
	emit_signal("plyr_killed")
	print("you died!")
	#TODO: end game or reduce lives & respawn

func set_plyr_health(value):
	var prevHealth = health  
	health = clamp(value, 0, maxHealth )
	if health != prevHealth:
		PlayerData["Health"] = health
		print("health:  ", health)
		if health == 0:
			player_died()

# Character Conrtoller  --------------------------------------------------------
func _physics_process(delta: float) -> void:
	# TODO: make gravity feel less moony/floaty
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jumpVelocity 

	# Get the input direction and handle the movement/deceleration.
	# go to Project > Settings > UIInput to add keybindings to ui_left etc
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)

	move_and_slide()

### Tick : called every frame
##func _process(delta: float):
	##pass
