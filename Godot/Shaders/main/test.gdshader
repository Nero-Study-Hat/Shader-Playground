shader_type canvas_item;

#include "res://Shaders/lib/main.gdshaderinc"

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 uv_center = new_uv_from_center(UV,0,0,0);
	float size_modifier = 1.0 - 0.0;
	vec3 x = vec3(uv_center.x * size_modifier * uv_center.x * size_modifier);
	vec3 y = vec3(uv_center.y * size_modifier * uv_center.y * size_modifier);
	vec4 circle = vec4(2.0*x + 2.0*y,1);
	
	vec3 rec_y = vec3(uv_center.y * size_modifier * uv_center.y * size_modifier);
	vec4 rec = vec4(4.0 * rec_y,1);
	
	COLOR = circle / rec + circle;
	COLOR = circle / rec;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
