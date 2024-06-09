#include "uvs.gdshaderinc"

vec4 new_circle(vec2[4] uv, float size_modifier)
{
	vec3 x = vec3(uv[0].x * size_modifier * uv[1].x * size_modifier);
	vec3 y = vec3(uv[2].y * size_modifier * uv[3].y * size_modifier);
	return vec4(2.0*x + 2.0*y,1);
}
vec4 new_rectangle(vec2[2] uv, float size_modifier, bool horizontal)
{
	vec3 y = vec3(uv[0].y * size_modifier * uv[1].y * size_modifier);
	return vec4(4.0 * y,1);
}

vec4 new_rot_hourglass(vec2 default_uv, vec2[4] circle_uv, vec2[2] rect_uv, float size_modifier)
{
	vec2 uv_center = new_uv_from_center(default_uv,0,0,0);
	vec4 circle = new_circle(circle_uv, size_modifier);
	vec4 rectangle = new_rectangle(rect_uv,size_modifier,true);
	vec4 hourglass = circle / rectangle + circle;
	return hourglass;
}