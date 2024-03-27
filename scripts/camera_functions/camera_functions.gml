function camera_init(){
	properties = {
		aspect_ratio_h : 16,				//horizontal factor of the resolution
		aspect_ratio_v : 9,					//vertical factor of the resolution
		zoom_level : 100, 					//Default zoom level for camera, higher means further away, lower means closer.
		zoom_increment : 20,				//How far to move the camera for each step of zooming in/out
		zoom_min : 20,						//The closest you can zoom in. For best results, use a multiple of the increment. 
		zoom_max : 300,						//The furthest you can zoom in. For best results, use a multiple of the increment. 
		zoom_speed : 15,					//how fast to adjust zoom. 100 means instant, 50 means half speed, 1 means zooming goes slowly. 
		//object_following : obj_character,	//The object the camera follows. 
		tracking_speed : 15,				//How fast the camera follows the object. 100 means instant, 1 means it will drift VERY slowly. 
		camera_restrained : false,			//Can the camera move beyond the edges of the playfield?
		window_scale : 1.0					//The size of the game window. For wider aspect ratios, this is more impactful than for ones close to square. 
	};

	zoom_divisor = (properties.zoom_speed/100);
	tracking_divisor = (properties.tracking_speed/100);
	view_width	= properties.aspect_ratio_h * properties.zoom_level;
	view_height = properties.aspect_ratio_v * properties.zoom_level;
	
	view_width_target = view_width;
	view_height_target = view_height;
	

	window_width = view_width*properties.window_scale;
	window_height = view_height*properties.window_scale;
	
	window_set_size(window_width,window_height);
	surface_resize(application_surface,window_width,window_height);
	window_center();
}

function camera_update(){
	camera_set_zoom();
	camera_set_view_size(view_camera[0],view_width,view_height);
}

function zoom_in(){
	if properties.zoom_level > properties.zoom_min
		properties.zoom_level -= properties.zoom_increment;
	else
		properties.zoom_level = properties.zoom_min;
}

function zoom_out(){
	if properties.zoom_level < properties.zoom_max
		properties.zoom_level += properties.zoom_increment;
	else
		properties.zoom_level = properties.zoom_max;
}

function camera_set_zoom(){
	view_width_target = properties.aspect_ratio_h*properties.zoom_level;
	view_height_target = properties.aspect_ratio_v*properties.zoom_level;

	//Smoothly adjust zoom level to the target zoom level		
	if (view_width != view_width_target and view_height != view_height_target){
		view_width = lerp(view_width,view_width_target,zoom_divisor);
		view_height = lerp(view_height,view_height_target,zoom_divisor);
	}
}

function keep_in_room(){
	x = clamp(x, 0, room_width-view_width);
	y = clamp(y, 0, room_height-view_height);
}

function enable_view(){
	view_enabled = true;
	view_visible[0] = true;
}