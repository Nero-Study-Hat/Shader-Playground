vec2 MTH_rotate_vec2(vec2 input, float angle)
{
	angle *= PI / 180.0;
    float sine = sin(angle);
	float cosine = cos(angle);
	mat2 rot_matrix = mat2(vec2(cosine,-sine),vec2(sine,cosine));
	return input * rot_matrix;
}