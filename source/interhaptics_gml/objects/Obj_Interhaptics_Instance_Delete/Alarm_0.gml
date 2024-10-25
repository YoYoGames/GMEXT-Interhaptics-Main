instance_destroy()
instance_destroy(owner)


var _id = owner

with(obj_interhaptics_create)
{
	show_debug_message(array)
	for(var a = 0 ; a < array_length(array) ; a++)
	{
		if(_id == array[a])
		{
			array_delete(array,a,1)
			break
		}
	}
	show_debug_message(array)
	array_positions_refresh()
}
