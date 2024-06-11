#include "uvs.gdshaderinc"

// Circle
vec4 SH_new_circle_flat(vec2 circle_center_uv, float radius, vec4 current_color)
{
	if(length(circle_center_uv) < radius)
	{
		current_color = vec4(1.0);
	}
	return current_color;
}

vec4 SH_new_circle(vec2 uv, float size_modifier)
{
	vec3 x = vec3(uv.x * size_modifier * uv.x * size_modifier);
	vec3 y = vec3(uv.y * size_modifier * uv.y * size_modifier);
	return vec4(2.0*x + 2.0*y,1);
}

vec4 SH_new_circle_adv(vec2[4] uv, float size_modifier)
{
	vec3 x = vec3(uv[0].x * size_modifier * uv[1].x * size_modifier);
	vec3 y = vec3(uv[2].y * size_modifier * uv[3].y * size_modifier);
	return vec4(2.0*x + 2.0*y,1);
}

// Rectanlge

vec4 SH_new_rectangle(vec2 uv, float size_modifier, bool horizontal)
{
	vec3 y = vec3(uv.y * size_modifier * uv.y * size_modifier);
	return vec4(4.0 * y,1);
}

vec4 SH_new_rectangle_adv(vec2[2] uv, float size_modifier, bool horizontal)
{
	vec3 y = vec3(uv[0].y * size_modifier * uv[1].y * size_modifier);
	return vec4(4.0 * y,1);
}

//
// More Complex Shapes
//

struct SH_Rot_Hourglass_Adv
{
	vec2 default_uv;
	vec2[4] circle_uv;
	vec2[2] rect_uv;
	float size_modifier;
};

vec4 SH_new_rot_hourglass_adv(SH_Rot_Hourglass_Adv data)
{
	vec2 uv_center = UV_generate_from_center(data.default_uv,vec2(0),vec2(0),0);
	vec4 circle = SH_new_circle_adv(data.circle_uv, data.size_modifier);
	vec4 rectangle = SH_new_rectangle_adv(data.rect_uv,data.size_modifier,true);
	vec4 hourglass = circle / rectangle + circle;
	return hourglass;
}