vec2 rotate_vec2(vec2 input, float angle)
{
	angle *= PI / 180.0;
    float sine = sin(angle);
	float cosine = cos(angle);
	mat2 rot_matrix = mat2(vec2(cosine,-sine),vec2(sine,cosine));
	return input * rot_matrix;
}

vec2 new_uv_from_center(vec2 default_uv, float x, float y, float rotation_deg)
{
	vec2 uv_center = 2.0 * default_uv - 1.0;
	vec2 initial = uv_center + vec2(x,y);
	vec2 final = rotate_vec2(initial, rotation_deg);
	return final;
}