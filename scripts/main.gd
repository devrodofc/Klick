extends Node2D

const WIDTH := 1152.0
const HEIGHT := 648.0
const FLOOR_Y := 560.0

func _ready() -> void:
    create_floor()
    create_interface()
    queue_redraw()


func create_floor() -> void:
    var floor_body := StaticBody2D.new()
    floor_body.name = "Floor"
    floor_body.position = Vector2(WIDTH / 2.0, FLOOR_Y + 42.0)
    floor_body.collision_layer = 2
    floor_body.collision_mask = 0

    var collision := CollisionShape2D.new()
    var shape := RectangleShape2D.new()

    shape.size = Vector2(WIDTH, 84.0)
    collision.shape = shape

    floor_body.add_child(collision)
    add_child(floor_body)


func create_interface() -> void:
    var title := Label.new()
    title.text = "KLICK"
    title.position = Vector2(30, 20)
    title.add_theme_font_size_override("font_size", 36)
    title.add_theme_color_override(
        "font_color",
        Color("#292333")
    )
    title.mouse_filter = Control.MOUSE_FILTER_IGNORE
    add_child(title)

    var instructions := Label.new()
    instructions.text = "Clique, segure e arraste o bonequinho."
    instructions.position = Vector2(32, 76)
    instructions.add_theme_font_size_override("font_size", 17)
    instructions.add_theme_color_override(
        "font_color",
        Color("#847b91")
    )
    instructions.mouse_filter = Control.MOUSE_FILTER_IGNORE
    add_child(instructions)


func _draw() -> void:
    # Fundo
    draw_rect(
        Rect2(0, 0, WIDTH, HEIGHT),
        Color("#faf8ff")
    )

    # Chão
    draw_rect(
        Rect2(0, FLOOR_Y, WIDTH, HEIGHT - FLOOR_Y),
        Color("#e7def2")
    )

    # Linha do chão
    draw_line(
        Vector2(0, FLOOR_Y),
        Vector2(WIDTH, FLOOR_Y),
        Color("#332b40"),
        3.0
    )
