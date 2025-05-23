extends TextureRect

func _ready() -> void:
	visible = true

func start():
	var logo : TextureRect = $TextureRect
	var t = create_tween()
	t.tween_property(logo, "modulate:a", 0, 10).set_delay(4).set_ease(Tween.EASE_IN)
	t.tween_property(self, "modulate:a", 0, 5).set_delay(2)
	t.finished.connect(set.bind("visible", false))
	t.finished.connect(Parser.function_acceded)
