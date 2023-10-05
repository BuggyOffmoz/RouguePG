extends Camera2D





func move_camera(rigth: bool,aux):
	if rigth:
		self.global_position = $"../menuUi_position".global_position
	else:
		self.global_position = aux
