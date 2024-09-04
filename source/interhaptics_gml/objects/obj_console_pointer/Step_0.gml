
pressed = false
released = false
collisioning = false

for(var a = 0 ; a < 4/*gamepad_get_device_count()*/ ; a++)
if(gamepad_is_connected(a))
{
	
	if(point_distance(0,0,gamepad_axis_value(a,gp_axislh),gamepad_axis_value(a,gp_axislv))>0.05)
	{
		x += gamepad_axis_value(a,gp_axislh)*10
		y += gamepad_axis_value(a,gp_axislv)*10
	}
	
	//show_debug_message([x,y])
	
	var list = ds_list_create()
	var num = collision_point_list(x,y,all,false,true,list,false)
	
	for(var b = 0; b < num; b++)
	{
		collisioning = true
		
		with(list[|b])
		{
			if(gamepad_button_check_pressed(a, gp_face1))
			{
				pressed = true
				event_perform(ev_mouse, ev_left_press);
			}
	
			if(gamepad_button_check_released(a, gp_face1))
			{
				released = true
				event_perform(ev_mouse, ev_left_release);
			}
		}
	}
		
	ds_list_destroy(list)
}

