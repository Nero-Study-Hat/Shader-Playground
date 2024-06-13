shader_type canvas_item;

#include "res://Shaders/lib/main.gdshaderinc"

varying vec2 uv_center_rot;
varying vec2 uv_one_rot;
varying float size_mod;

void vertex() {
	vec2 uv_center = UV_new_center(UV,1.0);
	uv_center_rot = UV_transform(uv_center,vec2(0),vec2(1),TIME*50.0);
	uv_one_rot = UV_transform(uv_center,vec2(0),vec2(1),90.0+TIME*50.0);
	float animationSeconds = 2.0;
	float sineVal = 1.0 - sin((PI*2.0)*(TIME-0.75)/animationSeconds)/2.0+0.5;
	size_mod = sineVal;
}

void fragment() {
	SH_Rot_Hourglass_Adv data1 = SH_Rot_Hourglass_Adv(
		UV,
		{ uv_center_rot, uv_center_rot, uv_center_rot, uv_center_rot },
		{ uv_center_rot, uv_center_rot },
		size_mod
	);
	vec4 hourglass1 = SH_new_rot_hourglass_adv(data1);
	
	SH_Rot_Hourglass_Adv data2 = SH_Rot_Hourglass_Adv(
		UV,
		{ uv_one_rot, uv_one_rot, uv_one_rot, uv_one_rot },
		{ uv_one_rot, uv_one_rot },
		size_mod
	);
	vec4 hourglass2 = SH_new_rot_hourglass_adv(data2);

	COLOR = hourglass2;
	
	if(hourglass2.r > 1.0)
	{
		COLOR = hourglass1;
	}
}

