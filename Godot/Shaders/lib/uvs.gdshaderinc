#include "math.gdshaderinc"

vec2 UV_generate_from_center(vec2 default_uv, vec2 offset, vec2 scale, float rotation_deg)
{
	vec2 flipped_uv = vec2(default_uv.x, 1.0 - default_uv.y);
	vec2 uv_center = 2.0 * flipped_uv - 1.0;
	vec2 initial = (uv_center + offset) * scale;
	vec2 final = MTH_rotate_vec2(initial, rotation_deg);
	return final;
}