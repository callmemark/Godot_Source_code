extends Node


const SAVE_DIR = "user://settings_directory/"
var save_path = SAVE_DIR + "save.dat"

var settings_data_dict
var saved_settings_config
var global_var



func _ready():
	global_var = get_node("/root/GlobalVariables")



func SaveData(data_to_save):
	
	var setting_data_directory = Directory.new()
	if !setting_data_directory.dir_exists(SAVE_DIR):
		setting_data_directory.make_dir_recursive(SAVE_DIR)
		
	var settings_file = File.new()
	var error = settings_file.open(save_path, File.WRITE)
	if error == OK:
		settings_file.store_var(data_to_save)
		settings_file.close()
	else:
		print("error saving file")



func LoadData():
	var setting_file = File.new()
	if setting_file.file_exists(save_path):
		var error = setting_file.open(save_path, File.READ)
		if error == OK:
			saved_settings_config = setting_file.get_var()
			setting_file.close()
			
			settings_data_dict = saved_settings_config
			
			return settings_data_dict
