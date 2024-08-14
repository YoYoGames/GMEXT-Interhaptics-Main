
event_inherited()

array = []

var file_name = file_find_first(working_directory + "/HapticMaterials/*.haps", 0);
if(file_name != "")
	array_push(array, string_delete(file_name,string_length(file_name)-4,5));

while(true)
{
	file_name = file_find_next();
	
	if(file_name == "")
		break
	
    array_push(array, string_delete(file_name,string_length(file_name)-4,5));
}

file_find_close();

text_group = "File"
