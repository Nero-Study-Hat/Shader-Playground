shader_type canvas_item;

#include "res://Shaders/lib/main.gdshaderinc"

vec2 _transformUV(vec2 _uv_transform, vec2 _scale_uv_, vec2 _pivot_scale_uv_){
	_uv_transform = (_uv_transform - _pivot_scale_uv_) * _scale_uv_ + _pivot_scale_uv_; // zoom
	return _uv_transform;
}

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {	
	vec2 uvc = UV_generate_from_center(UV,vec2(0),vec2(100),0);
	vec4 circle = SH_new_circle(uvc,0.01);
	vec4 rec = SH_new_rectangle(uvc,0.01, true);
	
	COLOR = vec4(uvc,0,1);
	COLOR = circle/rec + circle;
	
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
