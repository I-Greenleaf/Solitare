extends TextureRect
# Flipping animation following tutorial at https://justincalleja.com/blog/posts/godot-card-flipping
# Card colors: blue and purple, not red and black; per request of girlfriend

@onready var ap: AnimationPlayer = $AnimationPlayer

var is_face_up = false
@export var front_texture: Texture
@export var back_texture: Texture

signal card_pressed()



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pivot_offset = Vector2(size.x * 0.5, 0)
	set_the_texture()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


# "_the_" is added as set_texture() cannot be overided
func set_the_texture(a_texture = null):
	if a_texture == null:
		texture = front_texture if is_face_up else back_texture
	else:
		texture = a_texture


func flip_texture():
	is_face_up = !is_face_up
	set_the_texture()


func flip():
	ap.play("flip")

# Function for clickable cards only
# Sends out signal when the button/card is pressed
func _on_button_pressed() -> void:
	emit_signal("card_pressed")
