extends CharacterBody2D

# Configurações físicas
@export var gravity: float = 1600.0
@export var follow_strength: float = 18.0
@export var max_drag_speed: float = 1300.0
@export var max_lift_height: float = 180.0
@export var friction: float = 900.0

# Estado
var dragging: bool = false
var block_until_release: bool = false

var grab_start_y: float = 0.0
var grab_offset: Vector2 = Vector2.ZERO


func _input(event: InputEvent) -> void:
    if event is InputEventMouseButton:
        if event.button_index == MOUSE_BUTTON_LEFT:

            if event.pressed:
                try_grab()

            else:
                dragging = false
                block_until_release = false


func try_grab() -> void:
    if block_until_release:
        return

    var mouse_position := get_global_mouse_position()
    var local_mouse := to_local(mouse_position)

    var grab_area := Rect2(
        Vector2(-28, -42),
        Vector2(56, 82)
    )

    if grab_area.has_point(local_mouse):
        dragging = true
        grab_start_y = global_position.y
        grab_offset = global_position - mouse_position
        velocity = Vector2.ZERO


func _physics_process(delta: float) -> void:

    if dragging:
        move_with_mouse()

    else:
        apply_gravity(delta)

    move_and_slide()

    if dragging:
        check_height_limit()

    queue_redraw()


func move_with_mouse() -> void:
    var target := get_global_mouse_position() + grab_offset

    # Impede que o personagem saia pelas laterais.
    var screen_width := get_viewport_rect().size.x

    target.x = clampf(
        target.x,
        35.0,
        screen_width - 35.0
    )

    var direction := target - global_position

    velocity = direction * follow_strength
    velocity = velocity.limit_length(max_drag_speed)


func apply_gravity(delta: float) -> void:
    velocity.y += gravity * delta

    velocity.x = move_toward(
        velocity.x,
        0.0,
        friction * delta
    )


func check_height_limit() -> void:
    var lifted_height := grab_start_y - global_position.y

    if lifted_height >= max_lift_height:
        dragging = false
        block_until_release = true

        velocity = Vector2.ZERO


func _draw() -> void:
    var ink := Color("#292333")

    # Cabeça
    draw_arc(
        Vector2(0, -23),
        10.0,
        0.0,
        TAU,
        32,
        ink,
        3.0,
        true
    )

    # Corpo
    draw_line(
        Vector2(0, -13),
        Vector2(0, 8),
        ink,
        3.0,
        true
    )

    # Braço esquerdo
    draw_line(
        Vector2(0, -7),
        Vector2(-16, 2),
        ink,
        3.0,
        true
    )

    # Braço direito
    draw_line(
        Vector2(0, -7),
        Vector2(16, 2),
        ink,
        3.0,
        true
    )

    # Perna esquerda
    draw_line(
        Vector2(0, 8),
        Vector2(-12, 30),
        ink,
        3.0,
        true
    )

    # Perna direita
    draw_line(
        Vector2(0, 8),
        Vector2(12, 30),
        ink,
        3.0,
        true
    )

    # Feedback visual enquanto arrasta
    if dragging:
        draw_arc(
            Vector2.ZERO,
            43.0,
            0.0,
            TAU,
            48,
            Color(0.55, 0.4, 0.8, 0.25),
            2.0,
            true
        )
