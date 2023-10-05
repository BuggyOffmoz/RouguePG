extends Node

# CONSTANTES QUE DEFINEN EL PATH PARA ARCHIVOS DE GUARDADO
const options_save_files_path = "user://save_config.save"


var pj: CharacterBody2D

# LOS DATOS QUE VOY A ESTAR MODIFICANDO Y CARGANDO
var options_data_array = {
	"RESOLUTION_X" = 1280,
	"RESOLUTION_Y" = 720,
	"MUSIC_VOLUMEN" = 100, 
	"FPS" = 60
}


var internal_data_save = {
	"ENTERED_DOOR" : 1,
	"IS_LIFE_SAVED" : false,
	"ACTUAL_LIFE" : 0,
	"ACTUAL_WEAPON": 0
}

func _ready():
	load_options_game()


func auto_internal_save():
	internal_data_save.ENTERED_DOOR = 1
	internal_data_save.IS_LIFE_SAVED = false
	internal_data_save.ACTUAL_WEAPON = 0
	internal_data_save.ACTUAL_LIFE = 0


func load_options_game():
	aplicate_options_saves()
	var file = FileAccess.open(options_save_files_path,FileAccess.READ)
	if file == null:
		save_options_game()
	else:
		options_data_array = file.get_var()
	
	save_options_game()
	file = null
	aplicate_options_saves()



func save_options_game():
	var file = FileAccess.open(options_save_files_path,FileAccess.WRITE)
	file.store_var(options_data_array)
	file = null


func aplicate_options_saves():
	get_window().size = Vector2(options_data_array.RESOLUTION_X,options_data_array.RESOLUTION_Y)
	Engine.max_fps = int(options_data_array.FPS)


func internal_save(id: String,aux):
	internal_data_save.id = aux


