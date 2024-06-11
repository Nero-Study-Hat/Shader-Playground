shader_type canvas_item;

#include "res://Shaders/lib/main.gdshaderinc"

uniform vec2 resolution = vec2(892,500);

void vertex() {
    //if(VERTEX.x > 0.0 && VERTEX.y < 0.0)
	//{
		//VERTEX.x += 0.1;
	//}
}

void fragment() {
	vec2 uv = UV - .5;
	uv.x *= resolution.x / resolution.y;
	
	vec2 uvc = UV_generate_from_center(UV,vec2(0),vec2(0),0);
	
	vec4 circle = SH_new_circle_flat(uv, 0.1, vec4(1,0,0,1));
	COLOR = circle;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
