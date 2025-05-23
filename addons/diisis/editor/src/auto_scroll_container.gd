@tool
extends ScrollContainer

var max_scroll_length = 0
@onready var scrollbar = get_v_scroll_bar()

func _ready() -> void:
	# auto scrolling
	scrollbar.connect("changed", handle_scrollbar_changed)
	max_scroll_length = scrollbar.max_value

func handle_scrollbar_changed():
	if max_scroll_length != scrollbar.max_value:
		max_scroll_length = scrollbar.max_value
		
		if get_child(0) is CodeEdit:
			scroll_vertical = get_child(0).get_caret_draw_pos().y + global_position.y
		scroll_vertical = max_scroll_length
