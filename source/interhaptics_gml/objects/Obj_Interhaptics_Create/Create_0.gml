
event_inherited();

text = "Create"

array = []

function array_positions_refresh()
{
	for(var a = 0 ; a < array_length(array) ; a++)
	{
		array[a].x = 1000
		array[a].y = 200+100*a
		array[a].child.x = array[a].bbox_right + 60
		array[a].child.y = array[a].y
	}
}
