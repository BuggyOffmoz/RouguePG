extends Control

@onready var option_resolution_button = get_node("OptionResolutionButton")
@onready var option_limit_fps_button = get_node("OptionFpsButton")



# VARIABLES INT-----------------------------------------------------------------
var resolution_x: int = 0
var resolution_y: int = 0
var fps_max: int = 0
var music_volume: int = 0

var old_resolution_x: int = 0
var old_resolution_y: int = 0
var old_fps_max: int = 0
var old_music_volume: int = 0

# VARIABLES BOOLEAN-------------------------------------------------------------
var saved = true

# VARIABLES ARRAY---------------------------------------------------------------
var all_options_button = [
	"OptionResolutionButton",
	"OptionFpsButton",
	"save_button",
	"exit",
	"HSlider"
]


func _ready():
	add_items()
	load_options()
	


func load_options():
	resolution_x = SaveClass.options_data_array.RESOLUTION_X
	resolution_y = SaveClass.options_data_array.RESOLUTION_Y
	fps_max = SaveClass.options_data_array.FPS
	music_volume = SaveClass.options_data_array.MUSIC_VOLUMEN
	
	old_resolution_x = resolution_x
	old_resolution_y = resolution_y
	old_fps_max = fps_max
	old_music_volume = music_volume
	adjust_options()

func adjust_options():
	match  resolution_x:
		1280:
			option_resolution_button.select(0)
		1366:
			option_resolution_button.select(1)
		1600:
			option_resolution_button.select(2)
		1920:
			option_resolution_button.select(3)

	match fps_max:
		30:
			option_limit_fps_button.select(0)
		60:
			option_limit_fps_button.select(1)
		240:
			option_limit_fps_button.select(2)
	
	$HSlider/amount_music_volume.text = str(music_volume)
	$HSlider.set_value_no_signal(music_volume)

func add_items():
	add_items_in_resolution_bar()
	add_items_in_fps_limit()

func add_items_in_resolution_bar():
	option_resolution_button.add_item("1280 x 720") 
	option_resolution_button.add_item("1366 x 768")
	option_resolution_button.add_item("1600 x 900")
	option_resolution_button.add_item("1920 x 1080")


func add_items_in_fps_limit():
	option_limit_fps_button.add_item("30")
	option_limit_fps_button.add_item("60")
	option_limit_fps_button.add_item("240")


func reset_to_old_options():
	resolution_x = old_resolution_x
	resolution_y = old_resolution_y
	fps_max = old_fps_max
	music_volume = old_music_volume


func apply_options():
	get_window().size = Vector2(resolution_x,resolution_y)
	Engine.max_fps = fps_max
	


func disabled_buttons():
	for i in range(0,all_options_button.size() - 1):
		var aux = get_node(all_options_button[i])
		aux.disabled = true
	$HSlider.editable = false
func enabled_buttons():
	for i in range(0,all_options_button.size() - 1):
		var aux = get_node(all_options_button[i])
		aux.disabled = false
	$HSlider.editable = true




# SIGNALS-----------------------------------------------------------------------

func _on_option_button_item_selected(index):
	saved = false
	match index:
		0:
			get_window().size = Vector2(1280,720)
			resolution_x = 1280
			resolution_y = 720
		1:
			get_window().size = Vector2(1366,768)
			resolution_x = 1366
			resolution_y = 768
		2:
			get_window().size = Vector2(1600,900)
			resolution_x = 1600
			resolution_y = 900
		3:
			get_window().size = Vector2(1920,1080)
			resolution_x = 1920
			resolution_y = 1080


func _on_option_fps_button_item_selected(index):
	saved = false
	match index:
		0:
			Engine.max_fps = 30
			fps_max = 30
		1:
			Engine.max_fps = 60
			fps_max = 60
		2:
			Engine.max_fps = 240
			fps_max = 240



func _on_h_slider_value_changed(value):
	saved = false
	$HSlider/amount_music_volume.text = str(value)
	music_volume = int(value)


func _on_save_button_pressed():
	SaveClass.options_data_array.RESOLUTION_X = resolution_x
	SaveClass.options_data_array.RESOLUTION_Y = resolution_y
	SaveClass.options_data_array.FPS = fps_max
	SaveClass.options_data_array.MUSIC_VOLUMEN = music_volume
	SaveClass.save_options_game()
	
	saved = true


func _on_exit_pressed():
	if saved == true:
		get_tree().call_group("main_menu_group","in_option_false")
		self.queue_free()
	elif saved == false:
		disabled_buttons()
		$popUP.visible = true


func _on_back_pressed():
	$popUP.visible = false
	enabled_buttons()


func _on_save_and_exit_pressed():
	SaveClass.options_data_array.RESOLUTION_X = resolution_x
	SaveClass.options_data_array.RESOLUTION_Y = resolution_y
	SaveClass.options_data_array.FPS = fps_max
	SaveClass.options_data_array.MUSIC_VOLUMEN = music_volume
	SaveClass.save_options_game()
	saved = true
	$popUP.visible = false
	get_tree().call_group("main_menu_group","in_option_false")
	$".".queue_free()


func _on_dont_save_exit_pressed():
	reset_to_old_options()
	apply_options()
	$popUP.visible = false
	get_tree().call_group("main_menu_group","in_option_false")
	$".".queue_free()
