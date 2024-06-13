#include "math.gdshaderinc"

vec2 UV_new_center(vec2 default_uv, float aspect_ratio)
{
	vec2 flipped_uv = vec2(default_uv.x, 1.0 - default_uv.y);
	vec2 uv_center = 2.0 * flipped_uv - 1.0;
	uv_center.x *= aspect_ratio; // resolution.x / resolution.y
	return uv_center;
}

vec2 UV_transform(vec2 input_uv, vec2 offset, vec2 scale, float rotation_deg)
{
	if(scale == vec2(0)) scale = vec2(1);
	vec2 initial = (input_uv + offset) * scale;
	vec2 final = MTH_rotate_vec2(initial, rotation_deg);
	return final;
}