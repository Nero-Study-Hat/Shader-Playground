shader_type canvas_item;
//render_mode world_vertex_coords;

#include "res://Shaders/lib/main.gdshaderinc"

uniform vec2 res = vec2(1152,643);

void vertex() {
}

void fragment() {
	vec2 uv = UV - .5;
	uv.x *= res.x / res.y;
	COLOR = vec4(uv,0,1);
	
	vec2 bad_uv = UV_generate_from_center(UV, vec2(0),vec2(0),0);
	//COLOR = vec4(bad_uv,0,1);
	vec4 circle = SH_new_circle(bad_uv,.9);
	circle = SH_new_circle(uv,2);
	COLOR = circle;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
