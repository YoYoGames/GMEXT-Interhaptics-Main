
event_inherited()

array = []

var _filename = file_find_first(working_directory + "/HapticMaterials/*.haps", fa_none);
if(_filename != "") {
	array_push(array, string_delete(_filename,string_length(_filename)-4,5));
}

while(true) {
	_filename = file_find_next();
	
	if(_filename == "")
		break
	
    array_push(array, string_delete(_filename,string_length(_filename)-4,5));
}

file_find_close();

text_group = "File"
