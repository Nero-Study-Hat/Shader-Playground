shader_type canvas_item;

#include "res://Shaders/lib/main.gdshaderinc"

varying vec2 uv_center_rot;
varying vec2 uv_one_rot;
varying float size_mod;

void vertex() {
	uv_center_rot = new_uv_from_center(UV,0,0,TIME*50.0);
	uv_one_rot = new_uv_from_center(UV,0,0,90.0+TIME*50.0);
	float animationSeconds = 2.0;
	float sineVal = 1.0 - sin((PI*2.0)*(TIME-0.75)/animationSeconds)/2.0+0.5;
	size_mod = sineVal;
}

void fragment() {
	vec2 circle_uv_arr1[4] = { uv_center_rot, uv_center_rot, uv_center_rot, uv_center_rot };
	vec2 rect_uv_arr1[2] = { uv_center_rot, uv_center_rot };
	vec4 hourglass1 = new_rot_hourglass(UV,circle_uv_arr1, rect_uv_arr1,size_mod);
	
	vec2 circle_uv_arr2[4] = { uv_one_rot, uv_one_rot, uv_one_rot, uv_one_rot };
	vec2 rect_uv_arr2[2] = { uv_one_rot, uv_one_rot };
	vec4 hourglass2 = new_rot_hourglass(UV,circle_uv_arr2, rect_uv_arr2, size_mod);

	COLOR = hourglass2;
	
	if(hourglass2.r > 1.0)
	{
		COLOR = hourglass1;
	}
}

