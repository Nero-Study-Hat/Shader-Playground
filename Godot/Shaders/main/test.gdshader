shader_type canvas_item;
//render_mode world_vertex_coords;

#include "res://Shaders/lib/main.gdshaderinc"

vec4 ref_new_ring_circle(vec2 uv, float size_modifier)
{
	float d =  length(uv) * size_modifier;
	d = abs(d - 0.5);
	d = smoothstep(0.0, 0.1,d);
	return vec4(d,d,d,1);
}

float sdRoundedBox( vec2 p, vec2 b, vec4 r )
{
    r.xy = (p.x>0.0) ? r.xy : r.zw;
    r.x  = (p.y>0.0) ? r.x  : r.y;
    vec2 q = abs(p)-b+r.x;
    return min(max(q.x,q.y),0.0) + length(max(q,0.0)) - r.x;
}

void vertex() {
}

void fragment() {
	vec2 uvc = UV_new_center(UV, 1.0);
	uvc = UV_transform(uvc,vec2(0),vec2(0.9),45.0);
	
	//vec4 circle = SH_new_circle(uvc, 3.0, 0.5, false, true);
	//vec4 ring_circle = SH_new_ring_circle(uvc,1.0);
	//COLOR = circle;
	//COLOR = ring_circle;
	
	vec4 rec = SH_new_rectangle(uvc,0.8,true); 
	
	float test = sdRoundedBox(uvc,vec2(0.1),vec4(0.5));
	test = abs(test - 0.5);
	test = 0.2 - smoothstep(0.1,1.0,test);
	
	COLOR = vec4(test,test,test,1);
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
